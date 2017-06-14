//
//  UIDevice+Hardware.h
//
//  Created by perry on 10/12/15.
//  Copyright © 2015 perry. All rights reserved.
//

#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <mach/mach.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if_var.h>
#import <SystemConfiguration/SystemConfiguration.h>

#import <sys/socket.h>
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <netdb.h>
#import "UIDevice+Hardware.h"

@implementation UIDevice (Hardware)

#pragma mark sysctlbyname utils
- (NSString *) getSysInfoByName:(char *)typeSpecifier
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];

    free(answer);
    return results;
}

- (NSString *) platform
{
    return [self getSysInfoByName:"hw.machine"];
}

- (NSString *) hwmodel
{
    return [self getSysInfoByName:"hw.model"];
}

- (NSString *) UUID
{
	CFUUIDRef uuidObj = CFUUIDCreate(nil);
	NSString *uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuidObj);
	CFRelease(uuidObj);
	return uuidString;
}

#pragma mark sysctl utils
- (unsigned long) getSysInfo: (u_int) typeSpecifier
{
    size_t size = sizeof(int);
    unsigned long results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return results;
}

- (unsigned long) cpuFrequency
{
    return [self getSysInfo:HW_CPU_FREQ];
}

- (unsigned long) busFrequency
{
    return [self getSysInfo:HW_BUS_FREQ];
}

- (unsigned long) cpuCount
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, HW_NCPU};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return results;
}

- (unsigned long) totalMemory
{
    return [self getSysInfo:HW_PHYSMEM];
}

- (unsigned long) userMemory
{
    return [self getSysInfo:HW_USERMEM];
}

- (unsigned long) pageSize {
    return [self getSysInfo:HW_PAGESIZE];
}

- (unsigned long) physicalMemorySize {
    return [self getSysInfo:HW_MEMSIZE];
}

- (unsigned long) maxSocketBufferSize
{
    return [self getSysInfo:KIPC_MAXSOCKBUF];
}

- (double)availableMemory
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    return vm_page_size *vmStats.free_count;
}

- (NSString *)IPAddress {
    NSString *address;
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    if (success == 0)
    {
        temp_addr = interfaces;
        while(temp_addr != NULL)
        {
            if(temp_addr->ifa_addr->sa_family == AF_INET)
            {
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
                {
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    return address;
}

- (double)usedMemory
{
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    
    if (kernReturn != KERN_SUCCESS
        ) {
        return NSNotFound;
    }
    
    return taskInfo.resident_size;
}

- (unsigned long long) totalDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSNumber *value = [fattributes objectForKey:NSFileSystemSize];
    return value ? [value unsignedLongLongValue] : 0;
}

- (unsigned long long) freeDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSNumber *value = [fattributes objectForKey:NSFileSystemFreeSize];
    return value ? [value unsignedLongLongValue] : 0;
}

- (BOOL) hasRetinaDisplay
{
    return ([UIScreen mainScreen].scale >= 2.0f);
}

- (natural_t)getFreeMemory
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    vm_statistics_data_t vm_stat;
    
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        return 0;
    }
    
    unsigned long mem_free = vm_stat.free_count * pagesize;
    return (natural_t)mem_free;
}

#pragma mark MAC addy

- (NSString *) macaddress
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Error: Memory allocation error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2\n");
        free(buf); // Thanks, Remy "Psy" Demerest
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];

    free(buf);
    return [outstring uppercaseString];
}

- (NSArray *)getDataCounters
{
    BOOL success;
    struct ifaddrs *addrs;
    struct ifaddrs *cursor;
    struct if_data *networkStatisc;
    long WiFiSent = 0;
    long WiFiReceived = 0;
    long WWANSent = 0;
    long WWANReceived = 0;
    NSString *name=[[NSString alloc]init];
    success = getifaddrs(&addrs) == 0;
    if (success)
    {
        cursor = addrs;
        while (cursor != NULL)
        {
            name=[NSString stringWithFormat:@"%s",cursor->ifa_name];
            if (cursor->ifa_addr->sa_family == AF_LINK)
            {
                if ([name hasPrefix:@"en"])
                {
                    networkStatisc = (struct if_data *) cursor->ifa_data;
                    WiFiSent+=networkStatisc->ifi_obytes;
                    WiFiReceived+=networkStatisc->ifi_ibytes;
                }
                if ([name hasPrefix:@"pdp_ip"])
                {
                    networkStatisc = (struct if_data *) cursor->ifa_data;
                    WWANSent+=networkStatisc->ifi_obytes;
                    WWANReceived+=networkStatisc->ifi_ibytes;
                }
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return [NSArray arrayWithObjects:[NSNumber numberWithInt:WiFiSent/1024.0], [NSNumber numberWithInt:WiFiReceived/1024.0],[NSNumber numberWithInt:WWANSent/1024.0],[NSNumber numberWithInt:WWANReceived/1024.0], nil];
}
static float preWifi_S = 0,preWifi_R = 0,preWWAN_S = 0,preWWAN_R = 0;
- (NSString *)wifiS_PerSencond {
    if (![[UIDevice currentDeviceNetwork] isEqualToString:@"wifi"]) {
        return @"0";
    }
    float wifiS_preSecond = [[self getDataCounters][0] floatValue] - preWifi_S;
    preWifi_S = [[self getDataCounters][0] floatValue];
    NSString *text;
    if (wifiS_preSecond > 1024.0) {
        text =  [NSString stringWithFormat:@"%.0fMB/s", wifiS_preSecond/1024.0];
    } else {
        text = [NSString stringWithFormat:@"%.0fKB/s",wifiS_preSecond];
    }
    return text;
}
- (NSString *)wifiR_PerSencond {
    if (![[UIDevice currentDeviceNetwork] isEqualToString:@"wifi"]) {
        return @"0";
    }
    float wifiR_preSecond = [[self getDataCounters][1] floatValue] - preWifi_R;
    preWifi_R = [[self getDataCounters][1] floatValue];
    NSString *text;
    if (wifiR_preSecond > 1024.0) {
        text =  [NSString stringWithFormat:@"%.0fMB/s", wifiR_preSecond/1024.0];
    } else {
        text = [NSString stringWithFormat:@"%.0fKB/s",wifiR_preSecond];
    }
    return text;
}
- (NSString *)wwanS_PerSencond {
    if ([[UIDevice currentDeviceNetwork] isEqualToString:@"wifi"] || [[UIDevice currentDeviceNetwork] isEqualToString:@"无网络"]) {
        return @"0";
    }
    float wwanS_preSecond = [[self getDataCounters][2] floatValue] - preWWAN_S;
    preWWAN_S = [[self getDataCounters][2] floatValue];
    NSString *text;
    if (wwanS_preSecond > 1024.0) {
        text =  [NSString stringWithFormat:@"%.0fMB/s", wwanS_preSecond/1024.0];
    } else {
        text = [NSString stringWithFormat:@"%.0fKB/s",wwanS_preSecond];
    }
    return text;
}
- (NSString *)wwanR_PerSencond {
    if ([[UIDevice currentDeviceNetwork] isEqualToString:@"wifi"] || [[UIDevice currentDeviceNetwork] isEqualToString:@"无网络"]) {
        return @"0";
    }
    float wwanR_preSecond = [[self getDataCounters][3] floatValue] - preWWAN_R;
    preWWAN_R = [[self getDataCounters][3] floatValue];
    NSString *text;
    if (wwanR_preSecond > 1024.0) {
        text =  [NSString stringWithFormat:@"%.0fMB/s", wwanR_preSecond/1024.0];
    } else {
        text = [NSString stringWithFormat:@"%.0fKB/s",wwanR_preSecond];
    }
    return text;
}
#pragma mark - JailBroken

- (BOOL)isJB
{
    NSString *aptPath = @"/private/var/lib/apt/";
    return [[NSFileManager defaultManager] fileExistsAtPath:aptPath] ? YES : NO;
}

- (BOOL)isCYExist
{
    NSString *cyPath = @"/Applications/Cydia.app";
    return [[NSFileManager defaultManager] fileExistsAtPath:cyPath] ? YES : NO;
}
+ (NSString *)currentDeviceNetwork {
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    NSString *state = @"2g";
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"] intValue];
            
            switch (netType) {
                case 0:
                    state = @"无网络";
                    //无网模式
                    break;
                case 1:
                    state = @"2g";
                    break;
                case 2:
                    state = @"4g";
                    break;
                case 3:
                    state = @"4g";
                    break;
                case 5:
                {
                    state = @"wifi";
                }
                    break;
                default:
                    break;
            }
        }
    }
    return state;
}
@end

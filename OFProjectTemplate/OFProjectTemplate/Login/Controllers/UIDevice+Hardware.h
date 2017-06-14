//
//  UIDevice+Hardware.m
//
//  Created by perry on 10/12/15.
//  Copyright © 2015 perry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#define iPhone4 ([[UIDevice currentDevice].platform containsString:@"iPhone3"])
#define iPhone4s ([[UIDevice currentDevice].platform containsString:@"iPhone4"])
#define iPhone5 ([[UIDevice currentDevice].platform containsString:@"iPhone5"])
#define iPhone5s ([[UIDevice currentDevice].platform containsString:@"iPhone6"])
#define iPhone6 ([[UIDevice currentDevice].platform containsString:@"iPhone7,2"])
#define iPhone6p ([[UIDevice currentDevice].platform containsString:@"iPhone7,1"])
#define iPhone6s ([[UIDevice currentDevice].platform containsString:@"iPhone8,2"])
#define iPhone6sp ([[UIDevice currentDevice].platform containsString:@"iPhone8,1"])
#define iPhone7 ([[UIDevice currentDevice].platform containsString:@"iPhone9,1"])
#define iPhone7p ([[UIDevice currentDevice].platform containsString:@"iPhone9,2"])

#define IOS8Later (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)
#define IOS7Later (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)

#define Display640Less ([[UIScreen mainScreen] currentMode].size.width <= 640)
#define DisplayScale [UIScreen mainScreen].scale

@interface UIDevice (Hardware)
/**
 返回设备模型标识
 @return @"i386"      on the simulator
 @return @"iPod1,1"   on iPod Touch
 @return @"iPod2,1"   on iPod Touch Second Generation
 @return @"iPod3,1"   on iPod Touch Third Generation
 @return @"iPod4,1"   on iPod Touch Fourth Generation
 @return @"iPod5,1"   on iPod Touch Fifth Generation
 @return @"iPhone1,1" on iPhone
 @return @"iPhone1,2" on iPhone 3G
 @return @"iPhone2,1" on iPhone 3GS
 @return @"iPad1,1"   on iPad
 @return @"iPad2,1"   on iPad 2
 @return @"iPad3,1"   on 3rd Generation iPad
 @return @"iPad3,2":  on iPad 3(GSM+CDMA)
 @return @"iPad3,3":  on iPad 3(GSM)
 @return @"iPad3,4":  on iPad 4(WiFi)
 @return @"iPad3,5":  on iPad 4(GSM)
 @return @"iPad3,6":  on iPad 4(GSM+CDMA)
 @return @"iPhone3,1" on iPhone 4
 @return @"iPhone4,1" on iPhone 4S
 @return @"iPhone5,1" on iPhone 5
 @return @"iPad3,4"   on 4th Generation iPad
 @return @"iPad2,5"   on iPad Mini
 @return @"iPhone5,1" on iPhone 5(GSM)
 @return @"iPhone5,2" on iPhone 5(GSM+CDMA)
 @return @"iPhone5,3  on iPhone 5c(GSM)
 @return @"iPhone5,4" on iPhone 5c(GSM+CDMA)
 @return @"iPhone6,1" on iPhone 5s(GSM)
 @return @"iPhone6,2" on iPhone 5s(GSM+CDMA)
 @return @"iPhone7,1" on iPhone 6 Plus
 @return @"iPhone7,2" on iPhone 6
 @return @"iPhone8,1" on iPhone 6s Plus
 @return @"iPhone8,2" on iPhone 6s
 @return @"iPhone9,1" on iPhone 7
 @return @"iPhone9,2" on iPhone 7p
 */
- (NSString *) platform;

- (NSString *) hwmodel;
- (NSString *) UUID;
+ (NSString *)currentDeviceNetwork;
- (unsigned long) cpuFrequency;
- (unsigned long) busFrequency;
- (unsigned long) cpuCount;
- (unsigned long) totalMemory;
- (unsigned long) userMemory;
- (unsigned long) pageSize;
- (unsigned long) physicalMemorySize;
- (unsigned long) maxSocketBufferSize;
- (unsigned long long) totalDiskSpace;
- (unsigned long long) freeDiskSpace;
- (natural_t)getFreeMemory;
- (NSString *)IPAddress;
- (double)availableMemory;
- (double)usedMemory;
- (NSString *) macaddress;
- (BOOL) hasRetinaDisplay;
- (NSString *)wifiS_PerSencond;
- (NSString *)wifiR_PerSencond;
- (NSString *)wwanS_PerSencond;
- (NSString *)wwanR_PerSencond;

#pragma mark - JailBroken

- (BOOL)isJB;
- (BOOL)isCYExist;

@end

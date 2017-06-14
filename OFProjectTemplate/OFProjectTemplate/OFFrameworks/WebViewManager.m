//
//  WebViewManager.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "WebViewManager.h"

@implementation WebViewManager
+ (void)clearWebCacheCompleted:(void (^)(void))block {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *filePaths = [self webCacheFilePaths];
        for (NSString *path in filePaths) {
            [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        }
        if (block) {
            dispatch_async(dispatch_get_main_queue(), ^{
                block();
            });
        }
    });
}


+ (long long)webCacheSize {
    long long totalSize = 0;
    NSArray *filePaths = [self webCacheFilePaths];
    for (NSString *path in filePaths) {
        totalSize += [self folderSizeAtPath:path];
    }
    return totalSize;
}

+ (NSArray *)webCacheFilePaths {
    NSString *libraryDir = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                                               NSUserDomainMask, YES)[0];
    NSString *bundleId  =  [[[NSBundle mainBundle] infoDictionary]
                            objectForKey:@"CFBundleIdentifier"];
    NSString *webkitFolderInLib = [NSString stringWithFormat:@"%@/WebKit",libraryDir];
    NSString *webKitFolderInCaches = [NSString
                                      stringWithFormat:@"%@/Caches/%@/WebKit",libraryDir,bundleId];
    NSString *webKitFolderInCachesfs = [NSString
                                        stringWithFormat:@"%@/Caches/%@/fsCachedData",libraryDir,bundleId];
    
    NSString *cookiesFolderPath = [libraryDir stringByAppendingString:@"/Cookies"];
    
    return @[webkitFolderInLib,webKitFolderInCaches,webKitFolderInCachesfs,cookiesFolderPath];
}
+ (long long ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}
+ (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

@end

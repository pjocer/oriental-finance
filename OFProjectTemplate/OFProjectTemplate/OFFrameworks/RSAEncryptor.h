//
//  RSAEncryptor.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/7.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    //md2 16字节长度
    CCDIGEST_MD2 = 1000,
    //md4 16字节长度
    CCDIGEST_MD4,
    //md5 16字节长度
    CCDIGEST_MD5,
    //sha1 20字节长度
    CCDIGEST_SHA1,
    //SHA224 28字节长度
    CCDIGEST_SHA224,
    //SHA256 32字节长度
    CCDIGEST_SHA256,
    //SHA384 48字节长度
    CCDIGEST_SHA384,
    //SHA512 64字节长度
    CCDIGEST_SHA512,
} CCDIGESTAlgorithm;

@interface RSAEncryptor : NSObject

/**
 *  加密方法
 *
 *  @param str   需要加密的字符串
 *  @param path  '.der'格式的公钥文件路径
 */
+ (NSString *)encryptString:(NSString *)str publicKeyWithContentsOfFile:(NSString *)path;

/**
 *  解密方法
 *
 *  @param str       需要解密的字符串
 *  @param path      '.p12'格式的私钥文件路径
 *  @param password  私钥文件密码
 */
+ (NSString *)decryptString:(NSString *)str privateKeyWithContentsOfFile:(NSString *)path password:(NSString *)password;

/**
 *  加密方法
 *
 *  @param str    需要加密的字符串
 *  @param pubKey 公钥字符串
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;

/**
 *  解密方法
 *
 *  @param str     需要解密的字符串
 *  @param privKey 私钥字符串
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;

+ (NSString *)signString:(NSString *)str CCDIGESTAlgorithm:(CCDIGESTAlgorithm)algorithm privatePath:(NSString *)filePath password:(NSString *)password;

@end

//
//  HSSoftwareVerisonDAL.h
//  HSWordsPass
//
//  Created by yang on 14-8-28.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SoftwareVersionModel;

@interface HSSoftwareVerisonDAL : NSObject

+ (void)saveSoftwareVersionWithVersion:(NSString *)version dbVersion:(NSString *)dbVersion launched:(BOOL)launched;

+ (NSArray *)querySoftwareVersionInfos;

+ (SoftwareVersionModel *)querySoftwareVersionWithVersion:(NSString *)version;

+ (BOOL)isLaunchedWithVersion:(NSString *)version;

@end

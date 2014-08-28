//
//  HSSoftwareVerisonDAL.m
//  HSWordsPass
//
//  Created by yang on 14-8-28.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import "HSSoftwareVerisonDAL.h"
#import "SoftwareVersionModel.h"

@implementation HSSoftwareVerisonDAL

+ (void)saveSoftwareVersionWithVersion:(NSString *)version dbVersion:(NSString *)dbVersion launched:(BOOL)launched
{
    SoftwareVersionModel *soft = [self querySoftwareVersionWithVersion:version];
    if ([soft.version isEqualToString:version])
    {
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            SoftwareVersionModel *tSoft = [soft inContext:localContext];
            tSoft.dbVersion = version;
            tSoft.launchedValue = launched;
        }completion:^(BOOL success, NSError *error) {
            DLog(@"更新 error: %@", error);
        }];
    }
    else
    {
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            SoftwareVersionModel *tSoft = [SoftwareVersionModel createEntityInContext:localContext];
            tSoft.version = version;
            tSoft.dbVersion = version;
            tSoft.launchedValue = launched;
        } completion:^(BOOL success, NSError *error) {
            DLog(@"保存 error: %@", error);
        }];
    }
}

+ (NSArray *)querySoftwareVersionInfos
{
    NSManagedObjectContext *context = [NSManagedObjectContext contextForCurrentThread];
    NSArray *arrSoftware = [SoftwareVersionModel findAllInContext:context];
    return arrSoftware;
}

+ (SoftwareVersionModel *)querySoftwareVersionWithVersion:(NSString *)version
{
    NSManagedObjectContext *context = [NSManagedObjectContext contextForCurrentThread];
    SoftwareVersionModel *softwareVersion = [SoftwareVersionModel findFirstByAttribute:@"version" withValue:version inContext:context];
    return softwareVersion;
}

+ (BOOL)isLaunchedWithVersion:(NSString *)version
{
    SoftwareVersionModel *soft = [self querySoftwareVersionWithVersion:version];
    DLog(@"soft: %@", soft);
    if (soft && soft.launchedValue){
        return YES;
    }else{
        return NO;
    }
}

@end

//
//  HSWordBookDAL.h
//  HSWordsPass
//
//  Created by yang on 14-8-28.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WordBookModel;

@interface HSWordBookDAL : NSObject


#pragma mark - 数据的数据库操作
+ (void)saveWordBookWithBookID:(NSString *)bID categoryID:(NSString *)cID name:(NSString *)name picture:(NSString *)picture;

+ (NSArray *)queryWordBookInfos;

+ (NSArray *)queryWordBookInfosWithCategoryID:(NSString *)cID;

+ (WordBookModel *)queryWordBookWithCategoryID:(NSString *)cID bookID:(NSString *)bID;

+ (NSInteger)wordBookCount;

+ (NSInteger)wordBookCountWithCategoryID:(NSString *)cID;

@end

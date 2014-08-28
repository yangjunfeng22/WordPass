//
//  HSWordBookDAL.m
//  HSWordsPass
//
//  Created by yang on 14-8-28.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import "HSWordBookDAL.h"
#import "WordBookModel.h"

@implementation HSWordBookDAL


#pragma mark - 数据的数据库操作
+ (void)saveWordBookWithBookID:(NSString *)bID categoryID:(NSString *)cID name:(NSString *)name picture:(NSString *)picture
{
    WordBookModel *wordBook = [self queryWordBookWithCategoryID:cID bookID:bID];
    // 不支持后台动态调整词书所属的词书种类。这里是一本词书是固定属于一种词书种类的。
    if ([wordBook.cID isEqualToString:cID] && [wordBook.bID isEqualToString:bID])
    {
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            WordBookModel *tWordBook = [wordBook inContext:localContext];
            tWordBook.name = name;
            tWordBook.picture = picture;
        }completion:^(BOOL success, NSError *error) {
            DLog(@"更新 error: %@", error);
        }];
    }
    else
    {
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            WordBookModel *tWordBook = [WordBookModel createEntityInContext:localContext];
            tWordBook.cID = cID;
            tWordBook.bID = bID;
            tWordBook.name = name;
            tWordBook.picture = picture;
        } completion:^(BOOL success, NSError *error) {
            DLog(@"保存 error: %@", error);
        }];
    }
}

+ (NSArray *)queryWordBookInfos
{
    NSManagedObjectContext *context = [NSManagedObjectContext contextForCurrentThread];
    NSArray *arrSoftware = [WordBookModel findAllInContext:context];
    return arrSoftware;
}

+ (NSArray *)queryWordBookInfosWithCategoryID:(NSString *)cID
{
    NSManagedObjectContext *context = [NSManagedObjectContext contextForCurrentThread];
    NSArray *arrWordBooks = [WordBookModel findByAttribute:@"cID" withValue:cID inContext:context];
    return arrWordBooks;
}

+ (WordBookModel *)queryWordBookWithCategoryID:(NSString *)cID bookID:(NSString *)bID
{
    NSManagedObjectContext *context = [NSManagedObjectContext contextForCurrentThread];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cID == %@ AND bID == %@", cID, bID];
    WordBookModel *wordBook = (WordBookModel *)[WordBookModel findFirstWithPredicate:predicate inContext:context];
    return wordBook;
}

+ (NSInteger)wordBookCount
{
    NSManagedObjectContext *context = [NSManagedObjectContext contextForCurrentThread];
    NSInteger count = [WordBookModel countOfEntitiesWithContext:context];
    return count;
}

+ (NSInteger)wordBookCountWithCategoryID:(NSString *)cID
{
    NSManagedObjectContext *context = [NSManagedObjectContext contextForCurrentThread];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cID == %@", cID];
    NSInteger count = [WordBookModel countOfEntitiesWithPredicate:predicate inContext:context];
    return count;
}

@end

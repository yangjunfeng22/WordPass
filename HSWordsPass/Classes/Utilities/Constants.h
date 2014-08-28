//
//  Constants.h
//  HSWordsPass
//
//  Created by yang on 14-8-28.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#ifndef HSWordsPass_Constants_h
#define HSWordsPass_Constants_h

#define kSoftwareVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#ifdef DEBUG
#define kDownloadingPath [kDocumentPath stringByAppendingPathComponent:@"Downloading"]
#define kDownloadedPath  [kDocumentPath stringByAppendingPathComponent:@"Downloaded"]
#else
#define kDownloadingPath [kCachePath stringByAppendingPathComponent:@"Downloading"]
#define kDownloadedPath [kCachePath stringByAppendingPathComponent:@"Downloaded"]
#endif

#define kIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define kWhiteColor [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f]
#define kBlackColor [[UIColor alloc] initWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f]

#endif

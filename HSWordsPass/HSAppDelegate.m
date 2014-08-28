//
//  HSAppDelegate.m
//  HSWordsPass
//
//  Created by yang on 14-7-8.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import "HSAppDelegate.h"
#import "HSRootViewController.h"
#import "UIGuidViewController.h"
#import "UINavigationController+Extern.h"
#import "HSSoftwareVerisonDAL.h"
#import "HSRemoteNotificationHelper.h"

@interface HSAppDelegate ()<UIGuidViewControllerDelegate>
{
    
}

@end

@implementation HSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MagicalRecord setupAutoMigratingCoreDataStack];
    //[MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelVerbose];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = kWhiteColor;
    
    [self dealFirstLaunch];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming   phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [HSRemoteNotificationHelper registerForRemoteNotificationToGetToken];
    });
    // hide the badge
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [MagicalRecord cleanUp];
}

#pragma mark - 消息服务的注册与接收
// 消息通知服务
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //NSLog(@"register success: %@", deviceToken);
    // 将device token转换为字符串
    NSString *strDeviceToken = [[NSString alloc] initWithFormat:@"%@", deviceToken];
    // 注册成功，将deviceToken保存到应用服务器数据库中
    strDeviceToken = [[strDeviceToken substringWithRange:NSMakeRange(0, 72)] substringWithRange:NSMakeRange(1, 71)];
    // 将deviceToken保存在NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    // 保存device token令牌， 并且去掉空格
    NSString *strNEToken = [strDeviceToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    [userDefaults setObject:strNEToken forKey:kDeviceTokenStringKey];
    // send deviceToken to the service provider
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 没有在service provider注册device token，需要发送令牌到服务器
        if (![userDefaults boolForKey:kDeviceTokenRegisteredKey])
        {
            //NSLog(@"没有注册Device token");
            [HSRemoteNotificationHelper sendProviderDeviceToken:strDeviceToken];
        }
    });
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // 处理推送消息
    application.applicationIconBadgeNumber += 1;
    // 当用户打开程序时候收到远程通知执行下面代码
    if (application.applicationState == UIApplicationStateActive)
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            // hide the badge
            application.applicationIconBadgeNumber = 0;
            
            // ask the provider to set the badgenumber to zero
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSString *strDeviceToken = [userDefaults objectForKey:kDeviceTokenStringKey];
            [HSRemoteNotificationHelper resetBadgeNumberOnProviderWithDeviceToken:strDeviceToken];
        });
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    //NSLog(@"regist failed: %@", error);
     NSString *msg = [[NSString alloc] initWithFormat:@"%@", error.localizedDescription];
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
     [alert show];
}

#pragma mark - Custom Manager

#pragma mark - 处理是否是第一次打开程序/是更新后的第一次打开程序
- (void)dealFirstLaunch
{
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    BOOL isLaunched = [HSSoftwareVerisonDAL isLaunchedWithVersion:kSoftwareVersion];
    CFTimeInterval end = CFAbsoluteTimeGetCurrent();
    DLog(@"查询用时: %f", end-start);
    if (isLaunched)
    {
        [self initRootViewController];
    }
    else
    {
        [self initGuidViewController];
    }
}

#pragma mark - 初始化HSRootViewController
- (void)initRootViewController
{
    [UINavigationController customizeNavigationBarAppearance];
    
    if (kIOS7)
    {
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }
    
    HSRootViewController *rootViewController = [[HSRootViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    self.navigationController = nav;
    self.window.rootViewController = self.navigationController;
}

#pragma mark - Custom Guid/Root ViewController
- (void)initGuidViewController
{
    NSArray *arrImages = @[@"G2.jpg", @"G3.jpg", @"G4.jpg", @"G5.jpg", @"G6.jpg"];
    UIGuidViewController *guidViewController = [[UIGuidViewController alloc] initWithNibName:nil bundle:nil guidPages:arrImages];
    guidViewController.delegate = self;
    self.window.rootViewController = guidViewController;
    
    [UIApplication sharedApplication].statusBarHidden = YES;
}

#pragma mark - UIGuidViewController Delegate
- (void)guidViewController:(UIGuidViewController *)controller experienceAction:(id)sender
{
    //只要这个引导界面点击了体验按钮(暂定, 也可能是其他名称的按钮), 就设置第一次启动为NO。
    [UIView animateWithDuration:0.3f animations:^{
        self.window.rootViewController.view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.window.rootViewController dismissViewControllerAnimated:YES completion:^{}];
        [self initRootViewController];
        
        // 当前软件已经进入体验模式
        CFTimeInterval start = CFAbsoluteTimeGetCurrent();
        [HSSoftwareVerisonDAL saveSoftwareVersionWithVersion:kSoftwareVersion dbVersion:kSoftwareVersion launched:YES];
        CFTimeInterval end = CFAbsoluteTimeGetCurrent();
        NSLog(@"保存用时: %f", end-start);
    }];
}

@end

//
//  HSRootViewController.m
//  HSWordsPass
//
//  Created by yang on 14-8-5.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import "HSRootViewController.h"
#import "UINavigationController+Extern.h"
#import "HSWordBookDAL.h"

@interface HSRootViewController ()

@end

@implementation HSRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController setNavigationBarShadow];
    
    // 这个之前考虑是否需要先弹出登陆界面。
    NSInteger count = [HSWordBookDAL wordBookCount];
    if (count > 0)
    {
        // 直接进入学习
    }
    else
    {
        // 进入教材下载界面, 或者进入教材种类选择界面。
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

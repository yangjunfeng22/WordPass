//
//  UINavigationController+Extern.m
//  HSWordsPass
//
//  Created by yang on 14-8-28.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import "UINavigationController+Extern.h"

@implementation UINavigationController (Extern)

#pragma mark - customize NavigationBar
+ (void)customizeNavigationBarAppearance
{
    if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)){
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        
    }else{
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    }
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithWhite:1.0f alpha:0.7f];
    shadow.shadowOffset = CGSizeMake(0.0f, 1.0f);
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], UITextAttributeTextColor, [UIColor colorWithWhite:1.0f alpha:0.7f], UITextAttributeTextShadowColor, [UIFont fontWithName:@"Helvetica" size:18.0f], UITextAttributeFont, nil]];
}

- (void)setNavigationBarShadow
{
    [self.navigationBar setBackgroundColor:[UIColor whiteColor]];
    CALayer *navLayer = self.navigationBar.layer;
    
    navLayer.masksToBounds = NO;
    navLayer.shadowColor = [UIColor blackColor].CGColor;
    navLayer.shadowOffset = CGSizeMake(0.0f, 3.0f);
    navLayer.shadowOpacity = 0.25f;
    navLayer.shadowPath = [UIBezierPath bezierPathWithRect:self.navigationBar.bounds].CGPath;
    
    navLayer.borderWidth = 2.0f;
    navLayer.borderColor = [UIColor whiteColor].CGColor;
    
    navLayer.shouldRasterize = YES;
}

@end

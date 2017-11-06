//
//  TLMineViewController.m
//  TLTabBarControllerDemo
//
//  Created by 李伯坤 on 2017/11/6.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "TLMineViewController.h"

@interface TLMineViewController ()

@end

@implementation TLMineViewController

- (void)loadView
{
    [super loadView];
    
    [self setTitle:@"我的"];
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jianshu.com/u/8dabd0639b26"]]];
    [self.view addSubview:webView];
    
    UIBarButtonItem *clearBadgeButton = [[UIBarButtonItem alloc] initWithTitle:@"消除红点" style:UIBarButtonItemStylePlain target:self action:@selector(clearBadgeButtonClick)];
    [self.navigationItem setRightBarButtonItem:clearBadgeButton];
}

- (void)clearBadgeButtonClick
{
    [self.tabBarItem setBadgeValue:nil];
}

@end

//
//  TLLoginViewController.m
//  TLTabBarControllerDemo
//
//  Created by 李伯坤 on 2017/9/18.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "TLLoginViewController.h"

@interface TLLoginViewController ()

@end

@implementation TLLoginViewController

- (void)loadView
{
    [super loadView];
    
    [self setTitle:@"切换鉴权"];
    
    CGFloat y = self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat height = (self.view.frame.size.height - y) / 2;
    CGFloat width = self.view.frame.size.width;
    
    UIButton *yesButton = [[UIButton alloc] initWithFrame:CGRectMake(0, y, width, height)];
    [yesButton setTitle:@"允许切换" forState:UIControlStateNormal];
    [yesButton setBackgroundColor:[UIColor blueColor]];
    [yesButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yesButton];
    
    UIButton *noButton = [[UIButton alloc] initWithFrame:CGRectMake(0, y + height, width, height)];
    [noButton setTitle:@"禁止切换" forState:UIControlStateNormal];
    [noButton setBackgroundColor:[UIColor redColor]];
    [noButton setTag:1];
    [noButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:noButton];
}

- (void)buttonClick:(UIButton *)sender
{
    if (self.allowChangeTabBarItem) {
        self.allowChangeTabBarItem(sender.tag == 0);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

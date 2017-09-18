//
//  AppDelegate.m
//  TLTabBarController
//
//  Created by 李伯坤 on 2017/9/15.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "AppDelegate.h"
#import "TLTabBarController.h"
#import "TLDemoTableViewController.h"
#import "SVProgressHUD.h"
#import "TLLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setMaximumDismissTimeInterval:0.5];
    
    [self loadUI];
    return YES;
}

#pragma mark - # Load UI
- (void)loadUI
{
//    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    TLTabBarController *tabBarController = [[TLTabBarController alloc] init];
    
    
    TLDemoTableViewController *vc1 = [[TLDemoTableViewController alloc] init];
    UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    [vc1 setTitle:@"首页"];
    [vc1.tabBarItem setImage:[UIImage imageNamed:@"home"]];
    [vc1.tabBarItem setSelectedImage:[UIImage imageNamed:@"homeHL"]];
    [tabBarController addChildViewController:navC1];
    
    
    TLDemoTableViewController *vc2 = [[TLDemoTableViewController alloc] init];
    UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    [tabBarController addChildViewController:navC2];
    [vc2 setTitle:@"分类"];
    [vc2.tabBarItem setImage:[UIImage imageNamed:@"cate"]];
    [vc2.tabBarItem setSelectedImage:[UIImage imageNamed:@"cateHL"]];

    UITabBarItem *addItem = [[UITabBarItem alloc] initWithTitle:@"发布" image:[UIImage imageNamed:@"publish"] selectedImage:[UIImage imageNamed:@"publish"]];
    [tabBarController addPlusItemWithSystemTabBarItem:addItem actionBlock:^{
        [SVProgressHUD showInfoWithStatus:@"发布"];
    }];
    
    TLDemoTableViewController *vc3 = [[TLDemoTableViewController alloc] init];
    UINavigationController *navC3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    __weak TLTabBarController *weakTabBarController = tabBarController;
    [tabBarController addChildViewController:navC3 actionBlock:^BOOL {
        TLLoginViewController *vc = [[TLLoginViewController alloc] init];
        [vc setAllowChangeTabBarItem:^(BOOL ok){
            if (ok) {
                [weakTabBarController setSelectedIndex:3];
            }
            else {
                [SVProgressHUD showErrorWithStatus:@"禁止切换"];
            }
        }];
        UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
        [weakTabBarController presentViewController:navC animated:YES completion:nil];
        return NO;
    }];
    [vc3 setTitle:@"消息"];
    [vc3.tabBarItem setImage:[UIImage imageNamed:@"msg"]];
    [vc3.tabBarItem setSelectedImage:[UIImage imageNamed:@"msgHL"]];
    [vc3.tabBarItem setBadgeValue:@"3"];
    
    TLDemoTableViewController *vc4 = [[TLDemoTableViewController alloc] init];
    UINavigationController *navC4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    [tabBarController addChildViewController:navC4 actionBlock:^BOOL{
        [SVProgressHUD showSuccessWithStatus:@"进入我的界面"];
        return YES;
    }];
    [vc4 setTitle:@"我的"];
    [vc4.tabBarItem setImage:[UIImage imageNamed:@"mine"]];
    [vc4.tabBarItem setSelectedImage:[UIImage imageNamed:@"mineHL"]];
    [vc4.tabBarItem setBadgeValue:@""];
    
    
    // 选中
    [tabBarController setSelectedIndex:1];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:tabBarController];
    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];
}



@end

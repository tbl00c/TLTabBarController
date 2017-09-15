//
//  TLDemoTableViewController.m
//  TabBarTest
//
//  Created by 李伯坤 on 2017/9/13.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "TLDemoTableViewController.h"
#import "SVProgressHUD.h"
#import "UITabBar+TLExtension.h"

@interface TLDemoTableViewController ()

@end

@implementation TLDemoTableViewController

- (void)tabBarItemDidClick:(BOOL)isSelected
{
//    NSString *title = [NSString stringWithFormat:@"Did click %@ (%@)", self.title, isSelected ? @"isSelected" : @"unSelected"];
//    [SVProgressHUD showInfoWithStatus:title];
}

- (void)tabBarItemDidDoubleClick
{
    NSString *title = [NSString stringWithFormat:@"Did double click %@", self.title];
    [SVProgressHUD showInfoWithStatus:title];
    [self.tableView setContentOffset:CGPointZero];
}

#pragma mark - # Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIBarButtonItem *presentBarButton = [[UIBarButtonItem alloc] initWithTitle:@"present" style:UIBarButtonItemStyleDone target:self action:@selector(presentVC)];
    UIBarButtonItem *dismissBarButton = [[UIBarButtonItem alloc] initWithTitle:@"dismiss" style:UIBarButtonItemStyleDone target:self action:@selector(dismissVC)];
    UIBarButtonItem *pushBarButton = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStyleDone target:self action:@selector(pushVC)];
    
    if (self.tag == 0) {        // 首页
        [self.navigationItem setLeftBarButtonItem:presentBarButton];
        [self.navigationItem setRightBarButtonItem:pushBarButton];
    }
    else if (self.tag == 1) {   // present
        [self.navigationItem setLeftBarButtonItem:dismissBarButton];
        [self.navigationItem setRightBarButtonItem:presentBarButton];
    }
    else if (self.tag == 2) {   // push
        [self.navigationItem setRightBarButtonItem:pushBarButton];
    }
}

#pragma mark - # Event Response
- (void)presentVC
{
    TLDemoTableViewController *vc = [[TLDemoTableViewController alloc] init];
    [vc setTag:1];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navC animated:YES completion:nil];
}

- (void)dismissVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)pushVC
{
    TLDemoTableViewController *vc = [[TLDemoTableViewController alloc] init];
    [vc setTag:2];
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    if (self.tag == 0) {
        [self setHidesBottomBarWhenPushed:NO];
    }
}

#pragma mark - # Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
        case 1:
            return 2;
        case 2:
            return 2;
        case 3:
            return 3;
        case 4:
            return 2;
        case 5:
            return 5;
        case 6:
            return 3;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
    NSString *title;
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                title = @"默认";
                break;
            case 1:
                title = @"白色";
                break;
        }
    }
    else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                title = @"默认";
                break;
            case 1:
                title = @"红色";
                break;
        }
    }
    else if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                title = @"默认";
                break;
            case 1:
                title = @"绿色";
                break;
        }
    }
    else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            title = @"self.title";
        }
        else if (indexPath.row == 1) {
            title = @"超长title";
        }
        else if (indexPath.row == 2) {
            title = @"隐藏";
        }
    }
    else if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            title = @"红色";
        }
        else if (indexPath.row == 1) {
            title = @"橘黄色";
        }
    }
    else if (indexPath.section == 5){
        if (indexPath.row == 0) {
            title = @"显示3";
        }
        else if (indexPath.row == 1) {
            title = @"显示new";
        }
        else if (indexPath.row == 2) {
            title = @"显示Hello world";
        }
        else if (indexPath.row == 3) {
            title = @"显示点";
        }
        else if (indexPath.row == 4) {
            title = @"隐藏";
        }
    }
    else if (indexPath.section == 6) {
        if (indexPath.row == 0) {
            title = @"默认";
        }
        else if (indexPath.row == 1) {
            title = @"紫红色";
        }
        else if (indexPath.row == 2) {
            title = @"隐藏";
        }
    }
    
    [cell.textLabel setText:title];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self.tabBarController.tabBar setBarTintColor:nil];
        }
        else if (indexPath.row == 1) {
            [self.tabBarController.tabBar setBarTintColor:[UIColor whiteColor]];
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [self.tabBarController.tabBar setTintColor:nil];
        }
        else if (indexPath.row == 1) {
            [self.tabBarController.tabBar setTintColor:[UIColor redColor]];
        }
    }
    else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            [self.tabBarController.tabBar setUnselectedItemTintColor:nil];
        }
        else if (indexPath.row == 1) {
            [self.tabBarController.tabBar setUnselectedItemTintColor:[UIColor greenColor]];
        }
    }
    else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            [self.tabBarItem setTitle:self.title];
        }
        else if (indexPath.row == 1) {
            [self.tabBarItem setTitle:@"超长title测试，This is a test"];
        }
        else if (indexPath.row == 2) {
            [self.tabBarItem setTitle:nil];
        }
    }
    else if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            [self.tabBarItem setBadgeColor:[UIColor redColor]];
        }
        else if (indexPath.row == 1) {
            [self.tabBarItem setBadgeColor:[UIColor orangeColor]];
        }
    }
    else if (indexPath.section == 5) {
        if (indexPath.row == 0) {
            [self.tabBarItem setBadgeValue:@"3"];
        }
        else if (indexPath.row == 1) {
            [self.tabBarItem setBadgeValue:@"new"];
        }
        else if (indexPath.row == 2) {
            [self.tabBarItem setBadgeValue:@"Hello world"];
        }
        else if (indexPath.row == 3) {
            [self.tabBarItem setBadgeValue:@""];
        }
        else if (indexPath.row == 4) {
            [self.tabBarItem setBadgeValue:nil];
        }
    }
    else if (indexPath.section == 6) {
        if (indexPath.row == 0) {
            [self.tabBarController.tabBar setShadowColor:[UIColor colorWithWhite:0.7 alpha:1.0]];
        }
        else if (indexPath.row == 1) {
            [self.tabBarController.tabBar setShadowColor:[UIColor magentaColor]];
        }
        else if (indexPath.row == 2) {
            [self.tabBarController.tabBar setHiddenShadow:YES];
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"barTintColor";
        case 1:
            return @"tintColor";
        case 2:
            return @"unselectedItemTintColor";
        case 3:
            return @"Item Title";
        case 4:
            return @"Badge Color";
        case 5:
            return @"Badge Value";
        case 6:
            return @"Shadow";
    }
    return nil;
}

@end

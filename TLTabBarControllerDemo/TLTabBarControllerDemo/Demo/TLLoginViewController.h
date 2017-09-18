//
//  TLLoginViewController.h
//  TLTabBarControllerDemo
//
//  Created by 李伯坤 on 2017/9/18.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLLoginViewController : UIViewController

@property (nonatomic, copy) void (^allowChangeTabBarItem)(BOOL ok);

@end

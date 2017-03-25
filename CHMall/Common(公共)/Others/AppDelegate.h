//
//  AppDelegate.h
//  CHMall
//
//  Created by pro on 2017/1/7.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong)SMTabBarController * tvc;
+ (AppDelegate *)sharedInstance;

@end


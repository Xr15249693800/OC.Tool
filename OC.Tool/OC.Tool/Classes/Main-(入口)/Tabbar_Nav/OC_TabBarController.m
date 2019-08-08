//
//  OC_TabBarController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "OC_TabBarController.h"
#import "HomeViewController.h" //首页
#import "SecondViewController.h" //第二个页面
#import "ThreeViewController.h" //第三个页面
#import "FourViewController.h"

@interface OC_TabBarController ()

@end

@implementation OC_TabBarController
+ (void)initialize {
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = kRGBColor(153, 153, 153);
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = kRGBColor(184, 28, 34);
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    [[UITabBarItem appearance] setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChildVc:[HomeViewController new] title:@"首页" image:@"Home_Nor" selectedImage:@"Home_Sel"];
    [self setupChildVc:[SecondViewController new] title:@"二页" image:@"BBS_Nor" selectedImage:@"BBS_Sel"];
    [self setupChildVc:[ThreeViewController new] title:@"三页" image:@"IWant_Nor" selectedImage:@"IWant_Sel"];
    [self setupChildVc:[FourViewController new] title:@"四页" image:@"Mine_Nor" selectedImage:@"Mine_Sel"];
    
}
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    vc.tabBarItem.selectedImage =  [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    OC_NavigationController *nav = [[OC_NavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end

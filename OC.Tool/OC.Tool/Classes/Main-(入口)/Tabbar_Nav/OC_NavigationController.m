//
//  OC_NavigationController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "OC_NavigationController.h"

@interface OC_NavigationController ()

@end

@implementation OC_NavigationController
+ (void)initialize
{
    [[UITabBar appearance] setTranslucent:NO];
    //当导航栏用在NavigationController中appearance才会生效
    UINavigationBar * bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"Nav_GlobalBg"] forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:20]}];
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    
    NSMutableDictionary * itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    
    
    
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary * itemAttrsa = [NSMutableDictionary dictionary];
    itemAttrsa[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    itemAttrsa[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [item setTitleTextAttributes:itemAttrsa forState:UIControlStateDisabled];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {//如果push进来的不是第一个控制器
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"Global_Back"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"Global_Back"] forState:UIControlStateHighlighted];
        button.size = CGSizeMake(25, 25);
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        //隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:YES];
    
    viewController.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"EEEEEF"];
    viewController.view.backgroundColor = [UIColor colorWithHexString:@"F7F7F7"];
    viewController.navigationController.navigationBar.translucent = NO;
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end

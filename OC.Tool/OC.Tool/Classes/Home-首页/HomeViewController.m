//
//  HomeViewController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    1.添加导航条
    [self.navigationItem setTitleView:[KOC_Control createNavigationNormalTitle:@"首页"]];

}

@end

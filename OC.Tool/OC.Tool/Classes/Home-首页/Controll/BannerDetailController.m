//
//  BannerDetailController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/9.
//  Copyright © 2019 xr. All rights reserved.
//

#import "BannerDetailController.h"

@interface BannerDetailController ()

@end

@implementation BannerDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitleView:[KOC_Control createNavigationNormalTitle:@"广告详情"]];
    NSLog(@"广告详情页");
}

@end

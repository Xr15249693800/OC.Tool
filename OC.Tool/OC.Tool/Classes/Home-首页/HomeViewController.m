//
//  HomeViewController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "HomeViewController.h"
#import "CyclePicView.h"

@interface HomeViewController ()
@property (nonatomic,strong)UIScrollView *mainScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    1.添加导航条
    [self.navigationItem setTitleView:[KOC_Control createNavigationNormalTitle:@"首页"]];
// mainScrollerView
    [self setupMainScrollView];
//    广告位
    [self setupCycleView];
  
}

#pragma mark ======mainScrollerView======
-(void)setupMainScrollView{
    
    UIScrollView *mainScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    [self.view addSubview:mainScroller];
    mainScroller.backgroundColor = [UIColor redColor];
    self.mainScrollView = mainScroller;
}
#pragma mark ======广告位======
-(void)setupCycleView{
    CyclePicView *cycleView = [CyclePicView creatCyclePicView];
    [self.mainScrollView addSubview:cycleView];
    cycleView.frame = CGRectMake(20, 10, kWidth - 40, 125);
    cycleView.layer.masksToBounds = YES;
    cycleView.layer.cornerRadius = 12.0;
    
}
@end

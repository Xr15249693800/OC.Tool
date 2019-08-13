//
//  HomeViewController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "HomeViewController.h"
#import "CyclePicView.h"
#import "Home_menuView.h"

@interface HomeViewController ()
@property (nonatomic,strong)UIScrollView *mainScrollView;
@property (nonatomic,strong)CyclePicView *cycleView;
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
//    菜单栏
    [self setupMenuView];
  
}

#pragma mark ======mainScrollerView======
-(void)setupMainScrollView{
    
    UIScrollView *mainScroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    [self.view addSubview:mainScroller];
    mainScroller.backgroundColor = kAPPBGCOLOR;
    self.mainScrollView = mainScroller;
}
#pragma mark ======广告位======
-(void)setupCycleView{
    CyclePicView *cycleView = [CyclePicView creatCyclePicView];
    [self.mainScrollView addSubview:cycleView];
    cycleView.frame = CGRectMake(20, 10, kWidth - 40, 125);
    cycleView.layer.masksToBounds = YES;
    cycleView.layer.cornerRadius = 12.0;
    self.cycleView = cycleView;
}
#pragma mark ======菜单栏======
-(void)setupMenuView{
    
    Home_menuView *menuView = [Home_menuView CreatHome_menuView];
    menuView.frame = CGRectMake(0, CGRectGetMaxY(self.cycleView.frame)+15, kWidth, 70);
    [self.mainScrollView addSubview:menuView];
}
@end

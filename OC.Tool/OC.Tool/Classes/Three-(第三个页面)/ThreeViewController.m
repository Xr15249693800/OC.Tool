//
//  ThreeViewController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "ThreeViewController.h"

#define MaxY 100
#define targetR 270
#define targetL -270
@interface ThreeViewController ()
@property (nonatomic,weak)UIView*mainView;
@property (nonatomic,weak)UIView*leftView;
@property (nonatomic,weak)UIView*rightView;

@end

@implementation ThreeViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = [KOC_Control createNavigationNormalTitle:@"抽屉效果"];
    [self setUp];
    
//    添加手势
    UIPanGestureRecognizer *panG = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panClick:)];

   [self.mainView addGestureRecognizer:panG];
    
//    给控制器的view添加一个点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];

    [self.view addGestureRecognizer:tap];
    
    
}
-(void)tap{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.mainView.frame = self.view.bounds;
    }];
    
}

-(void)panClick:(UIPanGestureRecognizer *)pan{

//    获取偏移量
    CGPoint transP = [pan translationInView:self.mainView];
    
//    为什么不适用tranFrom 是因为还要修改高度 适用tranFrom只能修改x y
//    self.mainView.transform = CGAffineTransformTranslate(self.mainView.transform, transP.x, 0);
    self.mainView.frame = [self frameWithOffSetX:transP.x];
//    判断拖动的方向 如果transP.x > 0 往右拖  反之往左拖
    if (self.mainView.frame.origin.x > 0) {
//        往右
        self.rightView.hidden = YES;
    }else{
//        往左
        self.rightView.hidden = NO;
    }
//    当手指松开时 做自动定位
    CGFloat target = 0;
    if (pan.state == UIGestureRecognizerStateEnded) {

        if (self.mainView.frame.origin.x > kWidth * 0.5) {
            //        1.判断是当前view的X 有米有大于平屏幕的宽度一半
            target = targetR;
        }else if (CGRectGetMaxX(self.mainView.frame) < kWidth *0.5){
            //        2.view的最大的x值j小于当前view的宽度的一半
            target = targetL;
        }
        
//        计算当前的fram
        CGFloat offset = target - self.mainView.frame.origin.x;
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.mainView.frame = [self frameWithOffSetX:offset];
        }];
      

    }
    
//    复位
    [pan setTranslation:CGPointZero inView:self.mainView];
    
}

//根据偏移量计算main的frame
-(CGRect)frameWithOffSetX:(CGFloat)offsetX{
    
    CGRect frame = self.mainView.frame;
    frame.origin.x += offsetX;
    
//    对计算的结果取绝对值
    CGFloat y = fabs(frame.origin.x * MaxY / kWidth);
    frame.origin.y = y;
    frame.size.height = kHeight - y*2;
    
    return frame;
}

-(void)setUp{
    
//    leftView
    UIView *leftView = [[UIView alloc]initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:leftView];
    self.leftView = leftView;
    
//    rightView
    UIView *rightView = [[UIView alloc]initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:rightView];
    self.rightView = rightView;
    
//    mainView
    UIView *mainView = [[UIView alloc]initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:mainView];
    self.mainView = mainView;
    
    
}


@end

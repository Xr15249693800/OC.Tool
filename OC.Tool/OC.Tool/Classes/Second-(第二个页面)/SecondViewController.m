//
//  SecondViewController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "SecondViewController.h"
#import "GestureUnlockVC.h"
#import "DrawingBoardVC.h"

@interface SecondViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong)UIView *orginView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitleView:[KOC_Control createNavigationNormalTitle:@"二页"]];
    
    [self setupUI];
    
}
-(void)setupUI{
    self.orginView = [[UIView alloc]init];
    [self.view addSubview:self.orginView];
//    self.orginView.sd_layout
//    .centerXEqualToView(self.view)
//    .topEqualToView(self.view)
//    .widthIs(100)
//    .heightIs(100);
    self.orginView.frame = CGRectMake((kWidth - 200)*0.5, (kHeight - 200)*0.5, 200, 200);
    self.orginView.backgroundColor = [UIColor orangeColor];
    self.orginView.userInteractionEnabled = YES;
    UILabel *nameLb = [UILabel new];
//    [self.orginView addSubview:nameLb];
    nameLb.sd_layout
    .centerXEqualToView(self.orginView)
    .centerYEqualToView(self.orginView)
    .widthIs(60)
    .heightIs(25);
    nameLb.text = @"拖拽";
    nameLb.textAlignment = NSTextAlignmentCenter;
    
//    添加一个手势
    [self rotation];
    [self setupPinch];
}

//d点击屏幕跳转到手势解锁页面
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    手势解锁
//    GestureUnlockVC *gestureVC = [GestureUnlockVC new];
//    [self.navigationController pushViewController:gestureVC animated:YES];
    
//    画板
    DrawingBoardVC *boardvc = [[DrawingBoardVC alloc]init];
    [self.navigationController pushViewController:boardvc animated:YES];
    
}

//是否x允许同时支持多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    return YES;
    
}

-(void)rotation{
    
    UIRotationGestureRecognizer *rotationG = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationClick:)];
    rotationG.delegate = self;
    [self.orginView addGestureRecognizer:rotationG];
}

-(void)rotationClick:(UIRotationGestureRecognizer *)rotationG{
    
    self.orginView.transform = CGAffineTransformRotate(self.orginView.transform, rotationG.rotation);
//    复原
    [rotationG setRotation:0];
    
}

-(void)setupPinch{
    UIPinchGestureRecognizer *pinchG = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pincgClick:)];
    pinchG.delegate = self;
    [self.orginView addGestureRecognizer:pinchG];
}

-(void)pincgClick:(UIPinchGestureRecognizer *)pinchG{
    
    NSLog(@"%s",__func__);
    
    
    self.orginView.transform = CGAffineTransformScale(self.orginView.transform, pinchG.scale, pinchG.scale);
//    复位清空的
    [pinchG setScale:1];
    
}


-(void)setUpPanG{
    
    UIPanGestureRecognizer *panP = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panClick:)];
    [self.orginView addGestureRecognizer:panP];
}

-(void)panClick:(UIPanGestureRecognizer *)panG
{
   CGPoint p = [panG translationInView: self.orginView];
    NSLog(@"== %@",NSStringFromCGPoint(p));
    
    self.orginView.transform = CGAffineTransformTranslate(self.orginView.transform, p.x, p.y);
 
    [panG setTranslation:CGPointZero inView:self.orginView];
}


@end

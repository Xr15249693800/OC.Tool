//
//  FourViewController.m
//  OC.Tool
//【】

//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "FourViewController.h"
#import "Draw.h"
#import "UIImage+image.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    Draw *drawView = [Draw defaultDrawView];
//    drawView.center = self.view.center;
//    [self.view addSubview:drawView];
    
//    [self synthesisCustomeImage];
//    绘制一个圆形
//    UIBezierPath *path= [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
//    [path addClip];
    
//    裁剪圆形图片 分类
//    UIImageView *imgView = [UIImageView new];
//    [self.view addSubview:imgView];
//    imgView.center = self.view.center;
//    imgView.bounds = CGRectMake(0, 0, 200, 200);
//    imgView.image = [UIImage imageWithBorder:5 Color:[UIColor yellowColor] image:@"44"];
    
    

}
//合成一张带文字的图片
-(void)synthesisCustomeImage{
    
    //    加载图片
        UIImage *img = [UIImage imageNamed:@"44"];
    //    开启一个跟图片大小的上下文 opaque 不透明度  scale生成的图片
        UIGraphicsBeginImageContextWithOptions(img.size, NO, 0);
    //    把图片绘制到上下文当中
        [img drawAtPoint:CGPointZero];
    //    把文字绘制到上下文当中
        NSString *str = @"Mr.Xue";
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
        dict[NSStrokeColorAttributeName] = [UIColor redColor];
        
        [str drawAtPoint:CGPointMake(10, 20) withAttributes:dict];
    //    从上下文当中生成一张图片
       UIImage *new_Img = UIGraphicsGetImageFromCurrentImageContext();
    //    关闭上下文
        UIGraphicsEndImageContext();
        
        UIImageView *imgView = [UIImageView new];
        [self.view addSubview:imgView];
        imgView.center = self.view.center;
        imgView.bounds = CGRectMake(0, 0, img.size.width*0.5, img.size.height*0.5);
        imgView.image = new_Img;
    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    OC_NavigationController *nav = [[OC_NavigationController alloc]initWithRootViewController:[LoginViewController new]];
//    kKeyWindow.rootViewController = nav;
//    CATransition *anim = [CATransition animation];
//    anim.duration = 0.5;
//    anim.type = @"rippleEffect";
//    [kKeyWindow.layer addAnimation:anim forKey:nil];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

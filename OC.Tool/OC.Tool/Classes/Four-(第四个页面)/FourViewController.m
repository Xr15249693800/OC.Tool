//
//  FourViewController.m
//  OC.Tool
//【】

//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    OC_NavigationController *nav = [[OC_NavigationController alloc]initWithRootViewController:[LoginViewController new]];
    kKeyWindow.rootViewController = nav;
    CATransition *anim = [CATransition animation];
    anim.duration = 0.5;
    anim.type = @"rippleEffect";
    [kKeyWindow.layer addAnimation:anim forKey:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

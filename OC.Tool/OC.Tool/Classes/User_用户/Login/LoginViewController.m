//
//  LoginViewController.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phone_TF;
@property (weak, nonatomic) IBOutlet UITextField *pswd_TF;

@end

@implementation LoginViewController
//页面将要进来的时候
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
//页面将要离开的时候
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)LoginEvent:(UIButton *)sender {
    
    NSLog(@"登录主页面");
    if (self.phone_TF.text.length == 0 && [self.phone_TF.text isEqualToString:@""]) {
        
//        提示没有输入手机号
        [KOC_Control showNomalFailHUDInView:kKeyWindow andPromptTitle:@"请输入手机号码"];
        return;
    }
    if (self.pswd_TF.text.length == 0 && [self.pswd_TF.text isEqualToString:@""]) {
        
//        提示没有输入验证码
        [KOC_Control showNomalFailHUDInView:kKeyWindow andPromptTitle:@"请输入验证码"];
        
        return;
    }
    
//    跳转到主页面
    [KOC_Control PerformTreransitionAnimation];
    [KOC_Control showSuccessHUDInView:kKeyWindow andPromptTitle:@"登录成功"];
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

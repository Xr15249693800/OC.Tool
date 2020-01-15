//
//  GestureUnlockVC.m
//  OC.Tool
//
//  Created by xueranit on 2020/1/14.
//  Copyright © 2020 xr. All rights reserved.
//

#import "GestureUnlockVC.h"

@interface GestureUnlockVC ()

@end

@implementation GestureUnlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitleView:[KOC_Control createNavigationNormalTitle:@"手势解🔐"]];
    self.view.backgroundColor = [UIColor redColor];
    
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

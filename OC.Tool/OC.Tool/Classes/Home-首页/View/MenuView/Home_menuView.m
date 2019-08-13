//
//  Home_menuView.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/12.
//  Copyright © 2019 xr. All rights reserved.
//

#import "Home_menuView.h"
#import "BannerDetailController.h"

@implementation Home_menuView

+(Home_menuView *)CreatHome_menuView{
    return [Home_menuView viewFromXib];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    
    CGFloat viewW = kWidth/5;
    CGFloat viewH = 70;
    CGFloat imgViewH = 40;
    CGFloat imgViewX = (viewW - 40)/2;
    CGFloat lableH = 20;
    NSArray *imgs = [NSArray arrayWithObjects:@"Home_menuFree",@"Home_menuactual",@"Home_menuWork",@"Home_menuZhuanLan",@"Home_menuRecord", nil];
    NSArray *lables = [NSArray arrayWithObjects:@"免费课程",@"实战课程",@"就业班",@"慕课专栏",@"文章手记", nil];
//    创建五个View
    for (NSInteger i = 0; i < 5; i ++) {
//        view的x坐标
        CGFloat viewX = viewW*i;
        UIView *bgView = [[UIView alloc]init];
        bgView.frame = CGRectMake(viewX, 0, viewW, viewH);
        [self addSubview:bgView];
        bgView.tag = i;
//        view添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [bgView addGestureRecognizer:tap];
        
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.frame = CGRectMake(imgViewX, 0, imgViewH, imgViewH);
        [bgView addSubview:imgView];
        imgView.image = [UIImage imageNamed:imgs[i]];
        
        UILabel *nameLb = [[UILabel alloc]init];
        nameLb.frame = CGRectMake(0, CGRectGetMaxY(imgView.frame)+10, bgView.width, lableH);
        nameLb.textAlignment = NSTextAlignmentCenter;
        nameLb.font = [UIFont systemFontOfSize:15];
        nameLb.textColor = kRGBColor(51, 51, 51);
        nameLb.text = lables[i];
        [bgView addSubview:nameLb];
    }
    
}
-(void)tapClick:(UITapGestureRecognizer *)tap{
    
    NSLog(@"%ld",tap.view.tag);
    
    [[KOC_Control GetParentViewControllerFrom:self].navigationController pushViewController:[BannerDetailController new] animated:YES];
}
@end

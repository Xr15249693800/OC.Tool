//
//  CyclePicView.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/9.
//  Copyright © 2019 xr. All rights reserved.
//

#import "CyclePicView.h"
#import "BannerDetailController.h"
@interface CyclePicView()<SDCycleScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic,strong)SDCycleScrollView *cycleScrollerView;
@end

@implementation CyclePicView
+(CyclePicView*)creatCyclePicView{
    
    return [CyclePicView viewFromXib];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    //添加轮播控制器
    [self setupCycleScrollerView];
}

-(void)setupCycleScrollerView{
    NSArray *imgs = [NSArray arrayWithObjects:@"001",@"002",@"003",@"004",@"005", nil];
    self.cycleScrollerView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imageNamesGroup:imgs];
    self.cycleScrollerView.delegate = self;
    self.cycleScrollerView.currentPageDotColor = [UIColor redColor];
    self.cycleScrollerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    [self.bgView addSubview:self.cycleScrollerView];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.cycleScrollerView.frame = self.bgView.bounds;
}
#pragma mark ======cycleScrollerDelagate======
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"点击广告位 %ld",index);
//    从View里面push到控制器
    [[KOC_Control GetParentViewControllerFrom:self].navigationController pushViewController:[BannerDetailController new] animated:YES];
}
@end

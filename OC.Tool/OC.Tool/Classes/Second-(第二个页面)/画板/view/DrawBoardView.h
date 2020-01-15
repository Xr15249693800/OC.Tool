//
//  DrawBoardView.h
//  OC.Tool
//
//  Created by xueranit on 2020/1/15.
//  Copyright © 2020 xr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawBoardView : UIView
//清屏
-(void)undo;
//撤销
-(void)clear;
//橡皮擦
-(void)erase;
//线宽
-(void)setLineWidth:(CGFloat)lineWidth;
//颜色
-(void)setLineColor:(UIColor *)lineColor;
/**图片*/
@property (nonatomic,strong)UIImage *image;

@end

NS_ASSUME_NONNULL_END

//
//  UIImage+image.m
//  OC.Tool
//
//  Created by xueranit on 2020/1/14.
//  Copyright © 2020 xr. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)


+(UIImage *)imageWithBorder:(CGFloat)borderW Color:(UIColor *)borderColor image:(NSString *)imageName{
    
//    加载图片
    UIImage *image = [UIImage imageNamed:imageName];
//    开启上下文
    CGSize size = CGSizeMake(image.size.width + 2*borderW, image.size.height + 2*borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
//    绘制大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];
//    绘制一个小圆 把小圆设置成裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [clipPath addClip];
//    把图片绘制到上下文当中
    [image drawAtPoint:CGPointMake(borderW, borderW)];
//    从上下文当中得到图片
   UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    关闭上下文
    UIGraphicsEndImageContext();
//返回图片
    return newImage;    
}
@end

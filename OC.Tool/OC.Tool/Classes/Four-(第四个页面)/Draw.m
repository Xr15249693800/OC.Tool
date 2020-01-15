//
//  Draw.m
//  OC.Tool
//
//  Created by xueranit on 2020/1/9.
//  Copyright © 2020 xr. All rights reserved.
//

#import "Draw.h"

@implementation Draw

+(instancetype)defaultDrawView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeY)];
//    想要让定时器工作 必须得要把他添加到主运行循环中
//    这个定时器没有时间  他是当每一次屏幕刷新的时候调用 就会调用指定的方法 屏幕每一秒刷新60次
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.bounds = CGRectMake(0, 0, 200, 200);
}
//绘图 取得上下文
- (void)drawRect:(CGRect)rect{

    [self drawImg];
//    平移的操作

}
//绘制图片
-(void)drawImg{
    UIImage *img = [UIImage imageNamed:@"44"];
    //    裁剪(超过这个区域的都会给你裁减掉)
//    UIRectClip(CGRectMake(0, 0, 120, 120));
    [img drawInRect:self.bounds];
    //    [img drawAtPoint:CGPointZero];
  //    [img drawAsPatternInRect:self.bounds]; //平铺
}

//绘制文字
-(void)drawText{
    
    NSString *textStr = @"绘制一个文字";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    dict[NSStrokeColorAttributeName] = [UIColor orangeColor];
    dict[NSStrokeWidthAttributeName] = @3;
//    设置阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(10, 10);
    dict[NSShadowAttributeName] = shadow;
    [textStr drawAtPoint:CGPointZero withAttributes:dict];
    [textStr drawInRect:self.bounds withAttributes:dict];
    
    
}

//画弧
-(void)drawRadian{
    
//    画弧先画圆 Center圆心 radius半径 startAngle开始角度 endAngle结束角度 clockwise方向
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:80 startAngle:0 endAngle:M_PI_4 clockwise:NO];
    
    [path addLineToPoint:CGPointMake(100, 100)];
    
//    关闭路径的方法   从路径的终点连接一根线到起点
    [path closePath];
    
    [path stroke];
    
}

//直接用BezierPath 画图
-(void)drawBezierPath{
     UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 60)];
    //    使用他提供的绘制方法 进行绘制
    [path setLineWidth:5];
    [[UIColor redColor] set];
    [path fill];
}
//画矩形
-(void)drawrectangle{
    
     CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    画笔
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 80)];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:25];
    
    CGContextSetLineWidth(ctx, 5);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    [[UIColor orangeColor] set];
    
//    把画的东西放到上下文里
    CGContextAddPath(ctx, path.CGPath);
//    展示
    CGContextFillPath(ctx);
}

//画曲线
-(void)drawCurve{
//    获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    画笔
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 10)];
//    [path addCurveToPoint:CGPointMake(40, 40) controlPoint1:CGPointMake(80, 60) controlPoint2:CGPointMake(100, 120)];
    [path addQuadCurveToPoint:CGPointMake(10, 180) controlPoint:CGPointMake(150, 150)];
    
    CGContextSetLineWidth(ctx, 5);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    [[UIColor orangeColor] set];
    
//    把画的东西放到上下文里
    CGContextAddPath(ctx, path.CGPath);
//    展示
    CGContextStrokePath(ctx);
    
}

//画直线
-(void)drawLine{
    //    系统已经创建了一个跟view相关联的上下文(layer),只需要获取上下文就可以了
    //    1.获取上下文 无论是创建还是获取 都已 UIGraphics
        CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    2.绘制路径  UIBezierPath：UIkit 框架
        UIBezierPath *path = [UIBezierPath bezierPath]; //画笔
    //    2.1 设置一个起点
        [path moveToPoint:CGPointMake(50, 100)];
    //    2.2 添加一根线到终点
        [path addLineToPoint:CGPointMake(100, 150)];
        
    //    [path moveToPoint:CGPointMake(20, 20)];
        //    2.2 添加一根线到终点
        [path addLineToPoint:CGPointMake(120, 20)];
        
    //    [path moveToPoint:CGPointMake(120, 20)];
        //    2.2 添加一根线到终点
        [path addLineToPoint:CGPointMake(180, 60)];
        
    //    线宽 颜色
        CGContextSetLineWidth(ctx, 10);
    //    设置线的连接样式
        CGContextSetLineJoin(ctx, kCGLineJoinRound);
    //    设置线的顶脚样式
        CGContextSetLineCap(ctx, kCGLineCapRound);
        
    //    设置颜色
        [[UIColor redColor] setStroke];
    //    [[UIColor redColor] setFill];
        [[UIColor redColor] set]; //这个可以不用区分描绘的样式
        
    //    3.放到上下文里面
    //    CGPathRef CoreGraphics框架里面的
        CGContextAddPath(ctx, path.CGPath);
    //    4.b把上下文的内容显示到view上 渲染到view的layer上(stroke描边的方式)(fill 填充的方式)
        CGContextStrokePath(ctx);
    //    CGContextFillPath(ctx);
}
@end

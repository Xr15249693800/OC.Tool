//
//  DrawBoardView.m
//  OC.Tool
//
//  Created by xueranit on 2020/1/15.
//  Copyright © 2020 xr. All rights reserved.
//

#import "DrawBoardView.h"
#import "DrawBezierPath.h"

@interface DrawBoardView()
@property (strong,nonatomic) UIBezierPath *path;
@property(nonatomic,assign)CGFloat line_Width;
/**当前颜色*/
@property (nonatomic,strong)UIColor *color;
/**装的路径*/
@property (nonatomic,strong)NSMutableArray *pathArray;

@end
@implementation DrawBoardView
-(NSMutableArray *)pathArray{
    if (_pathArray == nil) {
        
         _pathArray = [NSMutableArray array];
    }
   
    return _pathArray;
}



- (void)awakeFromNib{
    [super awakeFromNib];
//    添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    self.line_Width = 1.0;
    self.color = [UIColor blackColor];
    
}
-(void)pan:(UIPanGestureRecognizer *)pan{
    
    CGPoint curP = [pan locationInView:self];
//    判断手势的状态
    if (pan.state == UIGestureRecognizerStateBegan) {
        
//        创建路径
        DrawBezierPath *path = [[DrawBezierPath alloc]init];
        self.path = path;
//        设置起点
        [self.path moveToPoint:curP];
//        设置线的宽度
        [path setLineWidth:self.line_Width];
        
//        什么情况下自定义view  当a发现系统的原始功能没有办法满足自己的需求时，这个时候要自定义类
        path.color = self.color;
        [self.pathArray addObject:path];
//
    }else if (pan.state == UIGestureRecognizerStateChanged){
//        添加一根线到当前手指所在的点
        [self.path addLineToPoint:curP];
//        重绘
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
   
    for (DrawBezierPath *path in self.pathArray) {
        if ([path isKindOfClass:[UIImage class]]) {
//            如果是图片类型的话
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        }else{
            
            [path.color set];
            [path stroke];
        }
         
    }
    
}

//清屏
-(void)clear{
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
    
}
//撤销
-(void)undo{
 
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
}

//橡皮擦
-(void)erase{
    NSLog(@"橡皮擦");
    [self setLineColor:[UIColor whiteColor]];
}
//线宽
-(void)setLineWidth:(CGFloat)lineWidth{
    //    在添加路径之前就应该确定线的宽度
//    宽度是0 - 1
    self.line_Width = lineWidth;
//    [self.path setLineWidth:lineWidth];

    
}
//颜色
-(void)setLineColor:(UIColor *)lineColor{
    NSLog(@"颜色");
    self.color = lineColor;
}
-(void)setImage:(UIImage *)image{
    _image = image;
//    把图片添加到数组当中
    [self.pathArray addObject:image];
//    重绘
    [self setNeedsDisplay];
}


@end

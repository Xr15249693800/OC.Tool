//
//  DrawingBoardVC.m
//  OC.Tool
//
//  Created by xueranit on 2020/1/15.
//  Copyright © 2020 xr. All rights reserved.
//

#import "DrawingBoardVC.h"
#import "DrawBoardView.h"

@interface DrawingBoardVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet DrawBoardView *drawBoder;
@property (nonatomic,weak)UIView*contentView;

@end

@implementation DrawingBoardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.titleView = [KOC_Control createNavigationNormalTitle:@"画板"];
}
//属于谁的东西再谁里面去写
- (IBAction)clear:(id)sender {
    [self.drawBoder clear];
    
}
- (IBAction)undo:(id)sender {
    [self.drawBoder undo];
    
}
- (IBAction)erase:(id)sender {
 
    [self.drawBoder erase];
}


- (IBAction)slider:(UISlider *)sender {
    [self.drawBoder setLineWidth: sender.value];
}
- (IBAction)yellow:(id)sender {
    [self.drawBoder setLineColor:[UIColor yellowColor]];
}
- (IBAction)blue:(id)sender {
    [self.drawBoder setLineColor:[UIColor blueColor]];
}
- (IBAction)green:(id)sender {
    [self.drawBoder setLineColor:[UIColor greenColor]];
}
- (IBAction)photo:(id)sender {
//    从系统相册当中去选一张图片
//    1.弹出系统相册
    UIImagePickerController *pickVC = [[UIImagePickerController alloc]init];
//    设置照片的来源
    /*
     
     UIImagePickerControllerSourceTypePhotoLibrary, 默认
     UIImagePickerControllerSourceTypeCamera, //相机
     UIImagePickerControllerSourceTypeSavedPhotosAlbum 照片库
     
     */
    pickVC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    pickVC.delegate = self; //需要遵守两个协议
    [self presentViewController:pickVC animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
//    把这个图片 绘制到画板上
//    NSData *data = UIImageJPEGRepresentation(image, 1);
//    [data writeToFile:@"/Users/xueranit/Desktop/img.jpeg" atomically:YES];
    
//    把选中的图片交给画板去处理  不能直接给图片绘制上去  需要对图片进行操作 当大缩小旋转捏合等之后 再绘制  所以需要先传个view去操作
    UIView *contentView = [[UIView alloc]initWithFrame:self.drawBoder.frame];
    [self.view addSubview:contentView];
    self.contentView = contentView;
//    contentView.backgroundColor = [UIColor redColor];
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:contentView.bounds];
    imageview.image = image;
    imageview.userInteractionEnabled = YES;
    [contentView addSubview:imageview];
//    现在就可以给imageView 添加手势了
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [imageview addGestureRecognizer:pan];
    
//    捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [imageview addGestureRecognizer:pinch];
    
//    长按手势
    UILongPressGestureRecognizer *longG = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longG:)];
    [imageview addGestureRecognizer:longG];
//    self.drawBoder.image = image;
//    把当前pickController 给他弹下去
    [self dismissViewControllerAnimated:YES completion:nil];
}
//拖拽手势
-(void)pan:(UIPanGestureRecognizer *)pan{
    
   CGPoint tranP = [pan translationInView:pan.view];
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, tranP.x, tranP.y);
//    复位
    [pan setTranslation:CGPointZero inView:pan.view];
}
//捏合手势
-(void)pinch:(UIPinchGestureRecognizer *)pinch{
    
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    [pinch setScale:1];
    
}
//长按手势
-(void)longG:(UILongPressGestureRecognizer *)longG{
    
    if (longG.state == UIGestureRecognizerStateBegan) {
//        先让图片闪一下,把图片绘制到画板当中
        [UIView animateWithDuration:0.2 animations:^{
            longG.view.alpha = 0;
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                longG.view.alpha = 1;
            } completion:^(BOOL finished) {
//                把图片绘制到画板当中
//                需要imageView生成图片 进行截屏操作
                UIGraphicsBeginImageContextWithOptions(longG.view.superview.bounds.size, NO, 0);
                CGContextRef ctx = UIGraphicsGetCurrentContext();
                [longG.view.superview.layer renderInContext:ctx];
                UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                self.drawBoder.image = newImg;
                [longG.view.superview removeFromSuperview];
            }];
        }];
    }
    
}

- (IBAction)save:(id)sender {
//    把绘制的东西生成照片保存到相册里面
//开启一个位图上下文
    UIGraphicsBeginImageContextWithOptions(self.drawBoder.size, NO, 0);
   CGContextRef ctx = UIGraphicsGetCurrentContext();
//    把画板上的内容渲染到x上下文当中
    [self.drawBoder.layer renderInContext:ctx];
//    从x上下文当中取出q图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
//    关闭上下文
    UIGraphicsEndImageContext();
//    把图片保存到系统相册当中
    UIImageWriteToSavedPhotosAlbum(newImg, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
//    保存完毕时候调用
    NSLog(@"保存完毕");
}

@end

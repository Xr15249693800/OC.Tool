//
//  KOC_Control.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import "KOC_Control.h"

@implementation KOC_Control
/**
 *  创建导航栏的默认atitle
 */
+ (UILabel *)createNavigationNormalTitle:(NSString *)title {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [label setText:title];
    [label setTextColor:[UIColor colorWithHexString:@"333333"]];
    [label setFont:[UIFont boldSystemFontOfSize:18]];
    [label setTextAlignment:NSTextAlignmentCenter];
    return label;
}

/**
 *  创建导航栏的自定义title
 */
+ (UILabel *)createNavigationCustomTitle:(NSString *)title titleColor:(NSString *)titleColor {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [label setText:title];
    [label setTextColor:[UIColor colorWithHexString:titleColor]];
    [label setFont:[UIFont boldSystemFontOfSize:18]];
    [label setTextAlignment:NSTextAlignmentCenter];
    return label;
}

/**
 *  创建导航栏的button（文字）
 */
+ (UIButton *)createNavgationTitle:(NSString *)title titleColor:(NSString *)titleColor target:(id)target selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 40);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:titleColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:titleColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

/**
 * 创建导航栏的button（图片）
 */
+ (UIButton *)createNavgationImage:(NSString *)image target:(id)target selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

/**
 *  从view中push控制器
 */
+ (void)fromViewJumpVcWithViewController:(UIViewController *)jumpVc {
    OC_TabBarController *tabBarVc = (OC_TabBarController *)kKeyWindow.rootViewController;
    OC_NavigationController *nav = tabBarVc.selectedViewController;
    [nav pushViewController:jumpVc animated:YES];
}

/**
 时间戳转换为日期
 
 @param utc 时间戳
 @return 详细日期
 */
+ (NSString *)UTCchangeDate:(NSString *)utc {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@" YYYY-MM-dd日 HH:mm:ss"];
    NSDate *datenow = [NSDate dateWithTimeIntervalSince1970:[utc integerValue]];
    NSString *nowtimeStr = [formatter stringFromDate:datenow];
    return nowtimeStr;
}

/**
 * 动画进入TabBarController
 */
+ (void)AnimationToTabBarController {
    kKeyWindow.rootViewController = [[OC_TabBarController alloc] init];
    CATransition *anim = [CATransition animation];
    anim.duration = 0.5;
    anim.type = @"fade";
    [kKeyWindow.layer addAnimation:anim forKey:nil];
}

/**
 动画进入LoginController
 */
+ (void)AnimationToLoginController {
    OC_NavigationController *nav = [[OC_NavigationController alloc]initWithRootViewController:[[LoginViewController alloc] init]];
    kKeyWindow.rootViewController = nav;
    CATransition *anim = [CATransition animation];
    anim.duration = 0.5;
    anim.type = @"fade";
    [kKeyWindow.layer addAnimation:anim forKey:nil];
}

/*
 专场动画类型type:
 1 - fade  2 - moveIn 3 - push 4 - reveal 5 - suckEffect 6 - oglFlip
 7 - pageCurl 8 - pageUnCurl 9 - cameraIrisHollowOpen 10- cameraIrisHollowClose 11- cube
 */
+ (void)PerformTreransitionAnimation {
    kKeyWindow.rootViewController = [[OC_TabBarController alloc] init];
    CATransition *anim = [CATransition animation];
    anim.duration = 0.5;
    anim.type = @"rippleEffect";
    [kKeyWindow.layer addAnimation:anim forKey:nil];
}

/**
 * 从view中遍历父控制器
 */
+ (UIViewController *)GetParentViewControllerFrom:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

/*
 * 导航栏下面的线
 */
+ (UIImageView *)FindHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self FindHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

/**
 *  显示成功的hud
 */
+ (void)showSuccessHUDInView:(UIView *)inView andPromptTitle:(NSString *)promptTitle {
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:inView animated:YES];
    progressHUD.animationType = MBProgressHUDAnimationFade;
    progressHUD.mode = MBProgressHUDModeCustomView;
    progressHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"thcket_success"]];
    progressHUD.label.text = promptTitle;
    [progressHUD hideAnimated:YES afterDelay:1];
}

/**
 *  显示失败的hud
 */
+ (void)showFailHUDInView:(UIView *)inView andPromptTitle:(NSString *)promptTitle {
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:inView animated:YES];
    progressHUD.animationType = MBProgressHUDAnimationFade;
    progressHUD.mode = MBProgressHUDModeCustomView;
    progressHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Ticket_fail"]];
    progressHUD.label.text = promptTitle;
    [progressHUD hideAnimated:YES afterDelay:2];
}

/**
 *  一般的错误HUD
 */
+ (void)showNomalFailHUDInView:(UIView *)inView andPromptTitle:(NSString *)promptTitle {
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:inView animated:YES];
    progressHUD.animationType = MBProgressHUDAnimationFade;
    progressHUD.mode = MBProgressHUDModeCustomView;
    progressHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"outloginY"]];
    progressHUD.customView.size = CGSizeMake(32, 32);
    progressHUD.detailsLabel.text = promptTitle;
    [progressHUD hideAnimated:YES afterDelay:2];
}

/** 显示提示信息 */
+ (void)showPromptMessage:(NSString *)message Height:(CGFloat)height {
    UIView *promptView = [[UIView alloc] initWithFrame:CGRectMake(1, 1, 1, 1)];
    promptView.backgroundColor = [UIColor blackColor];
    promptView.alpha = 1.0f;
    [promptView.layer setCornerRadius:5.0];
    [promptView.layer setMasksToBounds:YES];
    [kKeyWindow addSubview:promptView];
    
    UILabel *promptLabel = [[UILabel alloc] init];
    NSDictionary* attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:17]
                                 };
    CGSize LabelSize = [message  sizeWithAttributes:attributes];
    promptLabel.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    promptLabel.text = message;
    promptLabel.textColor = [UIColor whiteColor];
    promptLabel.textAlignment = 1;
    promptLabel.backgroundColor = [UIColor clearColor];
    promptLabel.font = [UIFont boldSystemFontOfSize:15];
    
    [promptView addSubview:promptLabel];
    
    // 600
    promptView.frame = CGRectMake((kWidth - LabelSize.width - 20) / 2, kHeight - height, LabelSize.width + 20, LabelSize.height + 10);
    
    [UIView animateWithDuration:3 animations:^{
        promptView.alpha = 0;
    } completion:^(BOOL finished) {
        [promptView removeFromSuperview];
    }];
}

/** 显示登录成功后的提示信息 */
+ (void)showLoginSuccessMessage:(NSString *)message Height:(CGFloat)height inView:(UIView *)view {
    UIView *promptView = [[UIView alloc] initWithFrame:CGRectMake(1, 1, 1, 1)];
    promptView.backgroundColor = [UIColor blackColor];
    promptView.alpha = 1.0f;
    [promptView.layer setCornerRadius:5.0];
    [promptView.layer setMasksToBounds:YES];
    [view addSubview:promptView];
    
    UILabel *promptLabel = [[UILabel alloc]init];
    NSDictionary* attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:17]
                                 };
    CGSize LabelSize = [message  sizeWithAttributes:attributes];
    promptLabel.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    promptLabel.text = message;
    promptLabel.textColor = [UIColor whiteColor];
    promptLabel.textAlignment = 1;
    promptLabel.backgroundColor = [UIColor clearColor];
    promptLabel.font = [UIFont boldSystemFontOfSize:15];
    
    [promptView addSubview:promptLabel];
    
    // 600
    promptView.frame = CGRectMake((kWidth - LabelSize.width - 20) / 2, kHeight - height, LabelSize.width + 20, LabelSize.height + 10);
    
    [UIView animateWithDuration:3 animations:^{
        promptView.alpha = 0;
    } completion:^(BOOL finished) {
        [promptView removeFromSuperview];
    }];
}

/*
 XSTableViewAnimationTypeMove = 0,
 XSTableViewAnimationTypeMoveSpring  // 从左往右一个一个划入
 XSTableViewAnimationTypeAlpha,      // 从左往右一个一个划入 带弹性
 XSTableViewAnimationTypeFall,       // 一个一个逐渐显示
 XSTableViewAnimationTypeShake,      // 从上往下一个一个掉落
 XSTableViewAnimationTypeOverTurn,   // 左右交叉一个一个进入
 XSTableViewAnimationTypeToTop,      // 每个cell上下翻滚着进入
 XSTableViewAnimationTypeSpringList, // 从下网上一个一个进入
 XSTableViewAnimationTypeShrinkToTop, // 一个一个掉落 在每个位置有弹簧效果
 tableView加载动画
 */
+ (void)startLodingNewDataTableViewAnimation:(UITableView *)tableView {
    [TableViewAnimationKit showWithAnimationType:XSTableViewAnimationTypeAlpha tableView:tableView];
}

/*
 XSTableViewAnimationTypeMove = 0,
 XSTableViewAnimationTypeMoveSpring  // 从左往右一个一个划入
 XSTableViewAnimationTypeAlpha,      // 从左往右一个一个划入 带弹性
 XSTableViewAnimationTypeFall,       // 一个一个逐渐显示
 XSTableViewAnimationTypeShake,      // 从上往下一个一个掉落
 XSTableViewAnimationTypeOverTurn,   // 左右交叉一个一个进入
 XSTableViewAnimationTypeToTop,      // 每个cell上下翻滚着进入
 XSTableViewAnimationTypeSpringList, // 从下网上一个一个进入
 XSTableViewAnimationTypeShrinkToTop, // 一个一个掉落 在每个位置有弹簧效果
 tableView加载动画
 */
+ (void)HomeStartLodingNewDataTableViewAnimation:(UITableView *)tableView {
    [TableViewAnimationKit showWithAnimationType:XSTableViewAnimationTypeToTop tableView:tableView];
}


/**
 *  生成search图片
 *
 *  @param color  图片颜色
 *  @param height 图片高度
 *
 *  @return 生成的图片
 */
+ (UIImage *)GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height {
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

/**
 *  给自定义view添加动画
 *
 *  @param customView 自定义view
 */
+ (void)AddButtonAnimationWithCustomView:(UIView *)customView {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values = @[@(0.1),@(1.0),@(1.5)];
    animation.keyTimes = @[@(0.0),@(1.0),@(0.8),@(1.0)];
    animation.calculationMode = kCAAnimationLinear;
    [customView.layer addAnimation:animation forKey:@"SHOW"];
}

/**
 * 在url中会有中文的存在 使用这个可以为其编码 比如 http://www.baidu.com/图片.png 编码后可转换为http://www.baidu.com//1dxas/.png
 */
+ (NSString *)UTF8_CodingWith:(NSString *)string; {
    return [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

/**
 * 在url中会有UTF8的存在 使用这个可以为其解码 比如 http://www.baidu.com/1dxas.png 编码后可转换为http://www.baidu.com//图片/.png
 */
+ (NSString *)UTF8_DecodingWith:(NSString *)string {
    return [string stringByRemovingPercentEncoding];
}

/**
 生成二维码
 
 @param QRString 传入需要生成字符串
 @return 返回二维码图片
 */
+ (UIImage *)createQRCodeWithQRString:(NSString *)QRString WithSize:(CGFloat)WidthAndHeight {
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [QRString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    CIImage *outputImage = [filter outputImage];
    UIImage *image = [KOC_Control createNonInterpolatedUIImageFormCIImage:outputImage WithSize:WidthAndHeight];
    return image;
}

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image WithSize:(CGFloat)size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetWidth(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

/*
 * 生成条形码
 */
+ (UIImage *)createBarCodeWithQRString:(NSString *)QRString withSize:(CGSize)size {
    // 注意生成条形码的编码方式
    NSData *data = [QRString dataUsingEncoding: NSASCIIStringEncoding];
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    // 设置生成的条形码的上，下，左，右的margins的值
    [filter setValue:[NSNumber numberWithInteger:0] forKey:@"inputQuietSpace"];
    //    return filter.outputImage;
    return [KOC_Control resizeCodeImage:filter.outputImage withSize:size];
}

/**
 调整生成的图片的大小
 @param image CIImage对象
 @param size 需要的UIImage的大小
 @return size大小的UIImage对象
 */
+ (UIImage *)resizeCodeImage:(CIImage *)image withSize:(CGSize)size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scaleWidth = size.width/CGRectGetWidth(extent);
    CGFloat scaleHeight = size.height/CGRectGetHeight(extent);
    size_t width = CGRectGetWidth(extent) * scaleWidth;
    size_t height = CGRectGetHeight(extent) * scaleHeight;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
    CGContextRef contentRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpaceRef, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(contentRef, kCGInterpolationNone);
    CGContextScaleCTM(contentRef, scaleWidth, scaleHeight);
    CGContextDrawImage(contentRef, extent, imageRef);
    CGImageRef imageRefResized = CGBitmapContextCreateImage(contentRef);
    CGContextRelease(contentRef);
    CGImageRelease(imageRef);
    return [UIImage imageWithCGImage:imageRefResized];
}

/**
 sting转json
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


// 字典转json
+ (NSString *)convertToJsonData:(NSDictionary *)dict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
    } else {
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}
@end

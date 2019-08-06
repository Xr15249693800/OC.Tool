//
//  KOC_Control.h
//  OC.Tool
//
//  Created by xueranit on 2019/8/5.
//  Copyright © 2019 xr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KOC_Control : NSObject
/**
 *  创建导航栏的默认atitle
 */
+ (UILabel *)createNavigationNormalTitle:(NSString *)title;
/**
 *  创建导航栏的自定义title
 */
+ (UILabel *)createNavigationCustomTitle:(NSString *)title titleColor:(NSString *)titleColor;

/**
 *  创建导航栏的button（文字）
 */
+ (UIButton *)createNavgationTitle:(NSString *)title titleColor:(NSString *)titleColor target:(id)target selector:(SEL)selector;

/**
 *  创建导航栏的button（图片）
 */
+ (UIButton *)createNavgationImage:(NSString *)image target:(id)target selector:(SEL)selector;

/**
 *  从view中push控制器
 */
+ (void)fromViewJumpVcWithViewController:(UIViewController *)viewController;

/**
 时间戳转换为日期
 
 @param utc 时间戳
 @return 详细日期
 */
+ (NSString *)UTCchangeDate:(NSString *)utc;

/**
 * 动画进入TabBarController
 */
+ (void)AnimationToTabBarController;

/**
 动画进入LoginController
 */
+ (void)AnimationToLoginController;

/**
 * 执行专场动画
 */
+ (void)PerformTreransitionAnimation;


/**
 * 从viewd中遍历父控制器
 */
+ (UIViewController *)GetParentViewControllerFrom:(UIView *)view;

/*
 * 导航栏下面的线
 */
+ (UIImageView *)FindHairlineImageViewUnder:(UIView *)view;

/**
 *  显示成功的hud
 */
+ (void)showSuccessHUDInView:(UIView *)inView andPromptTitle:(NSString *)promptTitle;

/**
 *  显示失败的hud
 */
+ (void)showFailHUDInView:(UIView *)inView andPromptTitle:(NSString *)promptTitle;

/**
 *  一般的错误HUD
 */
+ (void)showNomalFailHUDInView:(UIView *)inView andPromptTitle:(NSString *)promptTitle;

/**
 *  显示提示信息
 */
+ (void)showPromptMessage:(NSString *)message Height:(CGFloat)height;

/**
 *  显示登录成功后的提示信息
 */
+ (void)showLoginSuccessMessage:(NSString *)message Height:(CGFloat)height inView:(UIView *)view;

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
+ (void)startLodingNewDataTableViewAnimation:(UITableView *)tableView;


/**
 针对首页点击h加号按钮的动画
 */
+ (void)HomeStartLodingNewDataTableViewAnimation:(UITableView *)tableView;

/**
 *  生成search图片
 *
 *  @param color  图片颜色
 *  @param height 图片高度
 *
 *  @return 生成的图片
 */
+ (UIImage *)GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height;

/**
 *  给自定义view添加动画
 *
 *  @param customView 自定义view
 */
+ (void)AddButtonAnimationWithCustomView:(UIView *)customView;


/**
 * 在url中会有中文的存在 使用这个可以为其编码 比如 http://www.baidu.com/图片.png 编码后可转换为http://www.baidu.com//1dxas/.png
 */
+ (NSString *)UTF8_CodingWith:(NSString *)string;

/**
 * 在url中会有UTF8的存在 使用这个可以为其解码 比如 http://www.baidu.com/1dxas.png 编码后可转换为http://www.baidu.com//图片/.png
 */
+ (NSString *)UTF8_DecodingWith:(NSString *)string;

/**
 生成二维码
 
 @param QRString 传入需要生成字符串
 @return 返回二维码图片
 */
+ (UIImage *)createQRCodeWithQRString:(NSString *)QRString WithSize:(CGFloat)WidthAndHeight;

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image WithSize:(CGFloat)size;


/*
 * 生成条形码
 */
+ (UIImage *)createBarCodeWithQRString:(NSString *)QRString withSize:(CGSize)size;

/**
 调整生成的图片的大小
 @param image CIImage对象
 @param size 需要的UIImage的大小
 @return size大小的UIImage对象
 */
+ (UIImage *)resizeCodeImage:(CIImage *)image withSize:(CGSize)size;

/**
 sting转json
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 字典转json
 */
+ (NSString *)convertToJsonData:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END

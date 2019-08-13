//
//  NetWorkTool.h
//  OC.Tool
//
//  Created by xueranit on 2019/8/6.
//  Copyright © 2019 xr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkTool : NSObject
//post 请求
+(void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id result))success failure:(void(^)(NSError *error))failure;
//get 请求
+ (void)get:(NSString *)url success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

//上传图片


@end

NS_ASSUME_NONNULL_END

//
//  NetWorkTool.m
//  OC.Tool
//
//  Created by xueranit on 2019/8/6.
//  Copyright © 2019 xr. All rights reserved.
//

#import "NetWorkTool.h"

@implementation NetWorkTool
+(void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
//    [manager.requestSerializer setValue:@"dfghjklghjkcvbj" forHTTPHeaderField:@"token"];
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        if (success) {
            
            success(dic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        if (failure) {
            failure(error);
        }
        
    }];
}
+ (void)get:(NSString *)url success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *changquID = [[NSUserDefaults standardUserDefaults] objectForKey:@"changquId"];
    if (changquID.length != 0) {
        
        [manager.requestSerializer setValue:changquID forHTTPHeaderField:@"factoryid"];
    }
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        
        if (success) {
            success(dic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
}
@end

//
//  ClientRequest.m
//  JCMockSwitchView
//
//  Created by JuneCheng on 2021/3/22.
//

#import "ClientRequest.h"
#import "NSString+Extension.h"
#import "Constants.h"

static NSString * const SERVERURL = @"https://xxxxxxxxx";

@implementation ClientRequest

+ (void)login:(NSDictionary *)params success:(void (^)(NSDictionary *returnValue))success failure:(void (^)(NSError *error))failure {
    [self GET:params methodName:@"login" cacheTime:-1 success:success failure:failure];
}

#pragma mark - get post方法

+ (void)GET:(NSDictionary *)params methodName:(NSString *)methodName cacheTime:(NSInteger)senconds success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    
    NSString *url = [NSString stringWithFormat:@"%@/%@", SERVERURL, methodName];
    [self get:url params:params cacheTime:senconds success:^(NSDictionary *returnValue) {
        if (success) {
            success(returnValue);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - Mock数据处理
+ (void)get:(NSString *)url params:(NSDictionary *)params cacheTime:(NSInteger)senconds success:(void (^)(id returnValue))success failure:(void (^)(NSError *error))failure {
#ifdef DEBUG
    if ([[NSUserDefaults standardUserDefaults] boolForKey:isMockEnv]) {
        [self loadLocalDataWithUrl:url success:success];
        return;
    }
#endif
    
    // 先检查一下是否有内存缓存，有直接返回缓存数据
    
    // TODO 发起真实的网络请求，此处只为演示，直接返回定死的数据
    success(@"{\"message\":\"我是远程网络数据\"}");
    // TODO
    if (senconds > 0) {
        // 数据缓存处理
    }
    
    
}

#pragma mark - Private Methods

/** 加载本地文件数据 */
+ (void)loadLocalDataWithUrl:(NSString *)url success:(void (^)(id returnValue))success {
    NSString *methodName = [url substringAfterLast:@"/"];
    NSString *path = [[NSBundle mainBundle] pathForResource:methodName ofType:@"txt"];
    NSString *responseObject = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    if (responseObject) {
        success(responseObject);
    }
}

@end

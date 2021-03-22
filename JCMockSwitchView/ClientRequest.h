//
//  ClientRequest.h
//  JCMockSwitchView
//
//  Created by JuneCheng on 2021/3/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClientRequest : NSObject

/** 登录交易 */
+ (void)login:(NSDictionary *)params success:(void (^)(NSDictionary *returnValue))success failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END

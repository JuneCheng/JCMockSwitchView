//
//  NSString+Extension.h
//  JCMockSwitchView
//
//  Created by JuneCheng on 2021/3/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

- (NSString *)substringAfterLast:(NSString *)str;

- (NSInteger)lastIndexOfStr:(NSString *)str;

- (NSString *)substringFromIndex:(int)beginIndex toIndex:(int)endIndex;

@end

NS_ASSUME_NONNULL_END

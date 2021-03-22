//
//  NSString+Extension.m
//  JCMockSwitchView
//
//  Created by JuneCheng on 2021/3/22.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)substringAfterLast:(NSString *)str {
    NSInteger index = [self lastIndexOfStr:str];
    if (index == -1) {
        return  self;
    }
    index = index+str.length;
    return [self substringFromIndex:(int)index toIndex:(int)self.length];
}

- (NSInteger)lastIndexOfStr:(NSString *)str {
    NSUInteger length = [self length];
    NSRange range = [self rangeOfString:str];
    NSInteger index = -1;
    if (range.location<length) {
        index = range.location;
    }
    while (range.location < length) {
        range = [self rangeOfString:str options:NSCaseInsensitiveSearch range:NSMakeRange(range.location+range.length,length-range.location-range.length)];
        if (range.location<length) {
            index = range.location;
        }
    }
    return index;
}

- (NSString *)substringFromIndex:(int)beginIndex toIndex:(int)endIndex {
    if (endIndex <= beginIndex) {
        return @"";
    }
    NSRange range = NSMakeRange(beginIndex, endIndex - beginIndex);
    return [self substringWithRange:range];
}

@end

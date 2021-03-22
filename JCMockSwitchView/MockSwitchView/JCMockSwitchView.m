//
//  JCMockSwitchView.m
//  MobileCMS3
//
//  Created by JuneCheng on 2020/4/16.
//  Copyright © 2020 zjhcsoft. All rights reserved.
//

#import "JCMockSwitchView.h"
#import "UIView+GestureCallback.h"
#import "Constants.h"

#define kMockSwitchSize CGSizeMake(60, 60)

// 屏幕宽高
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface JCMockSwitchView()
    
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UISwitch *switch_mock;

@end

@implementation JCMockSwitchView

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size = kMockSwitchSize;
    }
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

#pragma mark - Actions

- (void)switchAction {
    [[NSUserDefaults standardUserDefaults] setBool:self.switch_mock.isOn forKey:isMockEnv];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - UI

/** 创建UI */
- (void)setUI {
    self.layer.cornerRadius = 15.f;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kMockSwitchSize.width, kMockSwitchSize.height * 0.5)];
    self.label.textColor = [UIColor whiteColor];
    self.label.text = @"Mock";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
    
    self.switch_mock = [[UISwitch alloc] initWithFrame:CGRectMake(0, kMockSwitchSize.height * 0.5 - 5, kMockSwitchSize.width,kMockSwitchSize.height * 0.5)];
    CGPoint center = self.switch_mock.center;
    center.x = kMockSwitchSize.width * 0.5;
    self.switch_mock.center = center;
    self.switch_mock.on = [[NSUserDefaults standardUserDefaults] boolForKey:isMockEnv];
    // 控件大小，不能设置frame，只能用缩放比例
//    self.switch.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [self.switch_mock addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.switch_mock];
    
    __weak typeof(self) weakSelf = self;
    [self addPanGestureRecognizer:^(UIPanGestureRecognizer *recognizer, NSString *gestureId) {
        // 获取手势的移动，也是相对于最开始的位置
        CGPoint transP = [recognizer translationInView:weakSelf];
        weakSelf.transform = CGAffineTransformTranslate(weakSelf.transform, transP.x, transP.y);
        // 复位
        [recognizer setTranslation:CGPointZero inView:weakSelf];
        if (recognizer.state == UIGestureRecognizerStateEnded) {
            [UIView animateWithDuration:0.2 animations:^{
                CGFloat x = (weakSelf.frame.origin.x - kScreenWidth * 0.5) > 0 ? (kScreenWidth - weakSelf.frame.size.width - 10) : 10;
                CGFloat y = weakSelf.frame.origin.y > 10 ? weakSelf.frame.origin.y : 10;
                if (weakSelf.frame.origin.y > kScreenHeight - weakSelf.frame.size.height - 10) {
                    y = kScreenHeight - weakSelf.frame.size.height - 10;
                }
                CGRect frame = weakSelf.frame;
                frame.origin = CGPointMake(x, y);
                weakSelf.frame = frame;
            }];
        }
    }];
}

@end

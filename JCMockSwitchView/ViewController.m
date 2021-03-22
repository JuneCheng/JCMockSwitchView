//
//  ViewController.m
//  JCMockSwitchView
//
//  Created by JuneCheng on 2021/3/22.
//

#import "ViewController.h"
#import "ClientRequest.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;///<
@property (nonatomic, strong) UILabel *label;///<

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.label];
}


#pragma mark - Actions

/** 获取数据 */
- (void)getDataAction {
    [ClientRequest login:@{} success:^(NSDictionary * returnValue) {
        // TODO 使用MJExtension将NSDictionary/NSString -> 对象
        
        self.label.text = (NSString *)returnValue;
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"error--->%@",error);
    }];
}

#pragma mark - 懒加载

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(20, 200, 100, 40);
        [_button setBackgroundColor:[UIColor orangeColor]];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button setTitle:@"获取数据" forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:16.0];
        _button.layer.cornerRadius = 5.f;
        [_button addTarget:self action:@selector(getDataAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 250, 300, 100)];
        _label.font = [UIFont systemFontOfSize:14.f];
        _label.textColor = [UIColor blackColor];
    }
    return _label;
}

@end

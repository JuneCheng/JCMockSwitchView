# JCMockSwitchView
模拟/真实数据切换

# 效果图
<img src="https://user-images.githubusercontent.com/36223198/111989174-626cb980-8b4c-11eb-86d7-8a69271079bd.png" width="250" /> <img src="https://user-images.githubusercontent.com/36223198/111989355-9d6eed00-8b4c-11eb-9295-c97b5c07b849.png" width="250" />


# 使用方法
```
@interface SceneDelegate ()

@property (nonatomic, strong) JCMockSwitchView *mockView;///<

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyAndVisible];
    
    [self addMockView];
}

- (void)addMockView {
    // DEBUG模式下显示模拟数据切换按钮
    self.mockView = [[JCMockSwitchView alloc] initWithFrame:CGRectMake(10, 20*5, 0, 0)];
#ifdef DEBUG
    [[UIApplication sharedApplication].keyWindow addSubview:self.mockView];
#endif
}

@end

```


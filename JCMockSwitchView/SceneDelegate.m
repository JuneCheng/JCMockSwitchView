//
//  SceneDelegate.m
//  JCMockSwitchView
//
//  Created by JuneCheng on 2021/3/22.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "JCMockSwitchView.h"

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


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end

//
//  AppDelegate.m
//  swift_zhou
//
//  Created by taiji_zq on 2019/5/9.
//  Copyright © 2019 taiji_zq. All rights reserved.
//

#import "AppDelegate.h"
#import "swift_zhou-Swift.h"
#import "ViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) TabBarController *tabbarVC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self showLoginVC];
    [self.window makeKeyAndVisible];
    
    [self registerNotify];
    
    return YES;
}

- (void)showLoginVC {
    ViewController *loginVC = [[ViewController alloc] init];
    self.window.rootViewController = loginVC;
}

- (void)registerNotify {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotify:) name:@"kNotify_loginSuccess" object:nil];
}

- (void)handleNotify:(NSNotification*)notify {
    self.window.rootViewController = self.tabbarVC;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Setter
- (TabBarController*)tabbarVC {
    if (!_tabbarVC) {
        _tabbarVC = [[TabBarController alloc]init];
    }
    return _tabbarVC;
}


@end

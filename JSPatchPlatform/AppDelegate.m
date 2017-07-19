//
//  AppDelegate.m
//  JSPatchPlatform
//
//  Created by 小飞鸟 on 2017/7/18.
//  Copyright © 2017年 小飞鸟. All rights reserved.
//

#import "AppDelegate.h"
#import <JSPatchPlatform/JSPatch.h>
#import "SecondViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor=[UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    SecondViewController * VC =[[SecondViewController alloc]init];
    self.window.rootViewController=VC;
    
    
    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
        if (type == JPCallbackTypeJSException) {
            NSAssert(NO, data[@"msg"]);
        }
    }];
    
    //初始化SDK
    [JSPatch startWithAppKey:@"1435ec5014858c47"];
    
//    进入开发模式(开发测试时调用)
    [JSPatch setupDevelopment];
    [JSPatch setupRSAPublicKey:@"-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDCf5rlWlcw74ZFotQlIYalT/AeWofgzTFrD/tXhqm9qsqHeL18fi8mnJ0B8L2cwAmfRp8tCv6QX+xU2NkMnC8SiQKCksFiylHrBBuCGy7GruOyJdMIzR2NCXIfUxQVYaJ+A6XvU/y5UAUEaKs9GwV9pkoJII+hlOvZcxuGb4+YyQIDAQAB-----END PUBLIC KEY-----"];
    
    [JSPatch setupHttp];
    
//     同步脚本
//    [JSPatch sync];
    
    [JSPatch showDebugView];
    
//本地JS测试调用
//    [JSPatch testScriptInBundle];
    
    return YES;
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
    
    //     同步脚本
    [JSPatch sync];
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

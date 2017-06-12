//
//  AppDelegate.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "AppDelegate.h"
#import "DDSkinDefaultStorage.h"
#import "DDSkinManager.h"
#import "DDSkinDefaultStorageParser.h"

@interface AppDelegate () <DDSkinDefaultStorageParserDelegate>
@property (strong, nonatomic) NSArray<DDSkinStorage *> *storages;
@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.storages = @[[self storageWithName:@"day"], [self storageWithName:@"night"]];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
    
    return YES;
}

- (DDSkinStorage *)storageWithName:(NSString *)name {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"plist"]];
    DDSkinDefaultStorageParser *parser = [[DDSkinDefaultStorageParser alloc] initWithDictionary:dict];
    parser.delegate = self;
    [parser parse];
    
    return parser.skinStorage;
}

- (DDSkinStorage *)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser superStorageWithKey:(NSString *)key value:(NSString *)value {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:value ofType:@"plist"]];
    DDSkinDefaultStorageParser *parser1 = [[DDSkinDefaultStorageParser alloc] initWithDictionary:dict];
    parser1.delegate = self;
    [parser1 parse];
    return parser1.skinStorage;
}

- (void)onTimer:(NSTimer *)timer {
    [DDSkinManager setCurrentStorage:self.storages[self.index]];
    
    self.index ++;
    if (self.index >= self.storages.count) {
        self.index = 0;
    }
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


@end

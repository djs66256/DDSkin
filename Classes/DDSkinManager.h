//
//  DDSkinManager.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDSkinStorage.h"
#import "DDSkinMacros.h"
#import "DDSkinHandler.h"

DDExtern NSString * const DDSkinStorageWillChangeNotification;
DDExtern NSString * const DDSkinStorageDidChangeNotification;

@interface DDSkinManager : NSObject

+ (void)setCurrentStorage:(id<DDSkinStorageProtocol>)storage;
+ (id<DDSkinStorageProtocol>)currentStorage;

+ (void)registerTarget:(NSObject *)target handler:(DDSkinHandler *)handler apply:(BOOL)apply;
+ (void)unregisterTarget:(NSObject *)target key:(NSString *)key;
+ (DDSkinHandler *)handlerWithTarget:(NSObject *)target key:(NSString *)key;


+ (void)refreshAll;

@end

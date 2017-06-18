//
//  DDSkinManager.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "DDSkinManager.h"
#import "DDSkinCore.h"

NSString * const DDSkinStorageWillChangeNotification = @"DDSkinStorageWillChangeNotification";
NSString * const DDSkinStorageDidChangeNotification = @"DDSkinStorageDidChangeNotification";

@implementation DDSkinManager

+ (void)setCurrentStorage:(id<DDSkinStorageProtocol>)storage {
    DDSkinSetCurrentStorage(storage);
}

+ (id<DDSkinStorageProtocol>)currentStorage {
    return DDSkinGetCurrentStorage();
}

+ (void)refreshAll {
    DDSkinRefreshAllTarget();
}

+ (void)registerTarget:(NSObject *)target handler:(DDSkinHandler *)handler apply:(BOOL)apply {
    DDSkinRegisterTargetHandler(target, handler, apply);
}

+ (void)unregisterTarget:(NSObject *)target key:(NSString *)key {
    DDSkinUnregisterTargetHandler(target, key);
}

+ (DDSkinHandler *)handlerWithTarget:(NSObject *)target key:(NSString *)key {
    return DDSkinGetTargetHandlerByKey(target, key);
}

@end

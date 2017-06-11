//
//  DDSkinManager.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "DDSkinManager.h"
#import "DDSkinCore.h"

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

@end

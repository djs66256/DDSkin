//
//  DDSkinManager.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDSkinStorage.h"

@interface DDSkinManager : NSObject

+ (void)setCurrentStorage:(id<DDSkinStorageProtocol>)storage;
+ (id<DDSkinStorageProtocol>)currentStorage;

+ (void)refreshAll;

@end

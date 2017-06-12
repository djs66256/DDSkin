//
//  DDSkinStorage.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DDSkinStorageProtocol <NSObject>

- (NSObject *)objectForKey:(NSString *)key;

- (UIColor *)colorForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSURL *)urlForKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (NSNumber *)numberForKey:(NSString *)key;
- (UIFont *)fontForKey:(NSString *)key;
- (BOOL)booleanForKey:(NSString *)key;

@end

@interface DDSkinStorage : NSObject <DDSkinStorageProtocol>

@property (strong, nonatomic) DDSkinStorage *superStorage;

@end

//
//  DDSkinHandler.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDSkinStorage.h"

typedef NS_ENUM(NSInteger, DDSkinHandlerKeyPathValueType) {
    DDSkinHandlerKeyPathValueTypeColor,
    DDSkinHandlerKeyPathValueTypeString,
    DDSkinHandlerKeyPathValueTypeUrl,
    DDSkinHandlerKeyPathValueTypeNumber,
    DDSkinHandlerKeyPathValueTypeBoolean,
    DDSkinHandlerKeyPathValueTypeImage,
    DDSkinHandlerKeyPathValueTypeSize,
    DDSkinHandlerKeyPathValueTypeObject,
};

NS_ASSUME_NONNULL_BEGIN

@interface DDSkinHandler<TargetType: NSObject *> : NSObject {
    @protected
    NSString *_targetKey, *_storageKey;
}

@property (readonly, copy, nonatomic) NSString *storageKey;
@property (readonly, copy, nonatomic) NSString *targetKey;      // unique key, use by isEqual:

- (void)handleSkinChanged:(id<DDSkinStorageProtocol>)skinStorage target:(TargetType)target;

+ (instancetype)handlerWithKeyPath:(NSString *)keyPath valueType:(DDSkinHandlerKeyPathValueType)type storageKey:(NSString *)storageKey;
+ (instancetype)handlerWithTargetKey:(NSString *)targetKey storageKey:(NSString *)storageKey handler:(void(^)(id<DDSkinStorageProtocol> skinStorage, TargetType target))handler;

@end

NS_ASSUME_NONNULL_END

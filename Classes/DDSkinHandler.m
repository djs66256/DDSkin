//
//  DDSkinHandler.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "DDSkinHandler.h"
#import "DDSkinMacros.h"

@interface DDSkinKeyPathHandler : DDSkinHandler
@property (assign, nonatomic) DDSkinHandlerKeyPathValueType valueType;
- (instancetype)initWithKeyPath:(NSString *)keyPath valueType:(DDSkinHandlerKeyPathValueType)type storageKey:(NSString *)storageKey;
@end

@interface DDSkinBlockHandler<TargetType: NSObject *> : DDSkinHandler
@property (copy, nonatomic) DDSkinHandlerBlock block;
- (instancetype)initWithTargetKey:(NSString *)targetKey storageKey:(NSString *)storageKey block:(DDSkinHandlerBlock)block;
@end

@implementation DDSkinHandler

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if ([object isKindOfClass:[DDSkinHandler class]]) {
        return [self.targetKey isEqualToString:((DDSkinHandler *)object).targetKey];
    }
    return NO;
}

- (void)handleSkinChanged:(id<DDSkinStorageProtocol>)skinStorage target:(NSObject *)target {}

+ (instancetype)handlerWithKeyPath:(NSString *)keyPath valueType:(DDSkinHandlerKeyPathValueType)type storageKey:(NSString *)storageKey {
    return [[DDSkinKeyPathHandler alloc] initWithKeyPath:keyPath valueType:type storageKey:storageKey];
}
+ (instancetype)handlerWithTargetKey:(NSString *)targetKey storageKey:(NSString *)storageKey block:(nonnull DDSkinHandlerBlock)handler {
    return [[DDSkinBlockHandler alloc] initWithTargetKey:targetKey storageKey:storageKey block:handler];
}

@end


@implementation DDSkinKeyPathHandler

- (instancetype)initWithKeyPath:(NSString *)keyPath valueType:(DDSkinHandlerKeyPathValueType)type storageKey:(NSString *)storageKey
{
    self = [super init];
    if (self) {
        _targetKey = [keyPath copy];
        _valueType = type;
        _storageKey = [storageKey copy];
    }
    return self;
}

- (void)handleSkinChanged:(id<DDSkinStorageProtocol>)skinStorage target:(NSObject *)target {
    NSParameterAssert(_targetKey != nil);
    DDAssertMainThread();
    NSObject *value = nil;
    switch (self.valueType) {
        case DDSkinHandlerKeyPathValueTypeColor:
            value = [skinStorage colorForKey:self.storageKey];
            break;
        case DDSkinHandlerKeyPathValueTypeString:
            value = [skinStorage stringForKey:self.storageKey];
            break;
        case DDSkinHandlerKeyPathValueTypeUrl:
            value = [skinStorage urlForKey:self.storageKey];
            break;
        case DDSkinHandlerKeyPathValueTypeObject:
            value = [skinStorage objectForKey:self.storageKey];
            break;
        default:
            break;
    }
    [target setValue:value forKey:self.targetKey];
}

@end

@implementation DDSkinBlockHandler

- (instancetype)initWithTargetKey:(NSString *)targetKey storageKey:(NSString *)storageKey block:(DDSkinHandlerBlock)block
{
    self = [super init];
    if (self) {
        _targetKey = [targetKey copy];
        _storageKey = [storageKey copy];
        _block = block;
    }
    return self;
}

- (void)handleSkinChanged:(id<DDSkinStorageProtocol>)skinStorage target:(NSObject *)target {
    DDAssertMainThread();
    if (self.block) {
        self.block(self, skinStorage, target);
    }
}

@end

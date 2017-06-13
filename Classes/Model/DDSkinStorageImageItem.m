//
//  DDSkinStorageImageItem.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/12.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "DDSkinStorageImageItem.h"

@interface DDSkinStorageBundleImageItem : DDSkinStorageImageItem
@property (strong, nonatomic) NSBundle *bundle;
@property (strong, nonatomic) NSString *name;
@end

@interface DDSkinStorageLocalImageItem : DDSkinStorageImageItem
@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSString *basePath;
@end

@implementation DDSkinStorageImageItem
- (UIImage *)value {
    return nil;
}

+ (instancetype)bundleImageWithName:(NSString *)name bundle:(NSBundle *)bundle {
    DDSkinStorageBundleImageItem *item = [DDSkinStorageBundleImageItem new];
    item.bundle = bundle;
    item.name = name;
    return item;
}

+ (instancetype)localImageWithPath:(NSString *)path basePath:(NSString *)basePath {
    DDSkinStorageLocalImageItem *item = [DDSkinStorageLocalImageItem new];
    item.path = path;
    item.basePath = basePath;
    return item;
}

@end

@implementation DDSkinStorageBundleImageItem

- (UIImage *)value {
    NSParameterAssert(self.name != nil);
    if (self.name == nil) return nil;
    if (self.bundle) {
        NSString *path = [self.bundle pathForResource:[self.name stringByDeletingPathExtension] ofType:self.name.pathExtension];
        return [UIImage imageWithContentsOfFile:path];
    }
    else {
        return [UIImage imageNamed:self.name];
    }
}

@end

@implementation DDSkinStorageLocalImageItem

- (UIImage *)value {
    NSParameterAssert(self.path != nil);
    if (self.path == nil) return nil;
    NSString *path = nil;
    if (self.basePath) {
        path = [self.basePath stringByAppendingPathComponent:self.path];
    }
    else {
        path = self.path;
    }
    return [UIImage imageWithContentsOfFile:path];
}

@end

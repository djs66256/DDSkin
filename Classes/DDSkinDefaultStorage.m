//
//  DDSkinDefaultStorage.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "DDSkinDefaultStorage.h"

NSString * const DDSkinDefaultStorageSuperKey   = @"super";     // super
NSString * const DDSkinDefaultStorageColorsKey  = @"colors";     // color
NSString * const DDSkinDefaultStorageStringsKey = @"strings";    // string
NSString * const DDSkinDefaultStorageUrlsKey    = @"urls";       // url
NSString * const DDSkinDefaultStorageObjectsKey = @"objects";    // object
NSString * const DDSkinDefaultStorageImagesKey  = @"images";     // image

@implementation DDSkinDefaultStorage {
    NSDictionary *_colors;
    NSDictionary *_strings;
    NSDictionary *_urls;
    NSDictionary *_objects;
    NSDictionary *_imageNames;
}

- (instancetype)initWithConfig:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        if (dict[DDSkinDefaultStorageSuperKey]) {
            self.superStorage = [[DDSkinDefaultStorage alloc] initWithConfig:dict[DDSkinDefaultStorageSuperKey]];
        }
        _colors = dict[DDSkinDefaultStorageColorsKey];
        _objects = dict[DDSkinDefaultStorageObjectsKey];
        _strings = dict[DDSkinDefaultStorageStringsKey];
        _urls = dict[DDSkinDefaultStorageUrlsKey];
        _objects = dict[DDSkinDefaultStorageObjectsKey];
        _imageNames = dict[DDSkinDefaultStorageImagesKey];
    }
    return self;
}

- (NSObject *)objectForKey:(NSString *)key {
    return _objects[key];
}

- (UIColor *)colorForKey:(NSString *)key {
    return _colors[key];
}

- (NSString *)stringForKey:(NSString *)key {
    return _strings[key];
}

- (NSURL *)urlForKey:(NSString *)key {
    return _urls[key];
}

- (UIImage *)imageForKey:(NSString *)key {
    NSString *imageName = _imageNames[key];
    return [UIImage imageNamed:imageName];
}

@end

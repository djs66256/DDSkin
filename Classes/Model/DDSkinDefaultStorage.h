//
//  DDSkinDefaultStorage.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "DDSkinStorage.h"
#import "DDSkinMacros.h"
#import "DDSkinStorageImageItem.h"

DDExtern NSString * const DDSkinDefaultStorageSuperKey;     // super
DDExtern NSString * const DDSkinDefaultStorageColorsKey;     // color
DDExtern NSString * const DDSkinDefaultStorageStringsKey;    // string
DDExtern NSString * const DDSkinDefaultStorageUrlsKey;       // url
DDExtern NSString * const DDSkinDefaultStorageObjectsKey;    // object
DDExtern NSString * const DDSkinDefaultStorageImagesKey;     // image


@interface DDSkinDefaultStorage : DDSkinStorage

- (void)setColorsDictionary:(NSDictionary<NSString *, UIColor *> *)colors;
- (void)setStringsDictionary:(NSDictionary<NSString *, NSString *> *)strings;
- (void)setUrlsDictionary:(NSDictionary<NSString *, NSURL *> *)url;
- (void)setImagesDictionary:(NSDictionary<NSString *, DDSkinStorageImageItem *> *)images;
- (void)setObjectsDictionary:(NSDictionary<NSString *, NSObject *> *)objects;

@end

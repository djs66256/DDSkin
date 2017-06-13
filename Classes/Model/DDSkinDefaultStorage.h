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


@interface DDSkinDefaultStorage : DDSkinStorage

- (void)setColorsDictionary:(NSDictionary<NSString *, UIColor *> *)colors;
- (void)setStringsDictionary:(NSDictionary<NSString *, NSString *> *)strings;
- (void)setUrlsDictionary:(NSDictionary<NSString *, NSURL *> *)url;
- (void)setImagesDictionary:(NSDictionary<NSString *, DDSkinStorageImageItem *> *)images;
- (void)setObjectsDictionary:(NSDictionary<NSString *, NSObject *> *)objects;
- (void)setNumbersDictionary:(NSDictionary<NSString *, NSNumber *> *)numbers;
- (void)setBooleanDictionary:(NSDictionary<NSString *, NSNumber *> *)booleans;
- (void)setFontDictionary:(NSDictionary<NSString *, UIFont *> *)fonts;

@end

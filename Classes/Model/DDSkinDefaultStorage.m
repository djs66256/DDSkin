//
//  DDSkinDefaultStorage.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <pthread/pthread.h>
#import "DDSkinDefaultStorage.h"
#import "DDSkinCore.h"

@implementation DDSkinDefaultStorage {
    NSDictionary<NSString *, UIColor *>     *_colors;
    NSDictionary<NSString *, NSString *>    *_strings;
    NSDictionary<NSString *, NSURL *>       *_urls;
    NSDictionary<NSString *, NSObject *>    *_objects;
    NSDictionary<NSString *, DDSkinStorageImageItem *> *_images;
    
    NSDictionary<NSString *, NSNumber *>    *_numbers;
    NSDictionary<NSString *, NSNumber *>    *_booleans;
    NSDictionary<NSString *, UIFont *>      *_fonts;
    NSDictionary<NSString *, NSValue *>     *_sizes;
}

#define DDSkinIsCurrentStorage(self) \
({ \
    BOOL isCurrent = NO; \
    DDSkinStorage *s = DDSkinGetCurrentStorage(); \
    while (s != nil) { \
        if (s == self) { \
            isCurrent = YES; \
            break; \
        } \
        s = s.superStorage; \
    } \
    isCurrent; \
})

#define DDSkinAssertCurrentStorage() NSAssert(!DDSkinIsCurrentStorage(self), @"Storage can not be edit when it is Current Storage!")

- (void)setColorsDictionary:(NSDictionary<NSString *, UIColor *> *)colors {
    DDSkinAssertCurrentStorage();
    _colors = colors.copy;
}
- (void)setStringsDictionary:(NSDictionary<NSString *, NSString *> *)strings {
    DDSkinAssertCurrentStorage();
    _strings = strings.copy;
}
- (void)setUrlsDictionary:(NSDictionary<NSString *, NSURL *> *)urls {
    DDSkinAssertCurrentStorage();
    _urls = urls.copy;
}
- (void)setImagesDictionary:(NSDictionary<NSString *, DDSkinStorageImageItem *> *)images {
    DDSkinAssertCurrentStorage();
    _images = images.copy;
}
- (void)setObjectsDictionary:(NSDictionary<NSString *, NSObject *> *)objects {
    DDSkinAssertCurrentStorage();
    _objects = objects.copy;
}
- (void)setNumbersDictionary:(NSDictionary<NSString *, NSNumber *> *)numbers {
    DDSkinAssertCurrentStorage();
    _numbers = numbers.copy;
}
- (void)setBooleanDictionary:(NSDictionary<NSString *, NSNumber *> *)booleans {
    DDSkinAssertCurrentStorage();
    _booleans = booleans.copy;
}
- (void)setFontDictionary:(NSDictionary<NSString *, UIFont *> *)fonts {
    DDSkinAssertCurrentStorage();
    _fonts = fonts.copy;
}
- (void)setSizeDictionary:(NSDictionary<NSString *, NSValue *> *)sizes {
    DDSkinAssertCurrentStorage();
    _sizes = sizes.copy;
}

- (NSObject *)objectForKey:(NSString *)key {
    return _objects[key] ?: [self.superStorage objectForKey:key];
}

- (UIColor *)colorForKey:(NSString *)key {
    return _colors[key] ?: [self.superStorage colorForKey:key];
}

- (NSString *)stringForKey:(NSString *)key {
    return _strings[key] ?: [self.superStorage stringForKey:key];
}

- (NSURL *)urlForKey:(NSString *)key {
    return _urls[key] ?: [self.superStorage urlForKey:key];
}

- (UIImage *)imageForKey:(NSString *)key {
    DDSkinStorageImageItem *image = _images[key];
    if (image) {
        return image.value;
    }
    else {
        return [self.superStorage imageForKey:key];
    }
}

@end

//
//  DDSkinDefaultStorageParser.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "DDSkinDefaultStorageParser.h"
#import "DDSkinDefaultStorage.h"
#import "DDSkinStorageParserHelper.h"

NSString * const DDSkinDefaultStorageSuperKey   = @"super";     // super
NSString * const DDSkinDefaultStorageColorsKey  = @"colors";     // color
NSString * const DDSkinDefaultStorageStringsKey = @"strings";    // string
NSString * const DDSkinDefaultStorageUrlsKey    = @"urls";       // url
NSString * const DDSkinDefaultStorageNumbersKey = @"numbers";       // numbers
NSString * const DDSkinDefaultStorageObjectsKey = @"objects";    // object
NSString * const DDSkinDefaultStorageImagesKey  = @"images";     // image
NSString * const DDSkinDefaultStorageBooleansKey= @"booleans";   // bool
NSString * const DDSkinDefaultStorageFontsKey   = @"fonts";      // font


#define _DDSkinStorageParserAssertType(name, type) NSAssert([name isKindOfClass:[type class]], @"%@<%@> is not " #type "!", @#name, [name class])
#define DDSkinStorageParserAssertString(name) _DDSkinStorageParserAssertType(name, NSString)
#define DDSkinStorageParserAssertDictionary(name) _DDSkinStorageParserAssertType(name, NSDictionary)


@implementation DDSkinDefaultStorageParser {
    NSDictionary *_dict;
    DDSkinDefaultStorage *_storage;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _dict = dict;
    }
    return self;
}

- (void)parse {
    _storage = [[DDSkinDefaultStorage alloc] init];
    
    NSString *superName = _dict[DDSkinDefaultStorageSuperKey];
    if (superName && [superName isKindOfClass:[NSString class]]
        && [self.delegate respondsToSelector:@selector(skinDefaultStorageParser:superStorageWithKey:value:)]) {
        _storage.superStorage = [self.delegate skinDefaultStorageParser:self
                                                    superStorageWithKey:DDSkinDefaultStorageSuperKey
                                                                  value:superName];
    }
    
    
    // colors
    NSDictionary *colors = _dict[DDSkinDefaultStorageColorsKey];
    if (colors) {
        if ([colors isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithCapacity:colors.count];
            if ([self.delegate respondsToSelector:@selector(skinDefaultStorageParser:colorWithKey:value:)]) {
                [colors enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[NSString class]]) {
                        result[key] = [self.delegate skinDefaultStorageParser:self colorWithKey:key value:obj];
                    }
                }];
            }
            else {
                [colors enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[NSString class]]) {
                        result[key] = DDSkinStorageParseColorFromString(obj);
                    }
                }];
            }
            [_storage setColorsDictionary:result];
        }
        else {
            DDSkinStorageParserAssertDictionary(colors);
        }
    }
    
    // strings
    NSDictionary *strings = _dict[DDSkinDefaultStorageStringsKey];
    if (strings) {
        if ([strings isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary<NSString *, NSString *> *result = [NSMutableDictionary new];
            [strings enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                NSParameterAssert([obj isKindOfClass:[NSString class]]);
                if ([obj isKindOfClass:[NSString class]]) {
                    result[key] = obj;
                }
            }];
            [_storage setStringsDictionary:result];
        }
        else {
            DDSkinStorageParserAssertDictionary(strings);
        }
    }
    
    // urls
    NSDictionary *urls = _dict[DDSkinDefaultStorageUrlsKey];
    if (urls) {
        if ([urls isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary<NSString *, NSURL *> *result = [NSMutableDictionary new];
            if ([self.delegate respondsToSelector:@selector(skinDefaultStorageParser:urlWithKey:value:)]) {
                [urls enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    NSParameterAssert([obj isKindOfClass:[NSString class]]);
                    result[key] = [self.delegate skinDefaultStorageParser:self urlWithKey:key value:obj];
                }];
            }
            else {
                [urls enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    NSParameterAssert([obj isKindOfClass:[NSString class]]);
                    if ([obj isKindOfClass:[NSString class]]) {
                        result[key] = [NSURL URLWithString:obj];
                    }
                }];
            }
            [_storage setUrlsDictionary:result];
        }
        else {
            DDSkinStorageParserAssertDictionary(urls);
        }
    }
    
    // numbers
    NSDictionary *numbers = _dict[DDSkinDefaultStorageNumbersKey];
    if (numbers) {
        if ([numbers isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary<NSString *, NSNumber *> *result = [[NSMutableDictionary alloc] initWithCapacity:numbers.count];
            if ([self.delegate respondsToSelector:@selector(skinDefaultStorageParser:numberWithKey:value:)]) {
                [numbers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    result[key] = [self.delegate skinDefaultStorageParser:self numberWithKey:key value:obj];
                }];
            }
            else {
                [numbers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[NSNumber class]]) {
                        result[key] = (NSNumber *)obj;
                    }
                    else if ([obj isKindOfClass:[NSString class]]) {
                        result[key] = @(((NSString *)obj).doubleValue);
                    }
                }];
            }
            [_storage setNumbersDictionary:result];
        }
        else {
            DDSkinStorageParserAssertDictionary(numbers);
        }
    }
    
    // images
    NSDictionary *images = _dict[DDSkinDefaultStorageImagesKey];
    if (images) {
        if ([images isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary<NSString *, DDSkinStorageImageItem *> *result = [[NSMutableDictionary alloc] initWithCapacity:images.count];
            if ([self.delegate respondsToSelector:@selector(skinDefaultStorageParser:imageWithKey:value:)]) {
                [images enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[NSString class]]) {
                        result[key] = [self.delegate skinDefaultStorageParser:self imageWithKey:key value:obj];
                    }
                }];
            }
            else {
                [images enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[NSString class]]) {
                        result[key] = [DDSkinStorageImageItem bundleImageWithName:obj bundle:nil];
                    }
                }];
            }
            [_storage setImagesDictionary:result];
        }
        else {
            DDSkinStorageParserAssertDictionary(images);
        }
    }
    
    // bool
    NSDictionary *bools = _dict[DDSkinDefaultStorageBooleansKey];
    if (bools) {
        if ([bools isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary<NSString *, NSNumber *> *result = [[NSMutableDictionary alloc] initWithCapacity:bools.count];
            if ([self.delegate respondsToSelector:@selector(skinDefaultStorageParser:booleanWithKey:value:)]) {
                [bools enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[NSString class]]) {
                        result[key] = @([self.delegate skinDefaultStorageParser:self booleanWithKey:key value:obj]);
                    }
                }];
            }
            else {
                [bools enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[NSNumber class]]) {
                        result[key] = obj;
                    }
                    else if ([obj isKindOfClass:[NSString class]]) {
                        result[key] = @([(NSString *)obj boolValue]);
                    }
                }];
            }
            [_storage setBooleanDictionary:result];
        }
        else {
            DDSkinStorageParserAssertDictionary(bools);
        }
    }
    
    // font
    NSDictionary *fonts = _dict[DDSkinDefaultStorageFontsKey];
    if (fonts) {
        if ([fonts isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary<NSString *, UIFont *> *result = [[NSMutableDictionary alloc] initWithCapacity:fonts.count];
            if ([self.delegate respondsToSelector:@selector(skinDefaultStorageParser:fontWithKey:value:)]) {
                [fonts enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    result[key] = [self.delegate skinDefaultStorageParser:self fontWithKey:key value:obj];
                }];
            }
            else {
                [fonts enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[NSString class]]) {
                        result[key] = DDSkinStorageParseFontFromString(obj);
                    }
                    else if ([obj isKindOfClass:[NSDictionary class]]) {
                        result[key] = DDSkinStorageParseFontFromDictionary(obj);
                    }
                }];
            }
            [_storage setFontDictionary:result];
        }
        else {
            DDSkinStorageParserAssertDictionary(fonts);
        }
    }
    
    // object
    NSDictionary *objects = _dict[DDSkinDefaultStorageObjectsKey];
    if (objects) {
        [_storage setObjectsDictionary:objects];
    }
}

- (DDSkinStorage *)skinStorage {
    return _storage;
}

@end

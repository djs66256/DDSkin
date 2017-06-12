//
//  DDSkinDefaultStorageParser.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "DDSkinDefaultStorageParser.h"
#import "DDSkinDefaultStorage.h"

#define _DDSkinStorageParserAssertType(name, type) NSAssert([name isKindOfClass:[type class]], @"%@<%@> is not " #type "!", @#name, [name class])
#define DDSkinStorageParserAssertString(name) _DDSkinStorageParserAssertType(name, NSString)
#define DDSkinStorageParserAssertDictionary(name) _DDSkinStorageParserAssertType(name, NSDictionary)


/**
 #fff
 #ffffff
 rgb(255, 255, 255)
 rgba(255, 255, 255, 1)

 @param str css color string
 @return nil if invalidate css color
 */
static inline UIColor *DDSkinDefaultStorageParseColorFromString(NSString *str) {
    str = str.lowercaseString;
    if ([str hasPrefix:@"#"] && (str.length == 4 || str.length == 7)) {
        NSScanner *scanner = [[NSScanner alloc] initWithString:str];
        unsigned long long i = 0;
        scanner.scanLocation = 1;
        if ([scanner scanHexLongLong:&i]) {
            if (str.length == 4) {
                return [UIColor colorWithRed:(i >> 16)/255.
                                       green:(i&0xf0 >> 8)/255.
                                        blue:i&0xf
                                       alpha:1];
            }
            else {
                return [UIColor colorWithRed:(i >> 32)/255.
                                       green:(i&0xff00 >> 16)/255.
                                        blue:i&0xff
                                       alpha:1];
            }
        }
    }
    else if ([str hasPrefix:@"rgb"]) {
        NSScanner *scanner = [[NSScanner alloc] initWithString:str];
        scanner.charactersToBeSkipped = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        if ([scanner scanString:@"rgba" intoString:nil]) {
            float red = 0, green = 0, blue = 0, alpha = 0;
            if ([scanner scanString:@"(" intoString:nil]
                && [scanner scanFloat:&red]
                && [scanner scanString:@"," intoString:nil]
                && [scanner scanFloat:&green]
                && [scanner scanString:@"," intoString:nil]
                && [scanner scanFloat:&blue]
                && [scanner scanString:@"," intoString:nil]
                && [scanner scanFloat:&alpha]
                && [scanner scanString:@")" intoString:nil]) {
                return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:alpha];
            }
        }
        else if ([scanner scanString:@"rgb" intoString:nil]) {
            float red = 0, green = 0, blue = 0;
            if ([scanner scanString:@"(" intoString:nil]
                && [scanner scanFloat:&red]
                && [scanner scanString:@"," intoString:nil]
                && [scanner scanFloat:&green]
                && [scanner scanString:@"," intoString:nil]
                && [scanner scanFloat:&blue]
                && [scanner scanString:@")" intoString:nil]) {
                return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1];
            }
        }
    }
    return nil;
}

static NSDictionary<NSString *, UIColor *> *DDSkinDefaultStorageParseColors(NSDictionary *dict) {
    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithCapacity:dict.count];
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            result[key] = DDSkinDefaultStorageParseColorFromString(obj);
        }
    }];
    return result;
}

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
    
    NSDictionary *colors = _dict[DDSkinDefaultStorageColorsKey];
    if (colors) {
        if ([colors isKindOfClass:[NSDictionary class]]) {
            [_storage setColorsDictionary:DDSkinDefaultStorageParseColors(colors)];
        }
        else {
            DDSkinStorageParserAssertDictionary(colors);
        }
    }
    
    NSDictionary *strings = _dict[DDSkinDefaultStorageStringsKey];
    if (strings) {
        if ([strings isKindOfClass:[NSDictionary class]]) {
            [_storage setStringsDictionary:strings];
        }
        else {
            DDSkinStorageParserAssertDictionary(strings);
        }
    }
    
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
                    result[key] = [NSURL URLWithString:obj];
                }];
            }
            [_storage setUrlsDictionary:result];
        }
        else {
            DDSkinStorageParserAssertDictionary(urls);
        }
    }
}

- (DDSkinStorage *)skinStorage {
    return _storage;
}

@end

//
//  DDSkinStorageParserHelper.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "DDSkinStorageParserHelper.h"

/**
 #fff
 #ffffff
 rgb(255, 255, 255)
 rgba(255, 255, 255, 1)
 
 @param str css color string
 @return nil if invalidate css color
 */
UIColor *DDSkinStorageParseColorFromString(NSString *str) {
    str = str.lowercaseString;
    if ([str hasPrefix:@"#"] && (str.length == 4 || str.length == 7)) {
        NSScanner *scanner = [[NSScanner alloc] initWithString:str];
        unsigned long long i = 0;
        scanner.scanLocation = 1;
        if ([scanner scanHexLongLong:&i]) {
            if (str.length == 4) {
                return [UIColor colorWithRed:(i >> 8)/15.
                                       green:((i >> 4) &0xf)/15.
                                        blue:(i & 0xf)/15.
                                       alpha:1];
            }
            else {
                return [UIColor colorWithRed:(i >> 16)/255.
                                       green:((i >> 8) & 0xff)/255.
                                        blue:(i & 0xff)/255.
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
                return [UIColor colorWithRed:red/255. green:green/255. blue:blue/255. alpha:alpha];
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
                return [UIColor colorWithRed:red/255. green:green/255. blue:blue/255. alpha:1];
            }
        }
    }
    return nil;
}


UIFont *DDSkinStorageParseFontFromString(NSString *str) {
    if (str.length == 0) return nil;
    
    NSScanner *scanner = [[NSScanner alloc] initWithString:str];
    CGFloat size;
    if ([scanner scanDouble:&size]) {
        NSString *name = nil;
        if ([scanner scanCharactersFromSet:[NSCharacterSet whitespaceCharacterSet] intoString:nil]
            && [scanner scanUpToCharactersFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] intoString:&name]) {
            if (name && name.length > 0) {
                UIFont *font = [UIFont fontWithName:name size:size];
                if (font) {
                    return font;
                }
            }
        }
        return [UIFont systemFontOfSize:size];
    }
    return nil;
}

UIFont *DDSkinStorageParseFontFromDictionary(NSDictionary *dict) {
    id sizeObj = dict[@"size"];
    id nameObj = dict[@"name"];
    if (sizeObj && [sizeObj respondsToSelector:@selector(doubleValue)]) {
        CGFloat size = 0;
        NSString *name = nil;
        if (nameObj && [nameObj isKindOfClass:[NSString class]] && ((NSString *)nameObj).length > 0) {
            name = (NSString *)nameObj;
        }
        if (name) {
            return [UIFont fontWithName:name size:size];
        }
        else {
            return [UIFont systemFontOfSize:size];
        }
    }
    return nil;
}

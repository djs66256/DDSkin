//
//  DDSkinDefaultStorageParser.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDSkinStorage.h"
#import "DDSkinStorageImageItem.h"
#import "DDSkinMacros.h"

DDExtern NSString * const DDSkinDefaultStorageSuperKey;      // super
DDExtern NSString * const DDSkinDefaultStorageColorsKey;     // color
DDExtern NSString * const DDSkinDefaultStorageStringsKey;    // string
DDExtern NSString * const DDSkinDefaultStorageUrlsKey;       // url
DDExtern NSString * const DDSkinDefaultStorageNumbersKey;    // numbers
DDExtern NSString * const DDSkinDefaultStorageObjectsKey;    // object
DDExtern NSString * const DDSkinDefaultStorageImagesKey;     // image
DDExtern NSString * const DDSkinDefaultStorageBooleansKey;   // bool
DDExtern NSString * const DDSkinDefaultStorageFontsKey;      // font

@protocol DDSkinDefaultStorageParserDelegate;
@interface DDSkinDefaultStorageParser : NSObject

@property (weak, nonatomic) id<DDSkinDefaultStorageParserDelegate> delegate;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (void)parse;
- (DDSkinStorage *)skinStorage;

@end

@protocol DDSkinDefaultStorageParserDelegate <NSObject>
@optional
- (DDSkinStorage *)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser
                        superStorageWithKey:(NSString *)key
                                      value:(NSString *)value;
- (DDSkinStorageImageItem *)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser
                                        imageWithKey:(NSString *)key
                                               value:(NSString *)value;
- (UIColor *)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser
                         colorWithKey:(NSString *)key
                                value:(NSString *)value;
- (NSObject *)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser
                         objectWithKey:(NSString *)key
                                 value:(NSString *)value;
- (NSNumber *)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser
                         numberWithKey:(NSString *)key
                                 value:(NSString *)value;
- (BOOL)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser
                  booleanWithKey:(NSString *)key
                           value:(NSString *)value;
- (NSURL *)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser
                         urlWithKey:(NSString *)key
                              value:(NSString *)value;
- (UIFont *)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser
                         fontWithKey:(NSString *)key
                               value:(id)value;

- (void)skinDefaultStorageParserDidFinish:(DDSkinDefaultStorageParser *)parser;

@end

@interface DDSkinDefaultStorageParserBlockHandler : NSObject <DDSkinDefaultStorageParserDelegate>

@end

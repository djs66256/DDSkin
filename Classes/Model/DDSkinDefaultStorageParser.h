//
//  DDSkinDefaultStorageParser.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDSkinStorage.h"

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
- (UIImage *)skinDefaultStorageParser:(DDSkinDefaultStorageParser *)parser
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
                               value:(NSString *)value;

- (void)skinDefaultStorageParserDidFinish:(DDSkinDefaultStorageParser *)parser;

@end

@interface DDSkinDefaultStorageParserBlockHandler : NSObject <DDSkinDefaultStorageParserDelegate>

@end

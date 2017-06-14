//
//  UILabel+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DDSkin)

@property (strong, nonatomic) NSString *textSkinKey;
@property (strong, nonatomic) NSString *fontSkinKey;
@property (strong, nonatomic) NSString *textColorSkinKey;
@property (strong, nonatomic) NSString *shadowColorSkinKey;

@property (strong, nonatomic) NSString *shadowOffsetSkinKey;

@property (strong, nonatomic) NSString *textAlignmentSkinKey;
@property (strong, nonatomic) NSString *lineBreakModeSkinKey;

@property (strong, nonatomic) NSString *highlightedTextColorSkinKey;
@property (strong, nonatomic) NSString *numberOfLinesSkinKey;

@property (strong, nonatomic) NSString *adjustsFontSizeToFitWidthSkinKey;
@property (strong, nonatomic) NSString *minimumScaleFactorSkinKey;

@end

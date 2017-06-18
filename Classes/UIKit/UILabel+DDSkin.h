//
//  UILabel+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *textSkinKey;
@property (strong, nonatomic) IBInspectable NSString *fontSkinKey;
@property (strong, nonatomic) IBInspectable NSString *textColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *shadowColorSkinKey;

@property (strong, nonatomic) IBInspectable NSString *shadowOffsetSkinKey;

@property (strong, nonatomic) IBInspectable NSString *textAlignmentSkinKey;
@property (strong, nonatomic) IBInspectable NSString *lineBreakModeSkinKey;

@property (strong, nonatomic) IBInspectable NSString *highlightedTextColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *numberOfLinesSkinKey;

@property (strong, nonatomic) IBInspectable NSString *adjustsFontSizeToFitWidthSkinKey;
@property (strong, nonatomic) IBInspectable NSString *minimumScaleFactorSkinKey;

@end

//
//  UILabel+DDSkin.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "UILabel+DDSkin.h"
#import "DDSkinUIMacros.h"

@implementation UILabel (DDSkin)

DDSkinPropertyDefine(text, Text, string, String)

DDSkinPropertyDefine(font, Font, font, Font)

DDSkinPropertyDefine(textColor, TextColor, color, Color)

DDSkinPropertyDefine(shadowColor, ShadowColor, color, Color)

DDSkinPropertyDefineDefaultValue(shadowOffset, ShadowOffset, size, Size, CGSizeZero)

DDSkinNumberPropertyDefine(textAlignment, TextAlignment, integer)

DDSkinNumberPropertyDefine(lineBreakMode, LineBreakMode, integer)

DDSkinPropertyDefine(highlightedTextColor, HighlightedTextColor, color, Color)

DDSkinNumberPropertyDefine(numberOfLines, NumberOfLines, integer)

DDSkinPropertyDefineDefaultValue(adjustsFontSizeToFitWidth, AdjustsFontSizeToFitWidth, boolean, Boolean, NO)

DDSkinNumberPropertyDefineDefaultValue(minimumScaleFactor, MinimumScaleFactor, double, 1.0)

@end

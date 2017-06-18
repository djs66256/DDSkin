//
//  UITextField+DDSkin.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "UITextField+DDSkin.h"
#import "DDSkinUIMacros.h"

@implementation UITextField (DDSkin)

DDSkinPropertyDefine(textColor, TextColor, color, Color)

DDSkinPropertyDefine(font, Font, font, Font)

DDSkinNumberPropertyDefine(textAlignment, TextAlignment, integer)

DDSkinBooleanPropertyDefine(adjustsFontSizeToFitWidth, AdjustsFontSizeToFitWidth, NO)

DDSkinNumberPropertyDefine(minimumFontSize, MinimumFontSize, double)

DDSkinPropertyDefine(background, Background, image, Image)

DDSkinPropertyDefine(disabledBackground, DisabledBackground, image, Image)

@end

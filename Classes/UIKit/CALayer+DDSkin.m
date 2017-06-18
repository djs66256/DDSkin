//
//  CALayer+DDSkin.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "CALayer+DDSkin.h"
#import "DDSkinUIMacros.h"
#import "DDSkinCore.h"

@implementation CALayer (DDSkin)

DDSkinNumberPropertyDefine(cornerRadius, CornerRadius, double)

DDSkinNumberPropertyDefine(borderWidth, BorderWidth, double)

DDSkinPropertyDefineTransform(borderColor, BorderColor, color, Color, CGColor, nil)

DDSkinNumberPropertyDefine(opacity, Opacity, double)

DDSkinPropertyDefineTransform(shadowColor, ShadowColor, color, Color, CGColor, nil)

DDSkinNumberPropertyDefine(shadowOpacity, ShadowOpacity, float)

DDSkinPropertyDefineTransform(shadowOffset, ShadowOffset, size, Size, CGSizeValue, CGSizeZero)

DDSkinNumberPropertyDefine(shadowRadius, ShadowRadius, double)

@end

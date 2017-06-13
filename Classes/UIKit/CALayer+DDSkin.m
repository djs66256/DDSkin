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

DDSkinNumberPropertyDefine(cornerRadiusSkinKey, CornerRadiusSkinKey, cornerRadius, double)

DDSkinNumberPropertyDefine(borderWidthSkinKey, BorderWidthSkinKey, borderWidth, double)

DDSkinPropertyDefineTransform(borderColorSkinKey, BorderColorSkinKey, color, Color, borderColor, CGColor)

DDSkinNumberPropertyDefine(opacitySkinKey, OpacitySkinKey, opacity, double)

DDSkinPropertyDefineTransform(shadowColorSkinKey, ShadowColorSkinKey, color, Color, shadowColor, CGColor)

DDSkinNumberPropertyDefine(shadowOpacitySkinKey, ShadowOpacitySkinKey, shadowOpacity, float)

DDSkinPropertyDefineDefaultValue(shadowOffsetSkinKey, ShadowOffsetSkinKey, size, Size, shadowOffset, CGSizeZero)

DDSkinNumberPropertyDefine(shadowRadiusSkinKey, ShadowRadiusSkinKey, shadowRadius, double)

@end

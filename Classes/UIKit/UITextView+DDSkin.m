//
//  UITextView+DDSkin.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "UITextView+DDSkin.h"
#import "DDSkinUIMacros.h"

@implementation UITextView (DDSkin)

DDSkinPropertyDefine(font, Font, font, Font)

DDSkinPropertyDefine(textColor, TextColor, color, Color)

DDSkinNumberPropertyDefine(textAlignment, TextAlignment, integer)

@end

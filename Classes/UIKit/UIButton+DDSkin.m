//
//  UIButton+DDSkin.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "UIButton+DDSkin.h"
#import "DDSkinUIMacros.h"

@implementation UIButton (DDSkin)

DDSkinControlPropertyDefine1(Title, normal, Normal, string)

DDSkinControlPropertyDefine1(Title, highlighted, Highlighted, string)

DDSkinControlPropertyDefine1(Title, selected, Selected, string)

DDSkinControlPropertyDefine2(Title, selectedHighlighted, SelectedHighlighted, UIControlStateSelected|UIControlStateHighlighted, string)

DDSkinControlPropertyDefine1(Title, disabled, Disabled, string)


DDSkinControlPropertyDefine1(TitleColor, normal, Normal, color)

DDSkinControlPropertyDefine1(TitleColor, highlighted, Highlighted, color)

DDSkinControlPropertyDefine1(TitleColor, selected, Selected, color)

DDSkinControlPropertyDefine2(TitleColor, selectedHighlighted, SelectedHighlighted, UIControlStateSelected|UIControlStateHighlighted, color)

DDSkinControlPropertyDefine1(TitleColor, disabled, Disabled, color)


DDSkinControlPropertyDefine1(Image, normal, Normal, image)

DDSkinControlPropertyDefine1(Image, highlighted, Highlighted, image)

DDSkinControlPropertyDefine1(Image, selected, Selected, image)

DDSkinControlPropertyDefine2(Image, selectedHighlighted, SelectedHighlighted, UIControlStateSelected|UIControlStateHighlighted, image)

DDSkinControlPropertyDefine1(Image, disabled, Disabled, image)


DDSkinControlPropertyDefine1(BackgroundImage, normal, Normal, image)

DDSkinControlPropertyDefine1(BackgroundImage, highlighted, Highlighted, image)

DDSkinControlPropertyDefine1(BackgroundImage, selected, Selected, image)

DDSkinControlPropertyDefine2(BackgroundImage, selectedHighlighted, SelectedHighlighted, UIControlStateSelected|UIControlStateHighlighted, image)

DDSkinControlPropertyDefine1(BackgroundImage, disabled, Disabled, image)


@end

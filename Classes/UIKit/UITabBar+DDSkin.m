//
//  UITabBar+DDSkin.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "UITabBar+DDSkin.h"
#import "DDSkinUIMacros.h"

@implementation UITabBar (DDSkin)

DDSkinPropertyDefine(barTintColor, BarTintColor, color, Color)

DDSkinPropertyDefine(unselectedItemTintColor, UnselectedItemTintColor, color, Color)

DDSkinPropertyDefine(backgroundImage, BackgroundImage, image, Image)

DDSkinPropertyDefine(selectionIndicatorImage, SelectionIndicatorImage, image, Image)

DDSkinPropertyDefine(shadowImage, ShadowImage, image, Image)

DDSkinNumberPropertyDefine(itemWidth, ItemWidth, double)

DDSkinNumberPropertyDefine(itemSpacing, ItemSpacing, double)

@end

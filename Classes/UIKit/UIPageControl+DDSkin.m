//
//  UIPageControl+DDSkin.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "UIPageControl+DDSkin.h"
#import "DDSkinUIMacros.h"

@implementation UIPageControl (DDSkin)

DDSkinBooleanPropertyDefine(hidesForSinglePage, HidesForSinglePage, NO)

DDSkinBooleanPropertyDefine(defersCurrentPageDisplay, DefersCurrentPageDisplay, NO)

DDSkinPropertyDefine(pageIndicatorTintColor, PageIndicatorTintColor, color, Color)

DDSkinPropertyDefine(currentPageIndicatorTintColor, CurrentPageIndicatorTintColor, color, Color)

@end

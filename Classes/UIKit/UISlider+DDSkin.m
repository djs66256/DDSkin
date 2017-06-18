//
//  UISlider+DDSkin.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "UISlider+DDSkin.h"
#import "DDSkinUIMacros.h"

@implementation UISlider (DDSkin)

DDSkinControlPropertyDefine1(ThumbImage, normal, Normal, image)
DDSkinControlPropertyDefine1(ThumbImage, highlighted, Highlighted, image)


DDSkinControlPropertyDefine1(MinimumTrackImage, normal, Normal, image)
DDSkinControlPropertyDefine1(MinimumTrackImage, highlighted, Highlighted, image)


DDSkinControlPropertyDefine1(MaximumTrackImage, normal, Normal, image)
DDSkinControlPropertyDefine1(MaximumTrackImage, highlighted, Highlighted, image)


DDSkinPropertyDefine(minimumValueImage, MinimumValueImage, image, Image)

DDSkinPropertyDefine(maximumValueImage, MaximumValueImage, image, Image)

DDSkinPropertyDefine(minimumTrackTintColor, MinimumTrackTintColor, color, Color)

DDSkinPropertyDefine(maximumTrackTintColor, MaximumTrackTintColor, color, Color)

DDSkinPropertyDefine(thumbTintColor, ThumbTintColor, color, Color)

@end

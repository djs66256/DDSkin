//
//  UISlider+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISlider (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *normalThumbImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *highlightedThumbImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *normalMinimumTrackImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *highlightedMinimumTrackImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *normalMaximumTrackImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *highlightedMaximumTrackImageSkinKey;


@property (strong, nonatomic) IBInspectable NSString *minimumValueImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *maximumValueImageSkinKey;

@property (strong, nonatomic) IBInspectable NSString *minimumTrackTintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *maximumTrackTintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *thumbTintColorSkinKey;


@end

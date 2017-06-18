//
//  UIButton+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *normalTitleSkinKey;
@property (strong, nonatomic) IBInspectable NSString *highlightedTitleSkinKey;
@property (strong, nonatomic) IBInspectable NSString *selectedTitleSkinKey;
@property (strong, nonatomic) IBInspectable NSString *selectedHighlightedTitleSkinKey;
@property (strong, nonatomic) IBInspectable NSString *disabledTitleSkinKey;

@property (strong, nonatomic) IBInspectable NSString *normalTitleColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *highlightedTitleColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *selectedTitleColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *selectedHighlightedTitleColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *disabledTitleColorSkinKey;

@property (strong, nonatomic) IBInspectable NSString *normalImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *highlightedImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *selectedImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *selectedHighlightedImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *disabledImageSkinKey;

@property (strong, nonatomic) IBInspectable NSString *normalBackgroundImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *highlightedBackgroundImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *selectedBackgroundImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *selectedHighlightedBackgroundImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *disabledBackgroundImageSkinKey;

@end

//
//  UITextField+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *textColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *fontSkinKey;
@property (strong, nonatomic) IBInspectable NSString *textAlignmentSkinKey;
@property (strong, nonatomic) IBInspectable NSString *adjustsFontSizeToFitWidthSkinKey;
@property (strong, nonatomic) IBInspectable NSString *minimumFontSizeSkinKey;
@property (strong, nonatomic) IBInspectable NSString *backgroundSkinKey;
@property (strong, nonatomic) IBInspectable NSString *disabledBackgroundSkinKey;

@end

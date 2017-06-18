//
//  UINavigationBar+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *barTintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *shadowImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *backIndicatorImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *backIndicatorTransitionMaskImageSkinKey;

@end

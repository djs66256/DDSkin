//
//  UITabBar+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *barTintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *unselectedItemTintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *backgroundImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *selectionIndicatorImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *shadowImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *itemWidthSkinKey;
@property (strong, nonatomic) IBInspectable NSString *itemSpacingSkinKey;

@end

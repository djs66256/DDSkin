//
//  UISwitch+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISwitch (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *onTintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *tintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *thumbTintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *onImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *offImageSkinKey;

@end

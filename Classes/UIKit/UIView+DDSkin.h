//
//  UIView+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DDSkin)

@property (strong, nonatomic, nullable) IBInspectable NSString *backgroundColorSkinKey;
@property (strong, nonatomic, nullable) IBInspectable NSString *tintColorSkinKey;

@end

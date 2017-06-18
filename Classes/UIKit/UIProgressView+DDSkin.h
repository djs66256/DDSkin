//
//  UIProgressView+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIProgressView (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *progressTintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *trackTintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *progressImageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *trackImageSkinKey;

@end

//
//  CALayer+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (DDSkin)

@property (strong, nonatomic) NSString *cornerRadiusSkinKey;
@property (strong, nonatomic) NSString *borderWidthSkinKey;
@property (strong, nonatomic) NSString *borderColorSkinKey;

@property (strong, nonatomic) NSString *opacitySkinKey;

@property (strong, nonatomic) NSString *shadowColorSkinKey;
@property (strong, nonatomic) NSString *shadowOpacitySkinKey;
@property (strong, nonatomic) NSString *shadowOffsetSkinKey;
@property (strong, nonatomic) NSString *shadowRadiusSkinKey;

@end

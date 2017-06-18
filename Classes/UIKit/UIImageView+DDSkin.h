//
//  UIImageView+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *imageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *highlightedImageSkinKey;

@end

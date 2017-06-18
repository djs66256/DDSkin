//
//  UITextView+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *fontSkinKey;
@property (strong, nonatomic) IBInspectable NSString *textColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *textAlignmentSkinKey;

@end

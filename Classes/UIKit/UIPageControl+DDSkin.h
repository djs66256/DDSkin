//
//  UIPageControl+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPageControl (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *hidesForSinglePageSkinKey;
@property (strong, nonatomic) IBInspectable NSString *defersCurrentPageDisplaySkinKey;
@property (strong, nonatomic) IBInspectable NSString *pageIndicatorTintColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *currentPageIndicatorTintColorSkinKey;

@end

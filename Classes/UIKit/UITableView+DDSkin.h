//
//  UITableView+DDSkin.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (DDSkin)

@property (strong, nonatomic) IBInspectable NSString *sectionIndexColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *sectionIndexBackgroundColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *sectionIndexTrackingBackgroundColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *separatorColorSkinKey;

@end

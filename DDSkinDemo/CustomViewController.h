//
//  CustomViewController.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/18.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) IBInspectable NSString *customColorSkinKey;
@property (strong, nonatomic) IBInspectable NSString *customFontSkinKey;

@end

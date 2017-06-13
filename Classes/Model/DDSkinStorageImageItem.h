//
//  DDSkinStorageImageItem.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/12.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DDSkinStorageItemLazyLoad <NSObject>
- (id)value;
@end


@interface DDSkinStorageImageItem : NSObject <DDSkinStorageItemLazyLoad>

- (UIImage *)value;

+ (instancetype)bundleImageWithName:(NSString *)name bundle:(NSBundle *)bundle;
+ (instancetype)localImageWithPath:(NSString *)path basePath:(NSString *)basePath;

@end

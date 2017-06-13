//
//  DDSkinStorageParserHelper.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDSkinMacros.h"

/**
 #fff
 #ffffff
 rgb(255, 255, 255)
 rgba(255, 255, 255, 1)
 
 @param str css color string
 @return nil if invalidate css color
 */
DDExtern UIColor *DDSkinStorageParseColorFromString(NSString *str);


/**
 FontSize FontName

 @param str <#str description#>
 @return <#return value description#>
 */
DDExtern UIFont *DDSkinStorageParseFontFromString(NSString *str);

/**
 {
    name: xxx
    size: 12
 }

 @param dict <#dict description#>
 @return <#return value description#>
 */
DDExtern UIFont *DDSkinStorageParseFontFromDictionary(NSDictionary *dict);

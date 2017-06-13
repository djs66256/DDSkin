//
//  UIView+DDSkin.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "UIView+DDSkin.h"
#import "DDSkinUIMacros.h"

@implementation UIView (DDSkin)

//@dynamic backgroundColorSkinKey;

//- (NSString *)backgroundColorSkinKey {
//    DDSkinHandler *handler = DDSkinGetTargetHandlerByKey(self, DDSelStr(backgroundColor));
//    return handler.storageKey;
//}
//
//- (void)setBackgroundColorSkinKey:(NSString *)backgroundColorSkinKey {
//    DDAssertMainThread();
//    if (backgroundColorSkinKey) {
//        DDSkinHandler *handler = [DDSkinHandler handlerWithKeyPath:DDSelStr(backgroundColor)
//                                                         valueType:DDSkinHandlerKeyPathValueTypeColor
//                                                        storageKey:backgroundColorSkinKey];
//        DDSkinRegisterTargetHandler(self, handler, true);
//    }
//    else {
//        self.backgroundColor = nil;
//    }
//}

DDSkinPropertyDefine(backgroundColor, BackgroundColor, color, Color);

DDSkinPropertyDefine(tintColor, TintColor, color, Color);

@end

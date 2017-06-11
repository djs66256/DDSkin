//
//  DDSkinMacros.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#ifndef DDSkinMacros_h
#define DDSkinMacros_h

#define DDExtern extern

#define DDAssertMainThread() NSAssert([NSThread isMainThread], @"Must run at main thread!")
#define DDCAssertMainThread() NSCAssert([NSThread isMainThread], @"Must run at main thread!")

#if RELEASE
#define DDSelStr(sel) @#sel
#else
#define DDSelStr(sel) NSStringFromSelector(@selector(sel))
#endif

#define DDMainThreadRun(x) \
    if ([NSThread isMainThread]) { \
        (x); \
    } \
    else { \
        dispatch_async(dispatch_get_main_queue(), ^{ \
            (x); \
        }); \
    }


#define DDSkinPropertyDefine(name, upperName, type, upperType, sel) \
- (NSString *)name {\
    DDAssertMainThread();\
    DDSkinHandler *handler = DDSkinGetTargetHandlerByKey(self, DDSelStr(sel));\
    return handler.storageKey;\
}\
- (void)set ## upperName:(NSString *)key {\
    DDAssertMainThread();\
    if (key) {\
        DDSkinHandler *handler = [DDSkinHandler handlerWithKeyPath:DDSelStr(sel)\
                                                         valueType:DDSkinHandlerKeyPathValueType ## upperType\
                                                        storageKey:key];\
        DDSkinRegisterTargetHandler(self, handler, false);\
        self.sel = [DDSkinGetCurrentStorage() type ## ForKey:key];\
    }\
    else {\
        self.sel = nil;\
    }\
}

#endif /* DDSkinMacros_h */

//
//  DDUIMacros.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/14.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#ifndef DDSkinUIMacros_h
#define DDSkinUIMacros_h

#import "DDSkinMacros.h"
#import "DDSkinCore.h"

#define _DDSkinPropertyGetterDefine(name, sel) \
- (NSString *)name {\
    DDAssertMainThread();\
    DDSkinHandler *handler = DDSkinGetTargetHandlerByKey(self, DDSelStr(sel));\
    return handler.storageKey;\
}

#define _DDSkinObjectPropertySetterDefine(upperName, type, upperType, sel, defaultValue) \
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
        self.sel = defaultValue;\
    }\
}

#define _DDSkinBasicTypePropertySetterDefine(upperName, type, upperType, sel, transform, defaultValue) \
- (void)set ## upperName:(NSString *)key {\
    DDAssertMainThread();\
    if (key) {\
        DDSkinHandler *handler = [DDSkinHandler handlerWithKeyPath:DDSelStr(sel)\
                                                         valueType:DDSkinHandlerKeyPathValueType ## upperType\
                                                        storageKey:key];\
        DDSkinRegisterTargetHandler(self, handler, false);\
        self.sel = [[DDSkinGetCurrentStorage() type ## ForKey:key] transform];\
    }\
    else {\
        self.sel = defaultValue;\
    }\
}

#define _DDSkinPropertyDefine(name, upperName, type, upperType, sel) \
_DDSkinPropertyGetterDefine(name, sel) \
_DDSkinObjectPropertySetterDefine(upperName, type, upperType, sel, nil)

#define _DDSkinPropertyDefineDefaultValue(name, upperName, type, upperType, sel, defaultValue) \
_DDSkinPropertyGetterDefine(name, sel) \
_DDSkinObjectPropertySetterDefine(upperName, type, upperType, sel, defaultValue)

#define _DDSkinBasicTypePropertyDefine(name, upperName, type, upperType, sel, transform, defaultValue) \
_DDSkinPropertyGetterDefine(name, sel) \
_DDSkinBasicTypePropertySetterDefine(upperName, type, upperType, sel, transform, defaultValue)


#define DDSkinPropertyDefine(sel, upperSel, type, upperType) \
_DDSkinPropertyDefine(sel ## SkinKey, upperSel ## SkinKey, type, upperType, sel)

#define DDSkinPropertyDefineDefaultValue(sel, upperSel, type, upperType, defaultValue) \
_DDSkinPropertyDefineDefaultValue(sel ## SkinKey, upperSel ## SkinKey, type, upperType, sel, defaultValue)

#define DDSkinPropertyDefineTransform(sel, upperSel, type, upperType, transform, defaultValue) \
_DDSkinBasicTypePropertyDefine(sel ## SkinKey, upperSel ## SkinKey, type, upperType, sel, transform, defaultValue)

#define DDSkinBooleanPropertyDefine(sel, upperSel, defaultValue) \
DDSkinPropertyDefineDefaultValue(sel, upperSel, boolean, Boolean, defaultValue)

#define DDSkinNumberPropertyDefine(sel, upperSel, numberType) \
_DDSkinBasicTypePropertyDefine(sel ## SkinKey, upperSel ## SkinKey, number, Number, sel, numberType ## Value, 0)

#define DDSkinNumberPropertyDefineDefaultValue(sel, upperSel, numberType, defaultValue) \
_DDSkinBasicTypePropertyDefine(sel ## SkinKey, upperSel ## SkinKey, number, Number, sel, numberType ## Value, defaultValue)


#define _DDSkinControlPropertyDefine(upperSel, state, upperState, realState, type) \
- (void)set ## upperState ## upperSel ## SkinKey:(NSString *)key { \
    DDAssertMainThread();\
    if (key) {\
        DDSkinHandler *handler = [DDSkinHandler<typeof(self)> \
                                  handlerWithTargetKey:DDSelStr(state ## upperSel ## SkinKey) \
                                  storageKey:key \
                                  block:^(DDSkinHandler *handler, id<DDSkinStorageProtocol> skinStorage, NSObject *target) { \
                                      [(typeof(self))target set ## upperSel:[skinStorage type ## ForKey:handler.storageKey] \
                                                                   forState:realState]; \
                                  }]; \
        DDSkinRegisterTargetHandler(self, handler, false); \
        [self set ## upperSel:[DDSkinGetCurrentStorage() type ## ForKey:key] \
                     forState:realState]; \
    }\
    else {\
        [self set ## upperSel:nil forState:realState];\
    }\
}

#define DDSkinControlPropertyDefine1(upperSel, state, upperState, type)\
_DDSkinPropertyGetterDefine(state ## upperSel ## SkinKey, state ## upperSel ## SkinKey)\
_DDSkinControlPropertyDefine(upperSel, state, upperState, UIControlState ## upperState, type)

#define DDSkinControlPropertyDefine2(upperSel, state, upperState, realState, type)\
_DDSkinPropertyGetterDefine(state ## upperSel ## SkinKey, state ## upperSel ## SkinKey)\
_DDSkinControlPropertyDefine(upperSel, state, upperState, realState, type)



#endif /* DDSkinUIMacros_h */

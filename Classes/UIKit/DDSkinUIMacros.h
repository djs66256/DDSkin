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
_DDSkinBasicTypePropertyDefine(sel ## SkinKey, upperSel ## SkinKey, number, Number, sel, bool, defaultValue)

#define DDSkinNumberPropertyDefine(sel, upperSel, numberType) \
_DDSkinBasicTypePropertyDefine(sel ## SkinKey, upperSel ## SkinKey, number, Number, sel, numberType ## Value, 0)

#define DDSkinNumberPropertyDefineDefaultValue(sel, upperSel, numberType, defaultValue) \
_DDSkinBasicTypePropertyDefine(sel ## SkinKey, upperSel ## SkinKey, number, Number, sel, numberType ## Value, defaultValue)


#endif /* DDSkinUIMacros_h */

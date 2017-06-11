//
//  DDSkinHandle.h
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDSkinHandler.h"
#import "DDSkinMacros.h"

DDExtern void DDSkinSetCurrentStorage(id<DDSkinStorageProtocol> storage);
DDExtern id<DDSkinStorageProtocol> DDSkinGetCurrentStorage();
DDExtern void DDSkinRegisterTargetHandler(NSObject *target, DDSkinHandler *handler, BOOL apply);
DDExtern DDSkinHandler *DDSkinGetTargetHandlerByKey(NSObject *target, NSString *key);
DDExtern void DDSkinRefreshAllTarget();

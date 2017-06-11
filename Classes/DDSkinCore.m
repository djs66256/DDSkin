//
//  DDSkinHandle.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/11.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "DDSkinCore.h"
#import <pthread/pthread.h>

static inline NSMapTable<NSObject *, NSMutableSet<DDSkinHandler *> *> *DDSkinGetTargetHandlerTable() {
    static NSMapTable<NSObject *, NSMutableSet<DDSkinHandler *> *> *g_mapTable;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_mapTable = [NSMapTable weakToStrongObjectsMapTable];
    });
    return g_mapTable;
}

static inline pthread_mutex_t *DDSkinGetTargetHandlerTableLock() {
    static pthread_mutex_t g_lock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pthread_mutex_init(&g_lock, NULL);
    });
    return &g_lock;
}

#define DDSkinTargetHandlerTableLock(x) \
    pthread_mutex_lock(DDSkinGetTargetHandlerTableLock());\
    (x); \
    pthread_mutex_unlock(DDSkinGetTargetHandlerTableLock())


static id<DDSkinStorageProtocol> g_skinStorage = nil;
inline void DDSkinSetCurrentStorage(id<DDSkinStorageProtocol> storage) {
    BOOL refresh = false;
    DDSkinTargetHandlerTableLock({
        if (g_skinStorage != storage) {
            g_skinStorage = storage;
            
            refresh = true;
        }
    });
    if (refresh) {
        DDSkinRefreshAllTarget();
    }
}

inline id<DDSkinStorageProtocol> DDSkinGetCurrentStorage() {
    return g_skinStorage;
}

void DDSkinRegisterTargetHandler(NSObject *target, DDSkinHandler *handler, BOOL apply) {
    NSCParameterAssert(target != nil);
    NSMapTable<NSObject *, NSMutableSet<DDSkinHandler *> *> *mapTable = DDSkinGetTargetHandlerTable();
    DDSkinTargetHandlerTableLock({
        NSMutableSet<DDSkinHandler *> *handlerSet = [mapTable objectForKey:target];
        if (handlerSet == nil) {
            handlerSet = [[NSMutableSet alloc] init];
            [mapTable setObject:handlerSet forKey:target];
        }
        [handlerSet addObject:handler];
    });
    if (apply) {
        // When apply is true, must call at main thread?
        // Usually apply is on the UI thread.
        // So we make it must be on the main thread!
        DDCAssertMainThread();
        DDMainThreadRun({
            [handler handleSkinChanged:DDSkinGetCurrentStorage() target:target];
        });
    }
}

DDSkinHandler *DDSkinGetTargetHandlerByKey(NSObject *target, NSString *key) {
    NSCParameterAssert(target != nil);
    NSCParameterAssert(key != nil);
    DDSkinHandler *result = nil;
    if (target && key) {
        NSMapTable<NSObject *, NSMutableSet<DDSkinHandler *> *> *mapTable = DDSkinGetTargetHandlerTable();
        DDSkinTargetHandlerTableLock({
            NSMutableSet<DDSkinHandler *> *handlerSet = [mapTable objectForKey:target];
            for (DDSkinHandler *handler in handlerSet) {
                if ([handler.targetKey isEqualToString:key]) {
                    result = handler;
                }
                break;
            }
        });
    }
    return result;
}

void DDSkinRefreshAllTarget() {
    NSMapTable<NSObject *, NSMutableSet<DDSkinHandler *> *> *mapTable = DDSkinGetTargetHandlerTable();
    DDMainThreadRun({
        DDSkinTargetHandlerTableLock({
            for (NSObject *target in mapTable.keyEnumerator) {
                NSMutableSet<DDSkinHandler *> *handlerSet = [mapTable objectForKey:target];
                for (DDSkinHandler *handler in handlerSet) {
                    [handler handleSkinChanged:DDSkinGetCurrentStorage() target:target];
                }
            }
        });
    });
}

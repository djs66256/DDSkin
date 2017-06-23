# DDSkin
Change the app's whole style. Like night version. Without objc runtime and method swizzling.

[中文文档](./README-zh.md)

![](./Images/skin.gif?raw=true)

# Install

```
github DDSkin
```

```
pod 'DDSkin'
```

# Guide

Property set by `String` key.

if you are using IB or StoryBoard，it's easy to config.

![](./Images/ib.png?raw=true)

Code is also simple.

```objc
[self.view setBackgroundColorSkinKey:@"red"];
self.view.backgroundColorSkinKey = @"red";
```

# Settings file

Default is `DDSkinDefaultStorageParser`, and you can make your storage parser。

Default is plist, support extend and super.

Images are lazy load。

![](./Images/plist.png?raw=true)

# extension

```objc
#pragma mark - OC API
- (void)setCustomFontSkinKey:(NSString *)key {
    if (_customFontSkinKey != key) {
        _customFontSkinKey = key;
        DDSkinHandler *handler = [DDSkinHandler<typeof(self)> handlerWithTargetKey:DDSelStr(customFontSkinKey) storageKey:key block:^(DDSkinHandler * _Nonnull handler, id<DDSkinStorageProtocol>  _Nonnull skinStorage, NSObject * _Nonnull target) {
            // do some configuration...
        }];
        [DDSkinManager registerTarget:self handler:handler apply:YES];
    }
    else {
        [DDSkinManager unregisterTarget:self key:DDSelStr(customFontSkinKey)];
    }
}

#pragma mark - C API
- (void)setCustomColorSkinKey:(NSString *)key {
    if (_customColorSkinKey != key) {
        _customColorSkinKey = key;
        DDSkinHandler *handler = [DDSkinHandler<typeof(self)> handlerWithTargetKey:DDSelStr(customColorSkinKey) storageKey:key block:^(DDSkinHandler * _Nonnull handler, id<DDSkinStorageProtocol>  _Nonnull skinStorage, NSObject * _Nonnull target) {
            // do some configuration...
        }];
        DDSkinRegisterTargetHandler(self, handler, YES);
    }
    else {
        DDSkinUnregisterTargetHandler(self, key);
    }
}
```

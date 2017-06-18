# DDSkin

自动换肤框架，一个改良的换肤框架。不需要注册监听，不需要method swizzling，也不需要objc runtime。关于换肤框架改良的说明文章，敬请期待。

![](./Images/skin.gif?raw=true)

# 安装

```
github DDSkin
```

```
pod 'DDSkin'
```

# 使用

所有属性配置均以`String`类型key来配置。

如果使用的是IB或者StoryBoard，可以直接设置属性一样配置

![](./Images/ib.png?raw=true)

如果使用代码编写也只需要更新属性

```objc
[self.view setBackgroundColorSkinKey:@"red"];
self.view.backgroundColorSkinKey = @"red";
```

# 配置文件

默认实现为`DDSkinDefaultStorageParser`，也可以自定义实现。

默认配置文件实现为plist，支持继承，super为父配置

图片为lazy load，可以自己实现load方式。

![](./Images/plist.png?raw=true)

# 扩展

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

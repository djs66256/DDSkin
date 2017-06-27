在很早的时候，就考虑过换肤功能的实现，一直到现在为止都没有看到特别好的系统化的实现。所以这里自己实现了一套自认为比较好的[DDSkin](https://github.com/djs66256/DDSkin)，同时总结一下几种实现方式的利弊。

<!--more-->

# 实现方式

总的来说实现方式应该是比较统一的，使用string类型的key来代替各个image, color属性。

最早的时候，考虑过使用Proxy来替换默认的image, color实现，将消息代理到真正的实例，这样就可以动态的替换底层映射的真实对象了。但是这样做有一个问题，真实对象变化后无法主动更新到界面，这个比较难以触发自动更新，所以不太靠谱。

#### 手动模式

在更换皮肤的时候发出通知，在各个需要变化皮肤的地方手动注册通知，并且更新UI。

这是最笨的方法，但是在少量场景的时候也是最好的解决方法，简单而且侵入性小。

#### method swizzling

既然我们觉得注册通知并更新UI这种操作比较固定，而且繁琐，可以一次性的解决，那么很容易想到去hook部分接口，自动注册监听。

虽然这样解决了通知注册的问题，但是method swizzling本身就不是一种好的解决方案。

1. hook的方法是否可以被绕过，通过不同方式创建的对象所调用的方法是不一样的。
2. 每个对象都会参与监听，会导致监听对象非常庞大，并且可能不需要更新的对象也会加入监听。
3. 侵入性大，我们只能hook一些基类的方法，一不小心可能就会注册两次。

#### associated object

同样作为通知的方案，既然method swizzling不行，那么可以让一个第三方对象去监听，然后自动触发更新。

这是一个比较好的解决方案，他减少了侵入性，并且更加灵活以及可靠。但是同样，作为一个修改基类来实现的方案也有很多的缺点。

1. 由于associated object绑定实在基类进行，那么就不能排除子类覆盖了该方法的可能性，同时选定那个基类也是个问题，NSObject, UIView?
2. 同时侵入性虽然小了，但还是存在的，毕竟影响的是基类的行为。
3. 使用了objc runtime，这意味着什么呢？在一个swift为趋势的环境下，这种方案也是一种一般的解决方案。

#### weak table

参考weak属性的实现方式，这里可以使用weak table。将所有有换肤需求的对象注册到一个weak table中，在换肤的时候只需要更新表中的对象即可，这样就不需要通知，同时也分离了换肤这个功能和实际对象之间的联系。

# 特性

既然我们是一个通用型的框架，就必须考虑几点。

#### 通用性

既然我们支持了UIView的属性，那么可能我们会需要支持非视图的属性，比如View model，那么考虑到如此的通用性，设计的时候就不能局限于View。

同时，对于swift对象也可以比较好的支持。

#### 扩展性

有很多样式，不是简单的配置属性就能够达到效果的，比如富文本等，那么就要求框架能够有一定的扩展性。

# DDSkin

#### 简介

主要分成3部分

* core 负责注册对象，并且在样式更新时触发所有注册对象的更新。
* handler 对象更新操作，负责具体的更新操作。
* storage 皮肤样式存储，可支持继承。

#### core

使用了读写锁来确保线程安全，实际使用时由于UI操作需要在主线程，所以基本上来说都会在主线程操作，这里的锁可能会有点多余。

提供了c和oc两种接口，使用c是为了减少消息调用开销，实际情况应该也不会有太大影响。

#### handler

为了保证通用性和可扩展性，这里默认提供了两种实现。keyPath和block。keyPath使用的是setValue接口，属于上层接口，并不涉及oc底层，所以可以支持swift原生类。同时block提供了一种更为灵活的方案。

#### storage

本身不同团队会有不同的数据存储方案，那么这一块的变动应该是框架里最大的，所以这里提供的是协议，并且默认实现了一套以NSDictionary为基础的的方案。

```objc
@protocol DDSkinStorageProtocol <NSObject>

- (NSObject *)objectForKey:(NSString *)key;
- (UIColor *)colorForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSURL *)urlForKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (NSNumber *)numberForKey:(NSString *)key;
- (UIFont *)fontForKey:(NSString *)key;
- (NSNumber *)booleanForKey:(NSString *)key;
- (NSValue *)sizeForKey:(NSString *)key;

@end
```

每种类型设计一个接口是为了确保类型安全，防止因为误操作而出现的类型错误。

关于image，如果我们每次解析完都保存为UIImage对象，会导致内存的浪费，所以这里提供一种lazy-load的方案。这是具体实现上的方案，完全可以自己实现。

```objc
@protocol DDSkinStorageItemLazyLoad <NSObject>
- (id)value;
@end
```

#### UI层扩展

基于以上几点，那么UI层就不需要在基类中做什么事情了，只需要在支持的类型上增加部分扩展方法即可。

```objc
@property (strong, nonatomic, nullable) IBInspectable NSString *backgroundColorSkinKey;

- (NSString *)backgroundColorSkinKey {
    DDSkinHandler *handler = DDSkinGetTargetHandlerByKey(self, DDSelStr(backgroundColor));
    return handler.storageKey;
}

- (void)setBackgroundColorSkinKey:(NSString *)backgroundColorSkinKey {
    DDAssertMainThread();
    if (backgroundColorSkinKey) {
        DDSkinHandler *handler = [DDSkinHandler handlerWithKeyPath:DDSelStr(backgroundColor)
                                                         valueType:DDSkinHandlerKeyPathValueTypeColor
                                                        storageKey:backgroundColorSkinKey];
        DDSkinRegisterTargetHandler(self, handler, true);
    }
    else {
        self.backgroundColor = nil;
    }
}
```

由于大部分场景下这部分代码是重复的，所以这里使用了大量宏定义来解决这个问题。

```objc
// 上述内容可以改为
DDSkinPropertyDefine(backgroundColor, BackgroundColor, color, Color);
```

xcode高亮状态：

![](./Images/macros.png?raw=true)

为什么把key定义成这样，不加前缀是为了在IB中设置的时候不会每个都有个奇怪的前缀。

# 使用

如果使用的是IB或者StoryBoard，可以直接设置属性一样配置

![](./Images/ib.png?raw=true)

如果使用代码编写也只需要更新属性

```objc
[self.view setBackgroundColorSkinKey:@"red"];
self.view.backgroundColorSkinKey = @"red";
```

storage的默认实现为`DDSkinDefaultStorageParser`，也可以自定义实现。默认配置文件实现为plist，支持继承，super为父配置。

![](./Images/plist.png?raw=true)

# 总结

可以看到，虽然DDSkin的出发点是一套换肤方案，但实际上来说概念应该更加的广，应该定义为一套配置化方案。

由于其他配置化的数据刷新可能不像UI那么简单，autolayout可以自动更新，使用上会稍显麻烦一点。

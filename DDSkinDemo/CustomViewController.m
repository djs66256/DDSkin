//
//  CustomViewController.m
//  DDSkinDemo
//
//  Created by daniel on 2017/6/18.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "CustomViewController.h"
#import "DDSkinManager.h"
#import "DDSkinCore.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - OC API
- (void)setCustomFontSkinKey:(NSString *)key {
    if (_customFontSkinKey != key) {
        _customFontSkinKey = key;
        DDSkinHandler *handler = [DDSkinHandler<typeof(self)> handlerWithTargetKey:DDSelStr(customFontSkinKey) storageKey:key block:^(DDSkinHandler * _Nonnull handler, id<DDSkinStorageProtocol>  _Nonnull skinStorage, NSObject * _Nonnull target) {
            [(typeof(self))target updateTitleWithFont:[skinStorage fontForKey:handler.storageKey]
                                                color:[skinStorage colorForKey:[(typeof(self))target customColorSkinKey]]];
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
            [(typeof(self))target updateTitleWithFont:[skinStorage fontForKey:[(typeof(self))target customColorSkinKey]]
                                                color:[skinStorage colorForKey:handler.storageKey]];
        }];
        DDSkinRegisterTargetHandler(self, handler, YES);
    }
    else {
        DDSkinUnregisterTargetHandler(self, key);
    }
}

- (void)updateTitleWithFont:(UIFont *)font color:(UIColor *)color {
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font ?: [UIFont systemFontOfSize:17],
                                 NSForegroundColorAttributeName: color ?: [UIColor blackColor]
                                 };
    NSMutableAttributedString *attrText = [[NSMutableAttributedString alloc] initWithString:@"custion text: "];
    [attrText appendAttributedString:[[NSAttributedString alloc] initWithString:@"attributed text!" attributes:attributes]];
    self.label.attributedText = attrText;
}

@end

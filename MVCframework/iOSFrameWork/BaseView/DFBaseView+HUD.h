//
//  BaseView+HUD.h
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "DFBaseView.h"

@interface DFBaseView (HUD)

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

- (void)showHint:(NSString *)hint;

// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;

@end

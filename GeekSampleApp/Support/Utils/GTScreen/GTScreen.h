//
//  GTScreen.h
//  GeekSampleApp
//
//  Created by 朱慕之 on 2019/9/19.
//  Copyright © 2019 朱慕之. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 判断是否为横屏
#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

// 横竖屏 宽高对调
#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen ] bounds].size.height : [[UIScreen mainScreen ] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen ] bounds].size.width : [[UIScreen mainScreen ] bounds].size.height)

#define UI(x) UIAdapter(x)

#define UIRect(x,y,width,height) UIRectAdapter(x,y,width,height)

#define iPhone6Width 375 // 适配基准使用iPhone6定位

//方式2 - 屏幕宽度按比例适配（使用）
static inline NSInteger UIAdapter (float x){
    CGFloat scale = iPhone6Width / SCREEN_WIDTH;
    return (NSInteger)x /scale;
}

//...完善其他方法..size..rect..origin..
static inline CGRect UIRectAdapter(x,y,width,height){
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

//方式1 - 分机型 特定的比例（未实现）

#define STATUSBARHEIGHT (IS_IPHONE_X_XR_MAX ? 44 : 20)



@interface GTScreen : NSObject



@end

NS_ASSUME_NONNULL_END

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

// 是否为刘海屏幕
#define IS_IPHONE_X_XR_MAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)

// 机型判断主要是从两个维度：1.一个是机型直接取model号；2.一个是屏幕结合屏幕的缩放因子，此处使用的第二种方式
#define IS_IPHONE_X (SCREEN_WIDTH == [GTScreen sizeFor58Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)
#define IS_IPHONE_XR (SCREEN_WIDTH == [GTScreen sizeFor61Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)
#define IS_IPHONE_XMAX (SCREEN_WIDTH == [GTScreen sizeFor65Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)

#define STATUSBARHEIGHT (IS_IPHONE_X_XR_MAX ? 44 : 20)

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


@interface GTScreen : NSObject


/// iphone xs max
+ (CGSize)sizeFor65Inch;

/// iphone xr
+ (CGSize)sizeFor61Inch;

/// iphone x
+ (CGSize)sizeFor58Inch;


@end

NS_ASSUME_NONNULL_END

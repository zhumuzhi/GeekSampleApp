//
//  Meal.h
//  GeekSampleApp
//
//  Created by 朱慕之 on 2019/9/19.
//  Copyright © 2019 朱慕之. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 meal数据模型
 */
@interface Meal : NSObject

/**
 食物名称
 */
@property (nonatomic, strong) NSString *name;

/**
 食物图片
 */
@property (nonatomic, strong) UIImage *photo;

/**
 食物评分
 */
@property (nonatomic, assign) int rating;

@end

NS_ASSUME_NONNULL_END

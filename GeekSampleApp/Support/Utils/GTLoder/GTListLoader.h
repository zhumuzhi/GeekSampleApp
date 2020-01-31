//
//  GTListLoader.h
//  GeekSampleApp
//
//  Created by zhumuzhi on 2020/1/27.
//  Copyright © 2020 朱慕之. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTListItem.h"
//@class GTListItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);

/**
 * 列表请求
 */
@interface GTListLoader : NSObject

/**
 * 请求列表数据
 */
- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;





@end

NS_ASSUME_NONNULL_END

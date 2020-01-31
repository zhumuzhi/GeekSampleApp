//
//  GTNormalTableViewCell.h
//  GeekSampleApp
//
//  Created by 朱慕之 on 2019/9/19.
//  Copyright © 2019 朱慕之. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTListItem;

NS_ASSUME_NONNULL_BEGIN

@interface GTNormalTableViewCell : UITableViewCell

- (void)layoutTableViewCellWithItem:(GTListItem *)item;

@end

NS_ASSUME_NONNULL_END

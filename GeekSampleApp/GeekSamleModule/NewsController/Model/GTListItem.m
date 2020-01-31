//
//  GTListItem.m
//  GeekSampleApp
//
//  Created by zhumuzhi on 2020/1/31.
//  Copyright © 2020 朱慕之. All rights reserved.
//

#import "GTListItem.h"

@implementation GTListItem

- (void)configWithDictionary:(NSDictionary *)dictionary {
#warning 注意类型是否匹配
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}

@end

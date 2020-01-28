//
//  GTListLoader.m
//  GeekSampleApp
//
//  Created by zhumuzhi on 2020/1/27.
//  Copyright © 2020 朱慕之. All rights reserved.
//

#import "GTListLoader.h"

@implementation GTListLoader

- (void)loadListData {
    
    
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=6ed9a977f0c8695d2d443186b74cd521";
    
    NSURL *listURL = [NSURL URLWithString:urlString];
    
    NSURLRequest *listRequest = [[NSURLRequest alloc] initWithURL:listURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *dataTask = [session dataTaskWithRequest:listRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"请求的数据data：%@，请求的结果response：%@，请求中的错误：%@", data , response, error);
        
    }];
    
    [dataTask resume];
    
    
    NSLog(@"请求列表数据:%@", listURL);
}

@end



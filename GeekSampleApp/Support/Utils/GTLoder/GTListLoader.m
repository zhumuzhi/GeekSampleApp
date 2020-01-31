//
//  GTListLoader.m
//  GeekSampleApp
//
//  Created by zhumuzhi on 2020/1/27.
//  Copyright © 2020 朱慕之. All rights reserved.
//

#import "GTListLoader.h"
#import <AFNetworking/AFNetworking.h>

//#import "GTListItem.h"

@implementation GTListLoader

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock {
    
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=6ed9a977f0c8695d2d443186b74cd521";
    
    NSURL *listURL = [NSURL URLWithString:urlString];
    NSURLRequest *listRequest = [[NSURLRequest alloc] initWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [session dataTaskWithRequest:listRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //        NSLog(@"请求的数据data：%@，请求的结果response：%@，请求中的错误：%@", data , response, error);
        
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSLog(@"jsonObj:%@", jsonObj);
        
#warning 注意类型的检查
        
        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
        
    }];
    
    [dataTask resume];
    
// AFN测试代码
//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
//    {
//
//    }
//                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
//    {
//        NSLog(@"responseObject:%@", responseObject);
//    }
//                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
//    {
//        NSLog(@"error:%@", error);
//    }];
    

}

@end



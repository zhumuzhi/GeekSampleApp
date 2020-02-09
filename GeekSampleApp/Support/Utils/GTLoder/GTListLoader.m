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
    
    __weak typeof(self)weakSelf = self;
    
    
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
        
        [weakSelf _archiveListDataArray:listItemArray.copy];
        
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

- (void)_archiveListDataArray:(NSArray<GTListItem *> *)array {
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 拼接新建文件夹的地址
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    
    NSError *creatError;
    // 创建文件夹地址
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    
    // 创建list文件Path
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    
    
//    // 查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
//    
//    // 删除文件
//    if (fileExist) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
    // 序列化后存储文件
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    // 取出文件后反序列化
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [GTListItem class], nil] fromData:readListData error:nil];
    
    NSLog(@"%@", unarchiveObj);
    
}

- (void)_getSandBoxPath {
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 拼接新建文件夹的地址
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    
    NSError *creatError;
    // 创建文件夹地址
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    
    // 创建list文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    // 以UTF8的编码方式创建由字符串abc转化的NSData
    NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    // 查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
    // 删除文件
//    if (fileExist) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
    // 使用fileHandler操作文件
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
    
    [fileHandler seekToEndOfFile];
    [fileHandler writeData:[@"DEF" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [fileHandler synchronizeFile];
    [fileHandler closeFile];
    
}


@end



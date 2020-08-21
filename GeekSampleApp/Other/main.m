//
//  main.m
//  GeekSampleApp
//
//  Created by 朱慕之 on 2019/9/19.
//  Copyright © 2019 朱慕之. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        for (NSInteger i = 0; i<5; i++) {
            Person *p = [[Person  alloc]  init];
            p.name = [NSString stringWithFormat:@"name%@", @(i)];
            p.age  = i;
            NSString *key = [NSString stringWithFormat:@"key%@", @(i)];
            [dict setValue:p forKey:key];
        }
        NSLog(@"%@", dict);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

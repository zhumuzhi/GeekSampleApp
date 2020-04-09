//
//  TodayViewController.m
//  GTToday
//
//  Created by zhumuzhi on 2020/4/9.
//  Copyright © 2020 朱慕之. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, 200, 100)];
        [button setTitle:@"点击跳转" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(_openSampleApp) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
}

// 每次页面有刷新逻辑的时候，会回调到这个Handler中
- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
       
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

#pragma mark - Event

- (void)_openSampleApp {
    NSLog(@"打开方法");
    
    [self.extensionContext openURL:[NSURL URLWithString:@"GeekSampleAppTest"] completionHandler:^(BOOL success) {
    
    }];
    
}

@end

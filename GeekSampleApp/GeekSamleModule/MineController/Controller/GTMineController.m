//
//  GTMineController.m
//  GeekSampleApp
//
//  Created by zhumuzhi on 2020/1/12.
//  Copyright © 2020 朱慕之. All rights reserved.
//

#import "GTMineController.h"

@interface GTMineController ()

@end

@implementation GTMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 200, 50);
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"替换新年图标" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked {
    if([UIApplication sharedApplication].supportsAlternateIcons) {
        [[UIApplication sharedApplication] setAlternateIconName:@"ICONNEWYEAR" completionHandler:^(NSError * _Nullable error) {
            NSLog(@"替换屏幕图标完成");
        }];
    }
}



@end

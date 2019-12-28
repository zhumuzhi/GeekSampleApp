//
//  GTSplashView.m
//  GeekSampleApp
//
//  Created by zhumuzhi on 2019/12/28.
//  Copyright © 2019 朱慕之. All rights reserved.
//

#import "GTSplashView.h"

@interface GTSplashView ()

@property (nonatomic, strong, readwrite) UIButton *skipButton;

@end


@implementation GTSplashView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/defaultImage.png"];
        [self addSubview:({
            _skipButton = [[UIButton alloc] initWithFrame:CGRectMake(330, 100, 60, 40)];
            _skipButton.backgroundColor = [UIColor lightGrayColor];
            [_skipButton setTitle:@"跳过" forState:UIControlStateNormal];
            [_skipButton addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _skipButton;
        })];
        self.userInteractionEnabled = YES;
    }
    return self;
}

#pragma mark - Event

- (void)_removeSplashView {
    [self removeFromSuperview];
}


@end

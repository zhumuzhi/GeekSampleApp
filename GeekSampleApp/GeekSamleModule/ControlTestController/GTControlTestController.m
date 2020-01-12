//
//  GTControlTestController.m
//  GeekSampleApp
//
//  Created by zhumuzhi on 2020/1/11.
//  Copyright © 2020 朱慕之. All rights reserved.
//

#import "GTControlTestController.h"

@interface GTControlTestController ()

@end

@implementation GTControlTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextView * textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 100, 20, 20)];
    [self.view addSubview:textView];
    
    textView.text = @"asdasdasdasdasdasdasda\nasasdasdasdasdasdasdasda\nasasdasdasdasdasdasdasda\nasasdasdasdasdasdasdasda\nasasdasdasdasdasdasdasda\nasasdasdasdasdasdasdasda\nasasdasdasdasdasdasdasda\nas";

//    textView.text = @"asdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasdaasdasdasdasdasdasdasda";
    textView.backgroundColor = [UIColor orangeColor];
    
    CGSize s = [textView sizeThatFits:CGSizeMake(self.view.bounds.size.width, MAXFLOAT)];
    textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, s.width, s.height);
    

}


@end

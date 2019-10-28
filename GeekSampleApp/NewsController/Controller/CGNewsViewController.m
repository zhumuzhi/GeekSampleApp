//
//  CGNewsViewController.m
//  GeekSampleApp
//
//  Created by 朱慕之 on 2019/9/19.
//  Copyright © 2019 朱慕之. All rights reserved.
//

#import "CGNewsViewController.h"
#import "GTNormalTableViewCell.h"

#import "TestController.h"

#import "GDPerformanceMonitor.h"

@interface CGNewsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation CGNewsViewController

#pragma mark - LifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"新闻";
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [[GDPerformanceMonitor sharedInstance] startMonitoring];
    [[GDPerformanceMonitor sharedInstance] configureWithConfiguration:^(UILabel *textLabel) {
        [textLabel setBackgroundColor:[UIColor blackColor]];
        [textLabel setTextColor:[UIColor whiteColor]];
        [textLabel.layer setBorderColor:[[UIColor blackColor] CGColor]];
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"GTNormalTableViewCell";
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"testStoryboard" bundle:nil];
    TestController *testVC = [storyboard instantiateViewControllerWithIdentifier:@"TestController"];
    [self.navigationController pushViewController:testVC animated:YES];
    
}



@end

//
//  CGNewsViewController.m
//  GeekSampleApp
//
//  Created by 朱慕之 on 2019/9/19.
//  Copyright © 2019 朱慕之. All rights reserved.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"

#import "TestController.h"

#import "GDPerformanceMonitor.h"
#import "GTDetailViewController.h"

#import "GTListLoader.h"
#import "GTListItem.h"

@interface GTNewsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) GTListLoader *listLoader;


@end

@implementation GTNewsViewController

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
    
    self.listLoader = [[GTListLoader alloc] init];
    
    __weak typeof(self)weakSelf = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"GTNormalTableViewCell";
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    [cell layoutTableViewCellWithItem:item];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    
    GTDetailViewController *newsDetail = [[GTDetailViewController alloc] initWithUrlString:item.articleUrl];
    newsDetail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:newsDetail animated:YES];
    

//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"testStoryboard" bundle:nil];
//    TestController *testVC = [storyboard instantiateViewControllerWithIdentifier:@"TestController"];
//    [self.navigationController pushViewController:testVC animated:YES];
    
}



@end

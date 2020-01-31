//
//  GTNormalTableViewCell.m
//  GeekSampleApp
//
//  Created by 朱慕之 on 2019/9/19.
//  Copyright © 2019 朱慕之. All rights reserved.
//

#import "GTNormalTableViewCell.h"
#import "GTScreen.h"
#import "GTListItem.h"

@interface GTNormalTableViewCell ()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *sourceLabel;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;
@property (nonatomic, strong, readwrite) UILabel *timeLabel;

@property (nonatomic, strong, readwrite) UIImageView *rightImageView;

@property (nonatomic, strong, readwrite) UIButton *deleteButton;

@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:UIRect(20, 15, 270, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel.text = @"70周年展示标题";
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:UIRect(20, 70, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel.text = @"新闻联播";
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:UIRect(100, 70, 50, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel.text = @"1888评论";
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:UIRect(150, 70, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel.text = @"三分钟前";
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:UIRect(300, 15, 100, 70)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView.image = [UIImage imageNamed:@"videoCover"];
            self.rightImageView;
            
        })];
        
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:UIRect(280, 70, 10, 10)];
            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
            [self.deleteButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            
            //            self.deleteButton.layer.cornerRadius = self.deleteButton.bounds.size.height / 2;
            //            self.deleteButton.layer.masksToBounds = YES;
            //            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
            //            self.deleteButton.layer.borderWidth = 1;
            
            self.deleteButton;
        })];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

- (void)layoutTableViewCellWithItem:(GTListItem *)item {
    
    self.titleLabel.text = item.title;
    
    self.sourceLabel.text = item.authorName;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = item.category;
    [self.commentLabel sizeToFit];
    
    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
    self.rightImageView.image = image;
    
}


- (void)deleteButtonClick {
    NSLog(@"点击删除按钮");
}

@end

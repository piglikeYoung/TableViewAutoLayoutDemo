//
//  JHTableViewCell.m
//  TableViewAutoLayoutDemo
//
//  Created by piglikeyoung on 15/9/19.
//  Copyright © 2015年 pikeYoung. All rights reserved.
//

#import "JHTableViewCell.h"
#import "JHCellEntity.h"
#import "Masonry.h"


@interface JHTableViewCell()
@property (weak, nonatomic)  UIImageView *avatarImageView;
@property (weak, nonatomic)  UILabel *titleLabel;
@property (weak, nonatomic)  UILabel *contentLabel;

@end

@implementation JHTableViewCell

// 调用UITableView的dequeueReusableCellWithIdentifier方法时会通过这个方法初始化Cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - Private methods
- (void)initView {
    
    // Avatar头像
    UIImageView *avatarImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:avatarImageView];
    self.avatarImageView = avatarImageView;
    [avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@44);
        make.left.and.top.equalTo(self.contentView).with.offset(4);
    }];
    
    // Title - 单行
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@22);
        make.top.equalTo(self.contentView).with.offset(4);
        make.left.equalTo(_avatarImageView.mas_right).with.offset(4);
        make.right.equalTo(self.contentView).with.offset(-4);
    }];
    
    // 计算UILabel的preferredMaxLayoutWidth值，多行时必须设置这个值，否则系统无法决定Label的宽度
    // 自动布局Cell的最大宽度=屏幕的宽度-头像width44-文字左间距8-文字右间距8
    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - 44 - 8 - 8;
    
    // Content - 多行
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.numberOfLines = 0;
    contentLabel.backgroundColor = [UIColor redColor];
    contentLabel.preferredMaxLayoutWidth = preferredMaxWidth; // 多行时必须设置
    self.contentLabel = contentLabel;
    [self.contentView addSubview:contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
        make.left.equalTo(_avatarImageView.mas_right).with.offset(4);
        make.right.equalTo(self.contentView).with.offset(-4);
        make.bottom.equalTo(self.contentView).with.offset(-4);
    }];
    
    [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

#pragma mark - Public methods
- (void)setupData:(JHCellEntity *)dataEntity {
    
    _avatarImageView.image = [UIImage imageNamed:dataEntity.avatar] ;
    _titleLabel.text = dataEntity.title;
    _contentLabel.text = dataEntity.content;
}

@end

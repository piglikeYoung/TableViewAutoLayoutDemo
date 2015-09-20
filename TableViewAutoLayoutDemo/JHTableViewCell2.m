//
//  JHTableViewCell2.m
//  TableViewAutoLayoutDemo
//
//  Created by piglikeyoung on 15/9/19.
//  Copyright © 2015年 pikeYoung. All rights reserved.
//

#import "JHTableViewCell2.h"
#import "JHCellEntity.h"

#define kPreferredMaxWidth [UIScreen mainScreen].bounds.size.width - 44 - 8 - 8

@interface JHTableViewCell2()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation JHTableViewCell2

#pragma mark - Public methods
- (void)setupData:(JHCellEntity *)dataEntity {
    // 计算UILabel的preferredMaxLayoutWidth值，多行时必须设置这个值，否则系统无法决定Label的宽度
    // 自动布局Cell的最大宽度=屏幕的宽度-头像width44-文字左间距8-文字右间距8
//    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - 44 - 8 - 8;
    
    _avatarImageView.image = [UIImage imageNamed:dataEntity.avatar] ;
    _titleLabel.text = dataEntity.title;
    _contentLabel.text = dataEntity.content;
    _contentLabel.preferredMaxLayoutWidth = kPreferredMaxWidth; // 多行时必须设置
    _contentLabel.numberOfLines = 0;
}

@end

//
//  JHTableViewCell.h
//  TableViewAutoLayoutDemo
//
//  Created by piglikeyoung on 15/9/19.
//  Copyright © 2015年 pikeYoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHCellEntity;

@interface JHTableViewCell : UITableViewCell

- (void)setupData:(JHCellEntity *)dataEntity;

@end

//
//  JHTableViewController2.m
//  TableViewAutoLayoutDemo
//
//  Created by piglikeyoung on 15/9/19.
//  Copyright © 2015年 pikeYoung. All rights reserved.
//

#import "JHTableViewController2.h"
#import "JHCellEntity.h"
#import "JHTableViewCell.h"

static const NSInteger dataNum = 20;

static NSString *const cellIdentifier = @"cell2";

@interface JHTableViewController2 ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation JHTableViewController2

- (NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray arrayWithCapacity:dataNum];
        for (int i = 0; i < dataNum; i++) {
            JHCellEntity *dataEntity = [[JHCellEntity alloc] init];
            dataEntity.avatar = [NSString stringWithFormat:@"bluefaces_%d", (i % 4) + 1];
            dataEntity.title = [NSString stringWithFormat:@"Title: %d", i];
            dataEntity.content = [self getText:@"content-" withRepeat:i * 2 + 1];
            [_data addObject:dataEntity];
        }
    }
    
    return _data;
}

// 重复text字符串repeat次
- (NSString *)getText:(NSString *)text withRepeat:(int)repeat {
    NSMutableString *tmpText = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    
    return tmpText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 预估cell的高度
    self.tableView.estimatedRowHeight = 80.0f;
    
}



#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static JHTableViewCell *templateCell;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        templateCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    });
    
    // 获取对应的数据
    JHCellEntity *dataEntity = self.data[indexPath.row];
    
    // 填充数据，这里只是拿模板计算cell的高度，并没有返回cell，所以还要在cellForRowAtIndexPath方法中对cell赋值
    [templateCell setupData:dataEntity];
    
    // 判断高度是否已经计算过
    if (dataEntity.cellHeight <= 0) {
        // 由于分割线，所以contentView的高度要小于row 一个像素。
        dataEntity.cellHeight = [templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
        //        NSLog(@"Calculate height: %ld", (long) dataEntity.cellHeight);
    } else {
        //        NSLog(@"Get cache %ld", (long) indexPath.row);
    }
    
    return dataEntity.cellHeight;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell setupData:self.data[indexPath.row]];
    return cell;
}

@end
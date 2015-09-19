//
//  JHCellEntity.h
//  TableViewAutoLayoutDemo
//
//  Created by piglikeyoung on 15/9/19.
//  Copyright © 2015年 pikeYoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHCellEntity : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *avatar;

// Cache
@property (assign, nonatomic) CGFloat cellHeight;

@end

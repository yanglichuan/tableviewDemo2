//
//  HMTgCell.h
//  02-团购
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMTg;

@interface HMTgCell : UITableViewCell

#warning 这里设置此模型属性是为了接收外界传递进来的模型数据，有了外面的数据传入，才能具体的起到作用
/** 团购的数据模型 */
@property (nonatomic, strong) HMTg *tg;

/** 提供一个类方法，可以快速创建 Cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

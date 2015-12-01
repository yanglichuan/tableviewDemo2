//
//  HMTgCell.m
//  02-团购
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMTgCell.h"
#import "HMTg.h"

@interface HMTgCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;
@end

@implementation HMTgCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    // 1. 可重用标示符
    static NSString *ID = @"Cell";
    // 2. tableView查询可重用Cell
    HMTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3. 如果没有可重用cell
    if (cell == nil) {
        NSLog(@"加载XIB");
        // 从XIB加载自定义视图
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HMTgCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setTg:(HMTg *)tg
{
    // setter方法中，第一句要赋值，否则要在其他方法中使用模型，将无法访问到
    _tg = tg;

    self.titleLabel.text = tg.title;
    self.iconView.image = [UIImage imageNamed:tg.icon];
    self.priceLabel.text = tg.price;
    self.buyCountLabel.text = tg.buyCount;
}

#pragma mark - 模板提供的方法
/** 
 初始化方法
 
 使用代码创建Cell的时候会被调用，如果使用XIB或者Storyboard，此方法不会被调用
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"%s", __func__);
    }
    return self;
}

/**
 从XIB被加载之后，会自动被调用，如果使用纯代码，不会被执行
 */
- (void)awakeFromNib
{
    NSLog(@"%s", __func__);
    self.contentView.backgroundColor = [UIColor clearColor];
}

/**
 Cell 被选中或者取消选中是都会被调用
 
 如果是自定义Cell控件，所有的子控件都应该添加到contentView中
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
        self.contentView.backgroundColor = [UIColor redColor];
    } else {
        self.contentView.backgroundColor = [UIColor greenColor];
    }
}

@end

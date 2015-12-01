//
//  HMViewController.m
//  02-团购
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMViewController.h"
#import "HMTg.h"
#import "HMTgCell.h"
#import "HMTgFooterView.h"

@interface HMViewController () <HMTgFooterViewDelegate>
@property (nonatomic, strong) NSMutableArray *tgs;
@end

@implementation HMViewController

- (NSArray *)tgs
{
    if (_tgs == nil) _tgs = [HMTg tgs];
    return _tgs;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
    
    // 调整边距，可以让表格视图让开状态栏
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    // footerView
    // footerView的宽度会和表格整体宽度一致，只需要指定高度即可
//    self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
//    view.backgroundColor = [UIColor redColor];
//    self.tableView.tableFooterView = view;
    // 从XIB加载最后一个视图设置为footerView
    HMTgFooterView *footer = [HMTgFooterView footerView];
    // 视图控制器成为footerView的代理
    footer.delegate = self;
    self.tableView.tableFooterView = footer;
    
    self.tableView.tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"HMTgHeadView" owner:nil options:nil] lastObject];
}

///** 隐藏状态栏 */
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

#pragma mark - footerView的代理方法
/** 
 预处理指令
 #if 0
 所有代码都不会执行
 
 #endif
 */
#if 1
- (void)tgFooterViewDidDownloadButtonClick:(HMTgFooterView *)footerView
{
    // 模拟取网络上获取数据加载数据
    NSLog(@"努力加载数据中....");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 获得网络数据之后执行的操作
        
        // 向数组中添加数据，模拟网络加载完成之后的效果
        NSDictionary *dict = @{@"title": @"哈哈", @"icon": @"ad_00", @"price": @"100.2", @"buyCount": @"250"};
        HMTg *tg = [HMTg tgWithDict:dict];
        
        NSLog(@"加数据前 %lu", (unsigned long)self.tgs.count);
        
        [self.tgs addObject:tg];
        
        NSLog(@"加数据后 %lu", (unsigned long)self.tgs.count);
        // 刷新数据
        //    [self.tableView reloadData];
        // 新建一个indexPath
        NSIndexPath *path = [NSIndexPath indexPathForRow:(self.tgs.count - 1) inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
        
        // 通知页脚视图调整视图显示状态
        [footerView endRefresh];
    });
    
}
#endif

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 创建cell
    HMTgCell *cell = [HMTgCell cellWithTableView:tableView];
    
    // 2. 通过数据模型，设置Cell内容，可以让视图控制器不需要了解cell内部的实现细节
    cell.tg = self.tgs[indexPath.row];
    
    return cell;
}

@end

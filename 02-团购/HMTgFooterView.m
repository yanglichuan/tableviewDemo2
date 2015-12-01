//
//  HMTgFooterView.m
//  02-团购
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMTgFooterView.h"

@interface HMTgFooterView()
@property (weak, nonatomic) IBOutlet UIButton *loadMoreButton;
@property (weak, nonatomic) IBOutlet UIView *tipsView;
@end

@implementation HMTgFooterView

+ (instancetype)footerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HMTgFooterView" owner:nil options:nil] lastObject];
}

- (IBAction)loadMore
{
    NSLog(@"加载更多");
    // 1. 隐藏按钮
    self.loadMoreButton.hidden = YES;
    // 2. 显示提示视图
    self.tipsView.hidden = NO;

    // 3.1 判断代理是否实现了协议方法
    if ([self.delegate respondsToSelector:@selector(tgFooterViewDidDownloadButtonClick:)]) {
        [self.delegate tgFooterViewDidDownloadButtonClick:self];
    }
}

/** 视图控制器刷新完成调用方法 */
- (void)endRefresh
{
    // 4. 加载完成数据
    self.loadMoreButton.hidden = NO;
    self.tipsView.hidden = YES;
}

@end

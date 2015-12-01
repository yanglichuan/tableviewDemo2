//
//  HMTgFooterView.h
//  02-团购
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMTgFooterView;

@protocol HMTgFooterViewDelegate <NSObject>

@optional
/** 视图的下载按钮被点击 */
- (void)tgFooterViewDidDownloadButtonClick:(HMTgFooterView *)footerView;

@end

@interface HMTgFooterView : UIView

// 代理如果使用强引用，就会产生循环引用，造成控制器和子视图都无法被释放，造成内存泄露
@property (nonatomic, weak) id <HMTgFooterViewDelegate> delegate;

+ (instancetype)footerView;

/** 刷新数据结束后，更新页脚的视图显示 */
- (void)endRefresh;

@end

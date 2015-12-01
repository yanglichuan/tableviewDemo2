//
//  HMTg.h
//  02-团购
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMTg : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *buyCount;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tgWithDict:(NSDictionary *)dict;

+ (NSMutableArray *)tgs;

@end

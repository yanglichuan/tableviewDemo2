//
//  HMTg.m
//  02-团购
//
//  Created by apple on 14-8-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMTg.h"

@implementation HMTg

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)tgWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSMutableArray *)tgs
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self tgWithDict:dict]];
    }
    
    return arrayM;
}

@end

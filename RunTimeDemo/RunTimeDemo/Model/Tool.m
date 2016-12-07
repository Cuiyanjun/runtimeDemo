//
//  Tool.m
//  RunTimeDemo
//
//  Created by hxshop on 2016/12/5.
//  Copyright © 2016年 hxshop. All rights reserved.
//

#import "Tool.h"
@interface Tool()

@property (nonatomic,assign) NSInteger count;

@end

@implementation Tool
+(instancetype)shareManager
{
    static Tool *_sInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sInstance = [[Tool alloc]init];
    });
    return _sInstance;
}

-(NSString *)changeMethod
{
    return @"方法已经被替换";
}

-(void)addCount
{
    _count +=1;
    NSLog(@"点击次数----%ld",_count);
}
@end

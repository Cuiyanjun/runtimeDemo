//
//  Tool.h
//  RunTimeDemo
//
//  Created by hxshop on 2016/12/5.
//  Copyright © 2016年 hxshop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject
+(instancetype)shareManager;

-(NSString *)changeMethod;

-(void)addCount;
@end

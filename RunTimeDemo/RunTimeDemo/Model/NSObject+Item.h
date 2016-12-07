//
//  NSObject+Item.h
//  RunTimeDemo
//
//  Created by hxshop on 2016/12/7.
//  Copyright © 2016年 hxshop. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ModelDelegate <NSObject>
@optional
//提供一个协议，只要准备这个协议的类，都能把数组中的字典转模型
//用在三级数组转换
+(NSDictionary *)arrayContainModelClass;

@end
@interface NSObject (Item)
//字典转模型
+(instancetype)objectWithDict:(NSDictionary *)dict;
@end

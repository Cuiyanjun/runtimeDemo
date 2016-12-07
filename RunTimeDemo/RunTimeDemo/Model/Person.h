//
//  Person.h
//  RunTimeDemo
//
//  Created by hxshop on 2016/12/6.
//  Copyright © 2016年 hxshop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *sex;
-(NSString *)sayName;
-(NSString *)saySex;
@end

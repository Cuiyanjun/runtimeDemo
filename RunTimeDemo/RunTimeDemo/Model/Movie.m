//
//  Movie.m
//  RunTimeDemo
//
//  Created by hxshop on 2016/12/7.
//  Copyright © 2016年 hxshop. All rights reserved.
//

#import "Movie.h"
#import <objc/runtime.h>
@implementation Movie
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList([Movie class], &count);
    
    for (int i=0; i<count; i++) {
        //取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        
        //察看成员变量
        const char *name = ivar_getName(ivar);
        
        //归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        
        Ivar *ivars = class_copyIvarList([Movie class], &count);
        
        for (int i=0; i<count; i++) {
            //取出i位置对应的成员变量
            Ivar ivar = ivars[i];
            
            //察看成员变量
            const char *name = ivar_getName(ivar);
            
            //归档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}
@end

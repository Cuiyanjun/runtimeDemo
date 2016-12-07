//
//  UIButton+count.m
//  RunTimeDemo
//
//  Created by hxshop on 2016/12/5.
//  Copyright © 2016年 hxshop. All rights reserved.
//

#import "UIButton+count.h"
#import "Tool.h"
@implementation UIButton (count)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        Class selfClass = [self class];
        
        SEL oriSel = @selector(sendAction:to:forEvent:);
//        得到类的实例方法 class_getInstanceMethod
        Method oriMethod = class_getInstanceMethod(selfClass, oriSel);
        
        SEL cusSel = @selector(mySendAction:to:forEvent:);
        Method cusMethod = class_getInstanceMethod(selfClass, cusSel);
//        每个类都有一个方法列表，存放着selector的名字和方法实现的映射关系。IMP有点类似函数指针，指向具体的Method实现。
//        我们可以利用 method_exchangeImplementations 来交换2个方法中的IMP，
//        
//        我们可以利用 class_replaceMethod 来修改类，
//        我们可以利用 method_setImplementation 来直接设置某个方法的IMP，
//        ……
//        
//        归根结底，都是偷换了selector的IMP
        IMP cusImp = method_getImplementation(cusMethod);
        BOOL addsucc = class_addMethod(selfClass, oriSel, cusImp, method_getTypeEncoding(cusMethod));
        
        if (addsucc) {
            IMP oriImp = method_getImplementation(oriMethod);
            class_replaceMethod(selfClass, cusSel, oriImp, method_getTypeEncoding(oriMethod));
        }else{
            method_exchangeImplementations(oriMethod, cusMethod);
        }
    });
    
}
-(void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [[Tool shareManager] addCount];
    [self mySendAction:action to:target forEvent:event];
}
@end

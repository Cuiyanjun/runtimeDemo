//
//  twoViewController.m
//  RunTimeDemo
//
//  Created by hxshop on 2016/12/6.
//  Copyright © 2016年 hxshop. All rights reserved.
//

#import "twoViewController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface twoViewController ()
@property (nonatomic,strong) Person *person;
@property (weak, nonatomic) IBOutlet UITextField *textview;

@end

@implementation twoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [Person new];
}
-(void)sayFrom
{
    /*
     cls：被添加方法的类
     
     name：可以理解为方法名，这个貌似随便起名，比如我们这里叫guess
     
     imp：实现这个方法的函数
     
     types：一个定义该函数返回值类型和参数类型的字符串，这个具体会在后面讲
     
     class_addMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>, <#IMP imp#>, <#const char *types#>)
     */
    
/*
    class_addMethod([EmptyClass class], @selector(say:), (IMP)say, "i@:@");
    
    其中types参数为"i@:@“，按顺序分别表示：
    
    i：返回值类型int，若是v则表示void
    
    @：参数id(self)
    
    :：SEL(_cmd)
    
    @：id(str)
 */
    class_addMethod([self.person class], @selector(guess), (IMP)guessAnswer, "v@:");
    if ([self.person respondsToSelector:@selector(guess)]) {
        [self.person performSelector:@selector(guess)];
    }else{
        NSLog(@"Sorry, I don't know");
    }
    self.textview.text = @"beijing";
}

void guessAnswer(id self,SEL _cmd){
    
    NSLog(@"I am from beijing");
}
- (IBAction)answer:(id)sender {
     [self sayFrom];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

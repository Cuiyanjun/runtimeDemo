//
//  oneViewController.m
//  RunTimeDemo
//
//  Created by hxshop on 2016/12/6.
//  Copyright © 2016年 hxshop. All rights reserved.
//

#import "oneViewController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface oneViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield;

@property (nonatomic,strong) Person *person;

@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [Person new];
    _person.name = @"xiaoming";
    NSLog(@"XiaoMing first answer is %@",self.person.name);
    // Do any additional setup after loading the view from its nib.
}

-(void)sayName
{
    unsigned int count = 0;
    /*
     class_copyPropertyList返回的仅仅是对象类的属性(@property申明的属性)，而class_copyIvarList返回类的所有属性和变量(包括在@interface大括号中声明的变量)
     */
    Ivar *ivar = class_copyIvarList([self.person class], &count);
    for (int i = 0; i<count; i++) {
        Ivar var = ivar[i];
        const char *varName = ivar_getName(var);
        NSString *proname = [NSString stringWithUTF8String:varName];
        
        if ([proname isEqualToString:@"_name"]) {
            object_setIvar(self.person, var, @"daming");
            break;
        }
    }
    NSLog(@"XiaoMing change name is %@",self.person.name);
    self.textfield.text = self.person.name;
}
- (IBAction)changename:(id)sender {
    [self sayName];
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

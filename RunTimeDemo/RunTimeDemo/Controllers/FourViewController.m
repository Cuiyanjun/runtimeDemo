//
//  FourViewController.m
//  RunTimeDemo
//
//  Created by hxshop on 2016/12/6.
//  Copyright © 2016年 hxshop. All rights reserved.
//

#import "FourViewController.h"
#import "Person.h"
#import "Tool.h"
#import <objc/runtime.h>
@interface FourViewController ()
@property (nonatomic,strong)Person *person;
@property (nonatomic,strong)Tool *tool;
@property (weak, nonatomic) IBOutlet UITextField *uitextview;


@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Method m1 = class_getInstanceMethod([Person class], @selector(sayName));
    Method m2 = class_getInstanceMethod([Tool class], @selector(changeMethod));
    
    method_exchangeImplementations(m1, m2);
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)button:(id)sender {
    self.person = [Person new];
    self.uitextview.text = [_person sayName];
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

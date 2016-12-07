//
//  SevenViewController.m
//  RunTimeDemo
//
//  Created by hxshop on 2016/12/6.
//  Copyright © 2016年 hxshop. All rights reserved.
//

#import "SevenViewController.h"
#import "Movie.h"
@interface SevenViewController ()

@end

@implementation SevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Movie *m = [Movie new];
    m.movieName = @"aaaaa";
    m.movieId = @"12222331";
    m.pic_url = @"1111111111";
    NSString *document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [document stringByAppendingString:@"/123.txt"];
    
    //模型写入文件
    [NSKeyedArchiver archiveRootObject:m toFile:filePath];
    
    //读取
    Movie *movie = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"------%@",movie);
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

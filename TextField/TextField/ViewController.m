//
//  ViewController.m
//  TextField
//
//  Created by qianji_ios1 on 2018/3/19.
//  Copyright © 2018年 qianji_ios1. All rights reserved.
//

#import "ViewController.h"
#import "MyInfoViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 40, 100, 40)];
    [button setTitle:@"个人资料" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(toMyInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)toMyInfo {
    MyInfoViewController * infoCtr = [[MyInfoViewController alloc]init];
    [self presentViewController:infoCtr animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

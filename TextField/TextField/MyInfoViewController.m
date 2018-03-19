//
//  MyInfoViewController.m
//  TXTextField
//
//  Created by qianji_ios1 on 2018/3/19.
//  Copyright © 2018年 qianji_ios1. All rights reserved.
//

#import "MyInfoViewController.h"
#import "TXTextField.h"


@interface MyInfoViewController ()
@property (weak, nonatomic) IBOutlet TXTextField *nickTF;
@property (weak, nonatomic) IBOutlet TXTextField *workTF;
@property (weak, nonatomic) IBOutlet TXTextField *companyTF;
@property (weak, nonatomic) IBOutlet TXTextField *signTF;

@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nickTF.emojiInput = YES;
    self.nickTF.maxLength = 16;
    self.nickTF.noMenu = NO;
    
    self.workTF.emojiInput = NO;
    self.workTF.maxLength = 16;
    self.workTF.noMenu = NO;
    
    self.companyTF.emojiInput = NO;
    self.companyTF.maxLength = 30;
    self.companyTF.noMenu = NO;
    
    self.signTF.emojiInput = YES;
    self.signTF.maxLength = 60;
    self.signTF.noMenu = NO;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

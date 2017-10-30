//
//  ViewController.m
//  SignatureView
//
//  Created by 张体宾 on 2017/10/30.
//  Copyright © 2017年 Dreams of Ideal World Co., Ltd. All rights reserved.
//

#import "ViewController.h"

#import "SignatureView.h"
#import "UIView+DottedLine.h"

@interface ViewController ()

@property (nonatomic, strong) SignatureView *signatureView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *undoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    undoButton.frame = CGRectMake(10, 100, 80, 40);
    undoButton.backgroundColor = [UIColor redColor];
    [undoButton setTitle:@"撤销" forState:UIControlStateNormal];
    [undoButton addTarget:self action:@selector(undoButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:undoButton];
    
    UIButton *redoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    redoButton.frame = CGRectMake(110, 100, 80, 40);
    redoButton.backgroundColor = [UIColor redColor];
    [redoButton setTitle:@"恢复" forState:UIControlStateNormal];
    [redoButton addTarget:self action:@selector(redoButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redoButton];
    
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clearButton.frame = CGRectMake(210, 100, 80, 40);
    clearButton.backgroundColor = [UIColor redColor];
    [clearButton setTitle:@"清空" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clearButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    saveButton.frame = CGRectMake(310, 100, 80, 40);
    saveButton.backgroundColor = [UIColor redColor];
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    
    _signatureView = [[SignatureView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300)];
    _signatureView.lineColor = [UIColor redColor];
    [_signatureView drawRectDotterLineWithLineWidth:4 lineLength:4 lineSpacing:2 lineColor:[UIColor yellowColor] cornerRadius:3.0];
    [self.view addSubview:_signatureView];
    
}

#pragma mark - 撤销
- (void)undoButtonDidClick:(id)sender
{
    [_signatureView undoLastDraw];
}

#pragma mark - 恢复
- (void)redoButtonDidClick:(id)sender
{
    [_signatureView redoLastDraw];
}

#pragma mark - 清空
- (void)clearButtonDidClick:(id)sender
{
    [_signatureView clearSignature];
}

#pragma mark - 保存
- (void)saveButtonDidClick:(id)sender
{
    [_signatureView saveSignature];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

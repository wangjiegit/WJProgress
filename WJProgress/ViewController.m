//
//  ViewController.m
//  WJProgress
//
//  Created by 王杰 on 2018/7/31.
//  Copyright © 2018年 王杰. All rights reserved.
//

#import "ViewController.h"
#import "WJProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WJProgressView *progressView = [[WJProgressView alloc] init];
    progressView.frame = CGRectMake(40, 300, 250, 20);
    progressView.progress = 0.55;
    progressView.backgroundColor = [[self colorWithHex:0xF79900] colorWithAlphaComponent:0.16];
    progressView.progressColor = [self colorWithHex:0xF58723];
    [self.view addSubview:progressView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)colorWithHex:(NSUInteger)hex {
    CGFloat red, green, blue, alpha;
    red = ((CGFloat)((hex >> 16) & 0xFF)) / ((CGFloat)0xFF);
    green = ((CGFloat)((hex >> 8) & 0xFF)) / ((CGFloat)0xFF);
    blue = ((CGFloat)((hex >> 0) & 0xFF)) / ((CGFloat)0xFF);
    alpha = hex > 0xFFFFFF ? ((CGFloat)((hex >> 24) & 0xFF)) / ((CGFloat)0xFF) : 1;
    return [UIColor colorWithRed: red green:green blue:blue alpha:alpha];
}


@end

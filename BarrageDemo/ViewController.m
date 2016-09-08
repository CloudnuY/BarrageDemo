//
//  ViewController.m
//  CommentDemo
//
//  Created by Cloud on 16/9/5.
//  Copyright © 2016年 Cloud. All rights reserved.
//

#import "ViewController.h"
#import "Barrage.h"
#import "BarrageManage.h"


@interface ViewController ()

@property (nonatomic ,strong) BarrageManage *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.manager = [[BarrageManage alloc] init];
    
    __weak typeof (self) weakSelf = self;
    self.manager.generateViewBlock = ^(Barrage *barrage) {
        [weakSelf addBarrageView:barrage];
    };
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:@"Start" forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 20, 100, 30);
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)click {
    [self.manager start];
}

- (void)addBarrageView:(Barrage *)barrage {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    barrage.frame = CGRectMake(screenWidth, 300 + barrage.trajectory * 40, barrage.bounds.size.width, barrage.bounds.size.height);
    [self.view addSubview:barrage];
    [barrage startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

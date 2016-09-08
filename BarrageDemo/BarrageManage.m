//
//  BarrageManage.m
//  CommentDemo
//
//  Created by Cloud on 16/9/5.
//  Copyright © 2016年 Cloud. All rights reserved.
//

#import "BarrageManage.h"
#import "Barrage.h"

@interface BarrageManage()

//弹幕数据源
@property (nonatomic, strong) NSMutableArray *datasource;
//弹幕使用过程中的数组变量
@property (nonatomic, strong) NSMutableArray *barrageComments;
//存储弹幕view的数组变量
@property (nonatomic, strong) NSMutableArray *barrageViews;

@end

@implementation BarrageManage

- (void)start {
    [self.barrageComments removeAllObjects];
    [self.barrageComments addObjectsFromArray:self.datasource];
    
    [self initBarrageComment];
}

- (void)stop {
    
}

//初始化弹幕，随机分配弹幕轨迹
- (void)initBarrageComment {
    
    NSMutableArray *trajectorys = [NSMutableArray arrayWithArray:@[@(0),@(1),@(2)]];
    
    for (int i = 0; i < 3; i++) {
        if (self.barrageComments.count > 0) {
            
            NSInteger index = arc4random() % trajectorys.count;
            int trajectory = [[trajectorys objectAtIndex:index] intValue];
            
            [trajectorys removeObjectAtIndex:index];
            
            NSString *comment = [self.barrageComments firstObject];
            [self.barrageComments removeObjectAtIndex:0];
            
            [self createBarrageView:comment trajectory:trajectory];
            
        }
    }
}

- (void)createBarrageView:(NSString *)comment trajectory:(int)trajectory {
    
    Barrage *barrage = [[Barrage alloc] initWithComment:comment];
    barrage.trajectory = trajectory;
    
    [self.barrageViews addObject:barrage];

    __weak typeof (barrage) weakBarrage = barrage;
    __weak typeof (self) weakSelf = self;
    barrage.moveStatusBlock = ^{
        //移出屏幕后销毁弹幕
        [weakBarrage stopAnimation];
        [weakSelf.barrageViews removeObject:weakBarrage];
    };
    
    if (self.generateViewBlock) {
        self.generateViewBlock(barrage);
    }
    
}


- (NSMutableArray *)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray arrayWithArray:@[@"弹幕111122223333", @"楼主傻逼", @"弹幕33344343443434~~~~~"]];
    }
    return _datasource;
}

- (NSMutableArray *)barrageComments {
    if (!_barrageComments) {
        _barrageComments = [NSMutableArray array];
    }
    return _barrageComments;
}

- (NSMutableArray *)barrageViews {
    if (!_barrageViews) {
        _barrageViews = [NSMutableArray array];
    }
    return _barrageViews;
}

@end

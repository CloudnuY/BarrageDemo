//
//  BarrageManage.h
//  CommentDemo
//
//  Created by Cloud on 16/9/5.
//  Copyright © 2016年 Cloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Barrage;
@interface BarrageManage : NSObject

@property (nonatomic, copy) void(^generateViewBlock)(Barrage *barrage);

- (void)start;
- (void)stop;

@end

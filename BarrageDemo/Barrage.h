//
//  Barrage.h
//  CommentDemo
//
//  Created by Cloud on 16/9/5.
//  Copyright © 2016年 Cloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Barrage : UIView

@property (nonatomic, assign) int trajectory;       //弹道
@property (nonatomic, copy) void(^moveStatusBlock)();       //弹幕的状态回调

//初始化弹幕
- (instancetype)initWithComment:(NSString *)comment;

- (void)startAnimation;
- (void)stopAnimation;

@end

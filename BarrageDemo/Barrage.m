//
//  Barrage.m
//  CommentDemo
//
//  Created by Cloud on 16/9/5.
//  Copyright © 2016年 Cloud. All rights reserved.
//

#import "Barrage.h"

static CGFloat Padding = 10.0;

@interface Barrage ()

@property (nonatomic, strong) UILabel *lbComment;


@end



@implementation Barrage


- (instancetype)initWithComment:(NSString *)comment {
    if (self = [super init]) {
        self.backgroundColor = [UIColor redColor];
        
        //计算弹幕的实际宽度
        NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:14.0]};
        CGFloat width = [comment sizeWithAttributes:attr].width;
        self.bounds = CGRectMake(0, 0, width + 2 * Padding, 30);
        self.lbComment.text = comment;
        
        self.lbComment.frame = CGRectMake(Padding, 0, width, 30);
        
        
    }
    return self;
}

- (void)startAnimation {
    
    //根据弹幕的长度执行动画效果
    //根据v=s/t
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat duration = 4.0;
    CGFloat wholeWidth = screenWidth + CGRectGetWidth(self.bounds);
    
    
    __block CGRect frame = self.frame;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        frame.origin.x -= wholeWidth;
        self.frame = frame;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
        if (self.moveStatusBlock) {
            self.moveStatusBlock();
        }
        
    }];
    
}

- (void)stopAnimation {
    
    [self.layer removeAllAnimations];
    
}


- (UILabel *)lbComment {
    if (!_lbComment) {
        _lbComment = [[UILabel alloc] initWithFrame:CGRectZero];
        _lbComment.font = [UIFont systemFontOfSize:14.0];
        _lbComment.textColor = [UIColor whiteColor];
        _lbComment.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbComment];
    }
    return _lbComment;
}

@end

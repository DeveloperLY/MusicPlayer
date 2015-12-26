//
//  LYLrcLabel.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/27.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import "LYLrcLabel.h"

@implementation LYLrcLabel

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    // 设置颜色
    [[UIColor greenColor] set];
    
    CGRect fillRect = CGRectMake(0, 0, rect.size.width * self.progress, rect.size.height);
    
//    UIRectFill(fillRect);
    
    UIRectFillUsingBlendMode(fillRect, kCGBlendModeSourceIn);
}

@end

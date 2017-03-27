//
//  LYTimeTool.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/21.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "LYTimeTool.h"

@implementation LYTimeTool

+ (NSString *)getFormatTimeWithTimeInterval:(NSTimeInterval)timeInterval
{
    // 获取分钟数
    NSInteger min = timeInterval / 60;
    // 获取秒数
    NSInteger sec = (NSInteger)timeInterval % 60;
    // 返回计算后的数值
    return [NSString stringWithFormat:@"%02zd:%02zd", min, sec];
}

+ (NSTimeInterval)getTimeIntervalWithFormatTime:(NSString *)format
{
    // 分解分钟和秒数
    NSArray *minAsec = [format componentsSeparatedByString:@":"];
    
    // 获取分钟
    NSString *min = [minAsec firstObject];
    // 获取秒数
    NSString *sec = [minAsec lastObject];
    
    // 计算, 并返回值
    return min.intValue * 60 + sec.floatValue;
}

@end

//
//  LYTimeTool.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/21.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

/**
 *  负责时间格式处理的工具类
 */
#import <Foundation/Foundation.h>

@interface LYTimeTool : NSObject

/**
 *  根据秒数, 转换成为 "分钟:秒数" 的格式 , 例如 "06:02"
 *
 *  @param timeInterval 秒数
 *
 *  @return 转换后的时间格式
 */
+ (NSString *)getFormatTimeWithTimeInterval:(NSTimeInterval)timeInterval;


/**
 *  根据  "分钟:秒数" 的格式 , 例如 "06:02" 转换成为 秒数
 *
 *  @param format 格式化的时间
 *
 *  @return 秒数
 */
+ (NSTimeInterval)getTimeIntervalWithFormatTime:(NSString *)format;

@end

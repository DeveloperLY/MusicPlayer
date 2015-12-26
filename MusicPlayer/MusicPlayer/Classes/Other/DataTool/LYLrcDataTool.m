//
//  LYLrcTool.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/26.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import "LYLrcDataTool.h"
#import "LYLrcModel.h"
#import "LYTimeTool.h"

@implementation LYLrcDataTool

/**
 *  根据歌词名称, 解析歌词
 *
 *  @param fileName 歌词名称
 *
 *  @return 歌词数据模型组成的数据
 */
+ (NSArray<LYLrcModel *> *)getLrcModelsWithFileName:(NSString *)fileName
{
    // 获取到歌词文件的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    
    // 加载歌词的所有内容
    NSString *lrcContent = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    // 将歌词分割成每一行
    NSArray *timeAndTextArray = [lrcContent componentsSeparatedByString:@"\n"];
    
    // 用于存储歌词数据模型的数组
    NSMutableArray *lrcModels = [NSMutableArray array];
    
    // 遍历每一行, 对每一行歌词进行解析
    for (NSString *timeAndText in timeAndTextArray) {
        // 过滤垃圾数据
        if ([timeAndText containsString:@"[ti:]"] || [timeAndText containsString:@"[ar:]"] || [timeAndText containsString:@"[al:]"]) {
            continue;
        }
         // 正常解析歌词
        // 去除[
        NSString *timeAndContent = [timeAndText stringByReplacingOccurrencesOfString:@"[" withString:@""];
        
        // 包含时间和歌词内容
        NSArray *timeAndContentArray = [timeAndContent componentsSeparatedByString:@"]"];
        
        NSString *beginTimeStr = [timeAndContentArray firstObject];
        NSString *lrcContent = [timeAndContentArray lastObject];
        
        // 创建歌词数据模型并且赋值
        LYLrcModel *lrcModel = [[LYLrcModel alloc] init];
        // 歌词时间
        lrcModel.beginTime = [LYTimeTool getTimeIntervalWithFormatTime:beginTimeStr];
        // 歌词内容
        lrcModel.lrcText = lrcContent;
        
        // 添加到结果数组
        [lrcModels addObject:lrcModel];
    }
    
    // 得到结束时间
    NSInteger count = lrcModels.count;
    for (NSInteger i = 0; i < count; i ++) {
        if (i == count - 1) {
            break;
        }
        LYLrcModel *nowModel = lrcModels[i];
        LYLrcModel *nextModel = lrcModels[i + 1];
        nowModel.endTime = nextModel.beginTime;
    }
    
    return lrcModels;
}

/**
 *  根据当前时间何歌词数据模型组成的数据, 获取对应的应该播放的歌词数据模型
 *
 *  @param currentTime 当前时间
 *  @param lrcModels   歌词数据模型数组
 *
 *  @return 索引
 */
+ (NSInteger)getRowWithCurrentTime:(NSTimeInterval)currentTime lrcModels:(NSArray<LYLrcModel *> *)lrcModels
{
    // 遍历每一个歌词数据模型, 如果发现当歌曲播放时间 大于歌词的开始时间, 并且小于歌词的结束时间, 就返回
    NSInteger i = 0;
    NSInteger count = lrcModels.count;
    for (NSInteger i = 0; i < count; i ++) {
        LYLrcModel *lrcModel = lrcModels[i];
        if (currentTime >= lrcModel.beginTime && currentTime < lrcModel.endTime) {
            return i;
        }
    }
    
    // 如果都没查找到, 并且是存在时间, 是当做最后一行处理, 防止跳回到第一行
    if (i > 0 && currentTime > 0) {
        return count - 1;
    }
    return 0;
}

@end

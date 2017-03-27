//
//  LYLrcTool.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/26.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYLrcModel;

@interface LYLrcDataTool : NSObject

/**
 *  根据歌词文件名称获取歌词
 *
 *  @param fileName 歌词文件名
 *
 *  @return 歌词数组
 */
+ (NSArray <LYLrcModel *> *)getLrcModelsWithFileName:(NSString *)fileName;

/**
 *  根据歌曲播放当前时间和歌词获取当前歌词行号
 *
 *  @param currentTime 歌曲播放当前的时间
 *  @param lrcModels   歌词数组
 *
 *  @return 行号
 */
+ (NSInteger)getRowWithCurrentTime:(NSTimeInterval)currentTime lrcModels:(NSArray <LYLrcModel *> *)lrcModels;

@end

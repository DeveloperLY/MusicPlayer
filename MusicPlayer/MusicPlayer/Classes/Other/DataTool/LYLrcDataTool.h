//
//  LYLrcTool.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/26.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
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


@end

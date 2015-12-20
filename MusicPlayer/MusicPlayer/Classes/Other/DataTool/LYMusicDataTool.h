//
//  LYMusicDataTool.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/20.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYMusicModel;

@interface LYMusicDataTool : NSObject

/**
 *  负责加载歌词列表的数据工具类
 *
 *  @param resultBlock 用于传递参数的回调block
 */
+ (void)loadMusicData:(void(^)(NSArray <LYMusicModel *> *musicModels))resultBlock;

@end

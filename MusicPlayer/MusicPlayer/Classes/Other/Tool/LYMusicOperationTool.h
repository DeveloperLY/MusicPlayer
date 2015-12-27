//
//  LYMusicOperationTool.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/20.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

/**
 *  此工具类只负责播放的业务逻辑(上一首, 下一首, 播放暂停当前等等), 不负责播放功能的具体实现
 */
#import <Foundation/Foundation.h>
#import "Singleton.h"
#import <AVFoundation/AVFoundation.h>

@class LYMusicModel, LYMusicMessageModel;

@interface LYMusicOperationTool : NSObject

interfaceSingleton(LYMusicOperationTool);

/** 存放的播放列表 */
@property (nonatomic, strong) NSArray <LYMusicModel *> *musicModels;

/** 歌曲信息数据模型 */
@property (nonatomic, strong) LYMusicMessageModel *messageModel;


/**
 *  在播放某一首音乐对应的数据模型时
 *
 *  @param musicModel 音乐数据模型
 */
- (void)playMusicWithMusicModel:(LYMusicModel *)musicModel;

/**
 *  暂停当前正在播放的音乐
 */
- (void)pauseCurrentMusic;

/**
 *  继续播放当前音乐
 */
- (void)playCurrentMusic;

/**
 *  播放下一首
 */
- (void)nextMusic;

/**
 *  播放上一首
 */
- (void)preMusic;

/**
 *  设置播放的进度
 */
- (void)seekToTimeInterval:(NSTimeInterval)currentTime;

/**
 *  更新锁屏信息
 */
- (void)updateLockScreenInfo;

@end

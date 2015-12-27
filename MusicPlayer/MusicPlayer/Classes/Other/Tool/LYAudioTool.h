//
//  LYAudioTool.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/20.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

/**
 *  此工具类只负责单个音乐的播放,暂停,停止操作
 *
 */
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface LYAudioTool : NSObject

/** 设置代理, 让外界监听音乐播放完成事件 */
@property (nonatomic, weak) id<AVAudioPlayerDelegate> delegate;


/**
 *  根据文件名, 播放一首音乐
 *
 *  @param audioName 文件名
 *
 *  @return 当前播放器
 */
- (AVAudioPlayer *)playAudioWithFileName:(NSString *)fileName;

/**
 *  暂停当前正在播放的音乐
 */
- (void)pauseAudio;

/**
 *  停止当前正在播放的音乐
 */
- (void)stopAudio;

/**
 *  设置当前播放器的播放进度
 *
 *  @param currentTime 播放时间
 */
- (void)seekToTimeInterval:(NSTimeInterval)currentTime;

@end

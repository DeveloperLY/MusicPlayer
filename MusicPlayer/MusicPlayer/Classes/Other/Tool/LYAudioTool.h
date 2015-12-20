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

/**
 *  根据文件名, 播放一首音乐
 *
 *  @param audioName 文件名
 *
 *  @return <#return value description#>
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

@end

//
//  LYAudioTool.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/20.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import "LYAudioTool.h"

@interface LYAudioTool () <AVAudioPlayerDelegate>

/** 当前播放器对象 */
@property (nonatomic, strong) AVAudioPlayer *currentPlayer;

@end

@implementation LYAudioTool

- (instancetype)init
{
    if (self = [super init]) {
        [self backPlay];
    }
    return self;
}


- (void)backPlay
{
    // 获取音频会话
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    // 设置会话类别为后台播放
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    // 激活会话
    [session setActive:YES error:nil];
}

/**
 *  根据歌曲名称, 播放一首音乐
 *
 *  @param fileName 歌曲文件名称
 *
 *  @return 播放器(用于外界获取播放进度信息)
 */
- (AVAudioPlayer *)playAudioWithFileName:(NSString *)fileName
{
    // 根据名称, 获取资源路径
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
    
    // 容错处理, 如果没有找到对应资源, 直接返回
    if (fileURL == nil) {
        return nil;
    }
    
    // 业务逻辑优化, 如果发现, 播放的是当前正在播放的歌曲, 不需要重新创建播放器对象, 直接开始播放就行
    if ([self.currentPlayer.url.absoluteString isEqualToString:fileURL.absoluteString]) {
        [self.currentPlayer play];
        return self.currentPlayer;
    }
    
    // 根据资源路径, 创建播放器对象
    self.currentPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    
    
    // 设置播放器的代理
    self.currentPlayer.delegate = self;
    
    // 开始播放
    [self.currentPlayer prepareToPlay];
    [self.currentPlayer play];
    
    return self.currentPlayer;
}

// 暂停当前正在播放的音乐
- (void)pauseAudio
{
    [self.currentPlayer pause];
}

// 停止当前正在播放的音乐
- (void)stopAudio
{
    [self.currentPlayer stop];
    self.currentPlayer = nil;
}

// 设置当前播放器的播放进度
- (void)seekToTimeInterval:(NSTimeInterval)currentTime
{
    [self.currentPlayer setCurrentTime:currentTime];
}

#pragma mark - AVAudioPlayerDelegate
/**
 *  音乐播放完成, 发送通知告诉外界
 *
 *  @param player 音乐播放器
 *  @param flag   是否完成
 */
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (flag) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationPlayFinish object:self.currentPlayer];
    }
}

@end

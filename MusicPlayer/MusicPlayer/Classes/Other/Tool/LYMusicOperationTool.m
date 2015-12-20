//
//  LYMusicOperationTool.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/20.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import "LYMusicOperationTool.h"
#import "LYAudioTool.h"
#import "LYMusicModel.h"

@interface LYMusicOperationTool ()

/** 单个音乐播放的工具类 */
@property (nonatomic, strong) LYAudioTool *audioTool;

/** 当前正在播放的播放器对象*/
@property (nonatomic ,weak) AVAudioPlayer *currentPlayer;

@end

@implementation LYMusicOperationTool
implementationSingleton(LYMusicOperationTool);

/**
 *  懒加载负责单首音乐播放的工具类
 *
 *  @return 音乐播放工具类
 */
- (LYAudioTool *)audioTool
{
    if (!_audioTool) {
        _audioTool = [[LYAudioTool alloc] init];
    }
    return _audioTool;
}

- (void)playMusicWithMusicModel:(LYMusicModel *)musicModel
{
    self.currentPlayer = [self.audioTool playAudioWithFileName:musicModel.filename];
}

@end

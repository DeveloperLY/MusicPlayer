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

@class LYMusicModel;

@interface LYMusicOperationTool : NSObject

interfaceSingleton(LYMusicOperationTool);

/**
 *  在播放某一首音乐对应的数据模型时
 *
 *  @param musicModel 音乐数据模型
 */
- (void)playMusicWithMusicModel:(LYMusicModel *)musicModel;

@end

//
//  LYMusicMessageModel.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/21.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYMusicModel;

@interface LYMusicMessageModel : NSObject

/** 当前正在播放的音乐数据模型 */
@property (nonatomic ,strong) LYMusicModel *musicModel;

/** 当前播放的时长 */
@property(nonatomic ,assign) NSTimeInterval costTime;

/** 当前播放总时长 */
@property(nonatomic ,assign) NSTimeInterval totalTime;

/** 当前的播放状态 */
@property(nonatomic ,assign) BOOL isPlaying;

@end

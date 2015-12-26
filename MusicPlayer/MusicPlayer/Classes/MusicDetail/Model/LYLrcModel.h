//
//  LYLrcModel.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/26.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

/**
 *  歌词数据模型
 */
#import <Foundation/Foundation.h>

@interface LYLrcModel : NSObject

/** 开始时间 */
@property (nonatomic ,assign) NSTimeInterval beginTime;

/** 结束时间 */
@property (nonatomic ,assign) NSTimeInterval endTime;

/** 歌词内容 */
@property (nonatomic, copy) NSString *lrcText;

@end

//
//  LYMusicModel.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/20.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYMusicModel : NSObject

/** 歌名 */
@property (nonatomic, copy) NSString *name;

/** 歌曲文件名 */
@property (nonatomic, copy) NSString *filename;

/** 歌词文件名 */
@property (nonatomic, copy) NSString *lrcname;

/** 歌手 */
@property (nonatomic, copy) NSString *singer;

/** 歌手头像 */
@property (nonatomic, copy) NSString *singerIcon;

/** 专辑图片 */
@property (nonatomic, copy) NSString *icon;

@end


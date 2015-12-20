//
//  LYMusicDataTool.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/20.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import "LYMusicDataTool.h"
#import "LYMusicModel.h"
#import "MJExtension.h"

@implementation LYMusicDataTool


+ (void)loadMusicData:(void (^)(NSArray<LYMusicModel *> *))resultBlock
{
    // 回调block
    // 此处的实现, 利用的字典转模型框架 MJExtension  , 注意方法名不要写错,(不要写成了传递路径的方法, 那个方法还需要获取文件路径)
    resultBlock([LYMusicModel mj_objectArrayWithFilename:@"Musics.plist"]);
}

@end

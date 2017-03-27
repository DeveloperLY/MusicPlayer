//
//  LYMusicListCell.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/20.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYMusicModel;

@interface LYMusicListCell : UITableViewCell

/**
 *  快速创建Cell的方法
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** 歌曲数据模型 */
@property (nonatomic, strong) LYMusicModel *musicModel;

@end

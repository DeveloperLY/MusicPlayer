//
//  LYLrcCell.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/27.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

/**
 *  自定义歌词展示cell
 */

#import <UIKit/UIKit.h>

@interface LYLrcCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** 歌词内容 */
@property(nonatomic, copy) NSString *lrcText;

/** 歌词进度 */
@property(nonatomic, assign) CGFloat progress;

@end

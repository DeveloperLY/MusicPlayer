//
//  LYLrcCell.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/27.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "LYLrcCell.h"

@interface LYLrcCell ()

@end

@implementation LYLrcCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    // 同样不要忘记设置xib中的循环利用标识
    static NSString *ID = @"lrc";
    
    // 从缓存池获取
    LYLrcCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 如果缓存池获取为空, 则从xib中加载
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

/**
 *  重写歌词内容set方法, 展示歌词
 *
 *  @param lrcText 歌词内容
 */
- (void)setLrcText:(NSString *)lrcText
{
    _lrcText = lrcText;
    self.lrcLabel.text = lrcText;
}

/**
 *  设置歌词播放进度
 *
 *  @param progress 歌词进度
 */
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    self.lrcLabel.progress = progress;
}

@end

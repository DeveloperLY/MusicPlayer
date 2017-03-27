//
//  LYMusicListCell.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/20.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "LYMusicListCell.h"
#import "LYMusicModel.h"

@interface LYMusicListCell ()

/** 歌手头像图片视图 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

/** 歌曲名称标签 */
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;

/** 歌手名称标签 */
@property (weak, nonatomic) IBOutlet UILabel *singerNameLabel;

@end

@implementation LYMusicListCell

/**
 *  加载cell
 *
 *  @param tableView 外界传递过来的tableview, 用作循环利用
 *
 *  @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    /** 千万千万不要忘记在cell的xib文件中, 填写循环利用的cell标识, 与此处标识一致 */
    static NSString *ID = @"musicList";
    LYMusicListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

/**
 *  重写数据模型的set方法, 给内部子控件赋值
 */
- (void)setMusicModel:(LYMusicModel *)musicModel
{
    _musicModel = musicModel;
    
    // 给子控件赋值
    self.iconImageView.image = [UIImage imageNamed:musicModel.singerIcon];
    self.songNameLabel.text = musicModel.name;
    self.singerNameLabel.text = musicModel.singer;
}

/**
 *  当cell被从xib中加载完成后调用
 */
- (void)awakeFromNib
{
    // 设置圆角半径
    self.iconImageView.layer.cornerRadius = self.iconImageView.width * 0.5;
    // 将多余部分裁剪
    self.iconImageView.layer.masksToBounds = YES;
}

/**
 *  当cell, 被(取消)选中时, 系统自动调用的方法, 在此方法中可以做一些选中或者非选中的动画效果
 *
 *  @param selected 选中状态
 *  @param animated 动画
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    if (selected) {
        self.backgroundColor = [UIColor purpleColor];
    }else
    {
        self.backgroundColor = [UIColor clearColor];
    }
    
}

@end

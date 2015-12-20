//
//  LYDetailViewController.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/19.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import "LYDetailViewController.h"

@interface LYDetailViewController ()

/** 歌词的占位背景视图 */
@property (weak, nonatomic) IBOutlet UIScrollView *lrcBackView;

/** 以下控件都是需要赋值的, 根据更新频率采取不同的方案 **/

/**********************1次*******************/

/** 背景图片 */
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

/** 歌手头像 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

/** 歌曲名称 */
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;

/** 歌手名称 */
@property (weak, nonatomic) IBOutlet UILabel *singerNameLabel;

/** 歌曲总时长 */
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;

/**********************多次*******************/

/** 播放的歌词 */
@property (weak, nonatomic) IBOutlet UILabel *lrcLabel;

/** 歌曲已经播放的时长 */
@property (weak, nonatomic) IBOutlet UILabel *costTimeLabel;

/** 进度条 */
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;

/** 播放暂停按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseBtn;


/***************************以下属于其他功能实现的附加属性*********************************/

/** 显示歌词的view*/
@property (nonatomic, weak) UIView *lrcView;

/** 用来刷新界面的timer */
@property (nonatomic, strong) NSTimer *updateTimer;


@end

@implementation LYDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化设置
    [self setUpInit];
}

#pragma mark - 初始化设置
- (void)setUpInit
{
    // 添加负责显示歌词的视图
    UIView *lrcView = [[UIView alloc] init];
    self.lrcView = lrcView;
    lrcView.backgroundColor = [UIColor orangeColor];
    [self.lrcBackView addSubview:lrcView];
    self.lrcBackView.pagingEnabled = YES;
    self.lrcBackView.showsHorizontalScrollIndicator = NO;
    
    // 设置进度条图片
    [self.progressSlider setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:UIControlStateNormal];
}

/**
 *  设置当前的状态栏为白色
 *
 *  @return 状态栏样式
 */
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    // 设置歌词视图的frame
    self.lrcView.frame = self.lrcBackView.bounds;
    self.lrcView.x = self.lrcBackView.width;
    
    // 设置歌词占位视图的contentSize
    self.lrcBackView.contentSize = CGSizeMake(self.lrcBackView.width * 2.0, 0);
    
    // 设置歌手头像为圆形
    self.iconImageView.layer.cornerRadius = self.iconImageView.width * 0.5;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.borderWidth = 7.0;
    self.iconImageView.layer.borderColor = [UIColor colorWithRed:36/255.0 green:36/255.0 blue:36/255.0 alpha:1.0].CGColor;
    
}


@end

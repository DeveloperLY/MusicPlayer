//
//  LYDetailViewController.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/19.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import "LYDetailViewController.h"
#import "LYMusicOperationTool.h"
#import "LYMusicMessageModel.h"
#import "LYMusicModel.h"
#import "LYTimeTool.h"
#import "CALayer+PauseAimate.h"

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

/**
 *  当本控制器显示时, 再把timer添加进来
 */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setUpOnce];
    [self updateTimer];
}

/**
 *  当本控制器不显示时, 可以移除timer, 节省资源
 */
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.updateTimer invalidate];
    self.updateTimer = nil;
}

/******************以下方法, 都是业务逻辑方法, 需要跟外界进行交互, 所以放在比较容易被看到的地方**********************/

#pragma mark - Event
/**
 *  关闭控制器
 */
- (IBAction)close {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/**
 *  更多按钮
 */
- (IBAction)more
{
    NSLog(@"更多");
}

/**
 *  播放或者暂停(上一首, 下一首, 播放/暂停这些功能实现, 统一由LYMusicOperationTool工具类提供, 此控制器内部, 只负责业务逻辑调度)
 */
- (IBAction)playOrPause:(UIButton *)sender {
    // 更改按钮的播放状态
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        [[LYMusicOperationTool shareLYMusicOperationTool] playCurrentMusic];
        [self resumeRotation];
    } else {
        [[LYMusicOperationTool shareLYMusicOperationTool] pauseCurrentMusic];
        [self pauseRotation];
    }
}

/**
 *  上一首
 */
- (IBAction)preMusic {
    [[LYMusicOperationTool shareLYMusicOperationTool] preMusic];
    [self setUpOnce];
}

/**
 *  下一首
 */
- (IBAction)nextMusic {
    [[LYMusicOperationTool shareLYMusicOperationTool] nextMusic];
    [self setUpOnce];
}


/************************初始化设置, 以下方法不涉及业务逻辑, 写一次基本上就不用了**********************************/

#pragma mark - setUpOnce

/**
 *  歌曲切换时, 更新一次的情况
 */
- (void)setUpOnce
{
    // 获取工具类提供的播放音乐信息的数据模型(由工具类统一提供, 此处不需要关心如何获取, 只负责展示)
    LYMusicMessageModel *messageModel = [LYMusicOperationTool shareLYMusicOperationTool].messageModel;
    
    // 专辑图片
    self.backImageView.image = [UIImage imageNamed:messageModel.musicModel.icon];
    self.iconImageView.image = [UIImage imageNamed:messageModel.musicModel.icon];
    
    // 歌曲
    self.songNameLabel.text = messageModel.musicModel.name;
    // 演唱者
    self.singerNameLabel.text = messageModel.musicModel.singer;
    // 播放总时长
    self.totalTimeLabel.text = [LYTimeTool getFormatTimeWithTimeInterval:messageModel.totalTime];
    
    // 开始旋转图片
    [self beginRotation];
    if (messageModel.isPlaying) {
        [self resumeRotation];
    } else {
        [self pauseRotation];
    }
}

#pragma mark - setUpTimes

/**
 *  歌曲切换时, 更新多次的情况
 */
- (void)setUpTimes
{
    // 获取歌曲播放信息的数据模型
    LYMusicMessageModel *messageModel = [LYMusicOperationTool shareLYMusicOperationTool].messageModel;
    
    // 已经播放的时间
    self.costTimeLabel.text = [LYTimeTool getFormatTimeWithTimeInterval:messageModel.costTime];
    
    // 播放进度
    self.progressSlider.value = messageModel.costTime / messageModel.totalTime;
    
    self.playOrPauseBtn.selected = messageModel.isPlaying;
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

#pragma mark - 歌手头像旋转

/**
 *  开始旋转
 */
- (void)beginRotation
{
    [self.iconImageView.layer removeAnimationForKey:@"rotation"];
    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    animation.fromValue = @(0);
    animation.toValue = @(M_PI * 2);
    animation.duration = 30;
    animation.keyPath = @"transform.rotation.z";
    animation.repeatCount = NSIntegerMax;
    animation.removedOnCompletion = NO;
    [self.iconImageView.layer addAnimation:animation forKey:@"rotation"];
}

/**
 *  暂停旋转(此处的实现, 是使用到了一个CALayer分类, 来暂停核心动画)
 */
- (void)pauseRotation
{
    [self.iconImageView.layer pauseAnimate];
}

/**
 *  继续旋转(此处的实现, 是使用到了一个CALayer分类, 来暂停核心动画)
 */
- (void)resumeRotation
{
    [self.iconImageView.layer resumeAnimate];
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

/**
 *  当视图被布局完成之后调用(因为直接在viewDidLoad方法中, 获取到得各个视图大小, 是在"豆腐块", 状态下的大小)
 */
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

#pragma mark - lazy loading

/**
 *  负责更新进度等信息的timer
 *
 *  @return timer
 */
- (NSTimer *)updateTimer
{
    if (!_updateTimer) {
        _updateTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setUpTimes) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_updateTimer forMode:NSRunLoopCommonModes];
    }
    return _updateTimer;
}



@end

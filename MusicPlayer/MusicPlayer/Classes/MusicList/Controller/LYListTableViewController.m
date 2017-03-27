//
//  LYListTableViewController.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/19.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "LYListTableViewController.h"
#import "LYMusicModel.h"
#import "LYMusicDataTool.h"
#import "LYMusicListCell.h"
#import "LYMusicOperationTool.h"

@interface LYListTableViewController ()

/** 所有的歌曲模型 */
@property (nonatomic, strong) NSArray <LYMusicModel *> *musicModels;

@end

@implementation LYListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化设置
    [self setUpInit];
    
    // 加载数据
    [self loadData];
}

#pragma mark - 初始化设置
/**
 *  控制器的一些初始化方法
 */
- (void)setUpInit
{
    // 隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    
    // 设置TableView的背景图片
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QQListBack"]];
    self.tableView.backgroundView = backImageView;
    
    // 设置Cell的高度
    self.tableView.rowHeight = 80;
    
    // 设置TableView的分割线样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

#pragma mark - 设置状态栏的样式
/**
 *  设置状态栏的样式(此方法是系统调用, 不是自定义方法)
 *
 *  @return 状态栏样式
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - 重写数据源的set方法
/**
 *  重写数据源的set方法, 在这个方法里面刷新数据源, "级联调用"; 因为这个方法一旦被调用, 就意味着外界想要修改数据源; 那么就应该刷新视图更新数据; 不需要外界更改数据源的同时还要关心视图刷新问题
 */
- (void)setMusicModels:(NSArray<LYMusicModel *> *)musicModels
{
    _musicModels = musicModels;
    [self.tableView reloadData];
}

#pragma mark - 加载数据
/**
 *  加载数据源: 注意: 此处只负责调用接口, 直接获取数据, 具体获取数据的具体实现, 由其他的工具类负责; 提高复用性和可维护性以及扩展性
 */
- (void)loadData
{
    [LYMusicDataTool loadMusicData:^(NSArray<LYMusicModel *> *musicModels) {
        self.musicModels = musicModels;
        
        // 给专门负责播放业务逻辑的工具类, 赋值, 告诉它, 需要播放的数据列表
        [LYMusicOperationTool shareLYMusicOperationTool].musicModels = musicModels;
    }];
}

#pragma mark - TableView的数据源和代理方法
/**
 *  获取多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.musicModels.count;
}

/**
 *  获取每一行的cell : 注意: cell 最好封装起来, 方便后期扩展, 而且也符合MVC的原则
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYMusicListCell *cell = [LYMusicListCell cellWithTableView:tableView];
    
    // 取出数据模型赋值
    LYMusicModel *musicModel = self.musicModels[indexPath.row];
    
    cell.musicModel = musicModel;
    
    return cell;
}

/**
 *  选中某一行的时候, 需要做的逻辑操作
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出数据模型
    LYMusicModel *musicModel = self.musicModels[indexPath.row];
    
    // 播放音乐
    [[LYMusicOperationTool shareLYMusicOperationTool] playMusicWithMusicModel:musicModel];
    
    // 跳转到详情界面
    [self performSegueWithIdentifier:@"list2Detail" sender:nil];
    
}

// cell动画
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 设置Cell的动画效果为3D效果
    // 设置x和y的初始值为0.1；
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    // x和y的最终值为1
    [UIView animateWithDuration:1 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

@end

//
//  LYLrcViewController.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/26.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import "LYLrcViewController.h"
#import "LYLrcModel.h"
#import "LYLrcCell.h"

@interface LYLrcViewController ()

@end

@implementation LYLrcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 控制器初始化方法
    [self setUpInit];
}

/**
 *  初始化方法
 */
- (void)setUpInit
{
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
}

/**
 *  当控制器视图布局结束后调用(系统方法)
 */
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // 设置tableview内边距, 可以让第一行和最后一行歌词显示到中间位置
    self.tableView.contentInset = UIEdgeInsetsMake(self.tableView.height * 0.5, 0, self.tableView.height * 0.5, 0);
}

/**
 *  重写歌词进度的set方法, 在此方法中, 设置歌词进度
 */
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    // 获取当前的行号
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.scrollRow inSection:0];
    
    // 取出对应的cell
    LYLrcCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    // 设置进度
    cell.progress = progress;
}

/**
 *  重写歌词数据源的set方法, 在这个方法里面刷新表格
 *
 *  @param lrcModels 数据源
 */
- (void)setLrcModels:(NSArray<LYLrcModel *> *)lrcModels
{
    _lrcModels = lrcModels;
    [self.tableView reloadData];
}

/**
 *  重写需要滚动行的set方法, 在此方法里面滚动到对应的行
 *
 *  @param scrollRow 需要滚动的行号
 */
- (void)setScrollRow:(NSInteger)scrollRow
{
    // 通过这个判断, 过滤同一行的频繁刷新
    if (_scrollRow == scrollRow) {
        return;
    }
    _scrollRow = scrollRow;
    
    // 获取需要滚动的IndexPath
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_scrollRow inSection:0];
    
    // 刷新表格
    [self.tableView reloadRowsAtIndexPaths:[self.tableView indexPathsForVisibleRows] withRowAnimation:UITableViewRowAnimationFade];
    
    // 滚动到对应行
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lrcModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 快速创建歌词cell
    LYLrcCell *cell = [LYLrcCell cellWithTableView:tableView];
    
    // 取出数据模型
    LYLrcModel *lrcModel = self.lrcModels[indexPath.row];
    
    // 赋值
    cell.lrcText = lrcModel.lrcText;
    
    // 更新进度
    if (indexPath.row == self.scrollRow) {
        cell.progress = self.progress;
        cell.lrcLabel.font = [UIFont systemFontOfSize:18.0];
    } else {
        cell.progress = 0;
        cell.lrcLabel.font = [UIFont systemFontOfSize:15.0];
    }
    
    return cell;
}

@end

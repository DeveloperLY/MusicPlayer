//
//  LYLrcViewController.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/26.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import "LYLrcViewController.h"
#import "LYLrcModel.h"

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
 *  重写歌词数据源的set方法, 在这个方法里面刷新表格
 *
 *  @param lrcModels 数据源
 */
- (void)setLrcModels:(NSArray<LYLrcModel *> *)lrcModels
{
    _lrcModels = lrcModels;
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lrcModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"LRC";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    // 取出数据模型
    LYLrcModel *lrcModel = self.lrcModels[indexPath.row];
    
    // 赋值
    cell.textLabel.text = lrcModel.lrcText;
    
    return cell;
}

@end

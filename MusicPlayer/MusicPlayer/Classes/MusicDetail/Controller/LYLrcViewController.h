//
//  LYLrcViewController.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/26.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYLrcModel;

@interface LYLrcViewController : UITableViewController

/** 外界传递过来的歌词数据源, 负责展示 */
@property (nonatomic, strong) NSArray <LYLrcModel *> *lrcModels;

@end

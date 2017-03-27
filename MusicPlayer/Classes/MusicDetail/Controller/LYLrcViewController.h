//
//  LYLrcViewController.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/26.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYLrcModel;

@interface LYLrcViewController : UITableViewController

/** 外界传递过来的歌词数据源, 负责展示 */
@property (nonatomic, strong) NSArray <LYLrcModel *> *lrcModels;

/** 根据外界传递过来的行号, 负责滚动 */
@property (nonatomic, assign) NSInteger scrollRow;

/** 根据外界传递过来的歌词进度, 展示歌词进度 */
@property (nonatomic, assign) CGFloat progress;

@end

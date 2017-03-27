//
//  LYLrcLabel.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/27.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

/**
 *  自定义label
 *  可以通过传递过来的进度, 来更改label文字的颜色
 */

#import <UIKit/UIKit.h>

@interface LYLrcLabel : UILabel

/** 进度 */
@property(nonatomic, assign) CGFloat progress;

@end

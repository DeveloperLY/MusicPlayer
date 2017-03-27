//
//  LYImageTool.h
//  MusicPlayer
//
//  Created by Y Liu on 15/12/27.
//  Copyright © 2015年 DeveloperLY. All rights reserved.
//

/**
 *  负责图片处理的工具类
 */

#import <Foundation/Foundation.h>

@interface LYImageTool : NSObject

/**
 *  根据一个图片,和一个文本, 将文本内容绘制到图片上面, 并生成一个新的图片
 *
 *  @param text  文本内容
 *  @param image 源图片
 *
 *  @return 处理后的图片
 */
+ (UIImage *)createImageWithText:(NSString *)text inImage:(UIImage *)image;

@end

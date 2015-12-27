//
//  LYImageTool.m
//  MusicPlayer
//
//  Created by Y Liu on 15/12/27.
//  Copyright © 2015年 CoderYLiu. All rights reserved.
//

#import "LYImageTool.h"

@implementation LYImageTool

+ (UIImage *)createImageWithText:(NSString *)text inImage:(UIImage *)image
{
    // 开启上下文
    UIGraphicsBeginImageContext(image.size);
    
    // 绘制图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    // 绘制文字
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    
    NSDictionary *dict = @{
                          NSForegroundColorAttributeName : [UIColor colorWithRed:250 / 250.0 green:191 / 250.0 blue:20 / 250.0 alpha:1.0],
                          NSParagraphStyleAttributeName : style,
                          NSFontAttributeName : [UIFont systemFontOfSize:20]
                          };
    [text drawInRect:CGRectMake(0, image.size.height - 26, image.size.width, 26) withAttributes:dict];
    
    // 获取图片
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return resultImage;
}

@end

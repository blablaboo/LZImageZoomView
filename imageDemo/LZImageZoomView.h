//
//  LZImageZoomView.h
//  imageDemo
//
//  Created by Luojianzhen on 15/5/12.
//  Copyright (c) 2015年 future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZImageZoomView : UIView

/*!
 *  @author 罗建镇, 15-05-12 16:05:07
 *
 *  @brief  初始化
 *
 *  @param frame     当前view的frame
 *  @param urlString
 *
 *  @return 
 */
- (id)initWithFrame:(CGRect)frame byUrlString:(NSString *)urlString;

@end

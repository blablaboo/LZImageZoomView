//
//  LZImageZoomView.m
//  imageDemo
//
//  Created by Luojianzhen on 15/5/12.
//  Copyright (c) 2015年 future. All rights reserved.
//

#import "LZImageZoomView.h"

@interface LZImageZoomView()<UIScrollViewDelegate>
@property (nonatomic,retain)UIScrollView *sView;
@property (nonatomic,retain)UIImageView *imageV;
@property (nonatomic,retain)UIActivityIndicatorView *actView;
@end

@implementation LZImageZoomView

- (id)initWithFrame:(CGRect)frame byUrlString:(NSString *)urlString{
    self = [super initWithFrame:frame];
    if (self) {
        
        _sView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _sView.delegate = self;
        _sView.minimumZoomScale = 1.0;//图片缩小级别，为全部显示
        _sView.maximumZoomScale = 3.0;//图片放大级别
        _sView.showsHorizontalScrollIndicator =NO;
        _sView.showsVerticalScrollIndicator = NO;
        [self addSubview:_sView];
        
        _imageV =[[UIImageView alloc]initWithFrame:self.bounds];
        _imageV.contentMode = UIViewContentModeScaleAspectFit;//全部包裹
        [_sView addSubview:_imageV];
        
        //加载指示器
        _actView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _actView.center = self.center;
        [self addSubview:_actView];
        
        [_actView startAnimating];
        
        //异步加载图片
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            if (connectionError.code == 0) {
                UIImage *image = [UIImage imageWithData:data];
                _imageV.image = image;
            }
            
            [_actView stopAnimating];
        }];
        
        //添加双击放大缩小手势
        UITapGestureRecognizer *twoTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoomAction)];
        twoTap.numberOfTapsRequired = 2;
        twoTap.numberOfTouchesRequired = 1;
        [_sView addGestureRecognizer:twoTap];
    }
    return self;
}

/*!
 *  @author 罗建镇, 15-05-12 16:05:59
 *
 *  @brief  放大缩小功能，如果当前为最大，则设置为最小级别。反之为最大级别
 */
- (void)zoomAction{
    CGFloat currentScale = _sView.zoomScale;
    if(currentScale != _sView.maximumZoomScale){
        [_sView setZoomScale:_sView.maximumZoomScale animated:YES];
    }
    else {
        [_sView setZoomScale:_sView.minimumZoomScale animated:YES];
    }
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageV;
}


@end

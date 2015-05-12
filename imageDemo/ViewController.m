//
//  ViewController.m
//  imageDemo
//
//  Created by URoad_MP on 15/5/12.
//  Copyright (c) 2015年 future. All rights reserved.
//

#import "ViewController.h"
#import "LZImageZoomView.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scView;
/*
 Printing description of url:
 http://biz.cqway.rheaplus.com.cn/resource/images/140814459131l.jpg
 Printing description of url:
 http://biz.cqway.rheaplus.com.cn/resource/images/140814157821l.jpg
 Printing description of url:
 http://biz.cqway.rheaplus.com.cn/resource/images/140814852420l.jpg
 Printing description of url:
 http://biz.cqway.rheaplus.com.cn/resource/images/140814281912l.jpg
 */
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *urls = @[@"http://biz.cqway.rheaplus.com.cn/resource/images/140814459131l.jpg",@"http://biz.cqway.rheaplus.com.cn/resource/images/140814157821l.jpg",@"http://biz.cqway.rheaplus.com.cn/resource/images/140814852420l.jpg",@"http://biz.cqway.rheaplus.com.cn/resource/images/140814281912l.jpg"];
    __block CGFloat x = 0;
    [urls enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        LZImageZoomView *imgV = [[LZImageZoomView alloc]initWithFrame:CGRectMake(x, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) byUrlString:obj];
        [_scView addSubview:imgV];
        x= CGRectGetMaxX(imgV.frame);
        
    }];
    
    _scView.contentSize = CGSizeMake(x, _scView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

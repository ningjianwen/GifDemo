//
//  ViewController.m
//  GifDemo
//
//  Created by jianwen ning on 13/06/2019.
//  Copyright © 2019 jianwen ning. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+GIF.h"
#import <SDWebImage/FLAnimatedImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>
#import "UIImageView+WebCache.h"
#import <FLAnimatedImage/FLAnimatedImage.h>

#import <YYImage/YYImage.h>
#import <YYImage/YYAnimatedImageView.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//        [self loadLocaleGifImage];
    [self downloadNetworkGifImage];
}

//load loacle gif image
- (void)loadLocaleGifImage{
    
    //sdwebimage
    [self labelFactoryWithFrame:CGRectMake(0, 80, kScreenWidth, 20) title:@"SDWebImage"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:path];
    UIImageView *sdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenHeight/3)];
    sdImageView.image = [UIImage sd_animatedGIFWithData:gifData];
    [self.view addSubview:sdImageView];
    
    //yyImage show gif image
    [self labelFactoryWithFrame:CGRectMake(0, kScreenHeight/2 - 20, kScreenWidth, 20) title:@"YYImage"];
    YYImage *yyimage = [YYImage imageNamed:@"test.gif"];
    YYAnimatedImageView *yyImageView = [[YYAnimatedImageView alloc] initWithImage:yyimage];
    yyImageView.frame = CGRectMake(0, kScreenHeight/2, kScreenWidth, kScreenHeight/3);
    [self.view addSubview:yyImageView];
}

//download network gif image
- (void)downloadNetworkGifImage{
    
    //sdwebimage
    [self labelFactoryWithFrame:CGRectMake(0, 80, kScreenWidth, 20) title:@"SDWebImage"];
    FLAnimatedImageView *sdImageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenHeight/3)];
    [sdImageView sd_setImageWithURL:[NSURL URLWithString:@"http://photocdn.sohu.com/20151214/mp48444247_1450092561460_10.gif"]];
    [self.view addSubview:sdImageView];
    
    //yyImage show gif image
    [self labelFactoryWithFrame:CGRectMake(0, kScreenHeight/2 - 20, kScreenWidth, 20) title:@"YYImage"];
    YYImage *yyimage = [YYImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://photocdn.sohu.com/20151214/mp48444247_1450092561460_10.gif"]]];
    YYAnimatedImageView *yyImageView = [[YYAnimatedImageView alloc] initWithImage:yyimage];
    yyImageView.frame = CGRectMake(0, kScreenHeight/2, kScreenWidth, kScreenHeight/3);
    [self.view addSubview:yyImageView];
}

- (void)labelFactoryWithFrame:(CGRect)frame title:(NSString *)title{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    label.text = title;
    [self.view addSubview:label];
}


@end

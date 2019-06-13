# GifDemo

## 一、前言
iOS开发中，大部分时候我们显示一张静态图就可以了，但是有的时候为了UI表现更生动，我就有可能需要展示gif图来达到效果了。

网上找了一下，显示gif图的框架找到了两个。

1. **SDWebImage**
2. **YYImage**

![GifDemo.gif]()

## 二、显示本地gif图
SDWebImage和YYImage的显示本地图片代码。

```
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
    [self labelFactoryWithFrame:CGRectMake(0, kScreenHeight/2 - 20, kScreenWidth, 20) title:@"yyImage"];
    YYImage *yyimage = [YYImage imageNamed:@"test.gif"];
    YYAnimatedImageView *yyImageView = [[YYAnimatedImageView alloc] initWithImage:yyimage];
    yyImageView.frame = CGRectMake(0, kScreenHeight/2, kScreenWidth, kScreenHeight/3);
    [self.view addSubview:yyImageView];
}
```


## 三、加载网络的gif图

SDWebImage和YYImage的加载网络图片代码。


```
//download network gif image
- (void)downloadNetworkGifImage{
    
    //sdwebimage
    [self labelFactoryWithFrame:CGRectMake(0, 80, kScreenWidth, 20) title:@"SDWebImage"];
    FLAnimatedImageView *sdImageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenHeight/3)];
    [sdImageView sd_setImageWithURL:[NSURL URLWithString:@"http://photocdn.sohu.com/20151214/mp48444247_1450092561460_10.gif"]];
    [self.view addSubview:sdImageView];
    
    //yyImage show gif image
    [self labelFactoryWithFrame:CGRectMake(0, kScreenHeight/2 - 20, kScreenWidth, 20) title:@"yyImage"];
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
```

## 四、Podfile文件内容

```
platform :ios, '10.0'
inhibit_all_warnings!

target 'GifDemo' do

pod 'YYImage'
pod 'SDWebImage/GIF'
pod 'FLAnimatedImage'

end
```
## 五、没有demo的文章不是好文章

**SDWebImage**和**YYImage**框架显示本地和网络gif图的[demo传送门](https://github.com/ningjianwen/GifDemo.git)

//
//  MIImageContainer.m
//
//  Created by s3636586400 on 2016/11/17.
//  Copyright © 2016年 MaskIsland. All rights reserved.
//

#import "MIImageContainer.h"
#import <UIImageView+WebCache.h>

#define MI_WIDTH self.frame.size.width
#define MI_HEIGHT self.frame.size.height

@interface MIImageContainer ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation MIImageContainer

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self defaultConfig];
    [self loadView];

    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self defaultConfig];
    [self loadView];
}

#pragma mark - Public Method

- (void)loadImageURL:(NSURL *)url {
    if ([url isKindOfClass:NSString.class]) {
        url = [NSURL URLWithString:(NSString *)url];
    }
    if (!url) return;
    [_scrollView setZoomScale:1.0 animated:YES];
    [_scrollView setNeedsDisplay];
    [_imageView sd_setImageWithURL:url placeholderImage:_placeHolder];
}

- (void)loadImage:(UIImage *)image {
    [_scrollView setZoomScale:1.0 animated:YES];
    _imageView.image = image;
}

#pragma mark - Private Method

- (void)defaultConfig {
    _bgColor  = [UIColor blackColor];
    _maxScale = 2.0;
    _minScale = 0.5;
    _bounces  = YES;
}

- (void)loadView {
    [self.contentView addSubview:self.scrollView];
    [self.scrollView addSubview:self.imageView];
}

- (void)quit {
    UIViewController *imageViewer = nil;
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            imageViewer = (UIViewController *)nextResponder;
            break;
        }
    }
    if (!imageViewer) return;
    if (imageViewer.navigationController) {
        [imageViewer.navigationController popViewControllerAnimated:YES];
    }else {
        [imageViewer dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - Getter

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate         = self;
        _scrollView.zoomScale        = 1.0;
        _scrollView.backgroundColor  = _bgColor;
        _scrollView.minimumZoomScale = _minScale;
        _scrollView.maximumZoomScale = _maxScale;
        _scrollView.bouncesZoom      = _bounces;
        _scrollView.showsVerticalScrollIndicator   = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quit)];
        [_imageView addGestureRecognizer:tap];
    }
    return _imageView;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if (scrollView.zoomScale <= 1) {
        _imageView.center = CGPointMake(MI_WIDTH / 2, MI_HEIGHT / 2);
    }
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    if (scale < 1) {
        [UIView animateWithDuration:0.3 animations:^{
            scrollView.zoomScale = 1.0;
        }];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}


@end

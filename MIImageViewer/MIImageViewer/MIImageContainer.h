//
//  MIImageContainer.h
//
//  Created by s3636586400 on 2016/11/17.
//  Copyright © 2016年 MaskIsland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIImageContainer : UICollectionViewCell

@property (nonatomic, strong) UIColor *bgColor;     //背景色
@property (nonatomic, strong) UIImage *placeHolder; //占位图
@property (nonatomic, assign) CGFloat maxScale;     //最大比例值
@property (nonatomic, assign) CGFloat minScale;     //最小比例值
@property (nonatomic, assign) BOOL bounces;         //弹簧效果

- (void)loadImageURL:(NSURL *)url;
- (void)loadImage:(UIImage *)image;

@end

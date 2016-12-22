//
//  MIImageViewer.h
//
//  Created by s3636586400 on 2016/11/17.
//  Copyright © 2016年 MaskIsland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIImageViewer : UICollectionViewController

/**
 *  默认显示图片的索引
 */
@property (nonatomic, assign) NSInteger defaultIndex;

+ (MIImageViewer *)imageViewer;

/**
 加载图片

 @param images UIImage数组
 */
- (void)loadImages:(NSArray *)images;

/**
 加载图片URL

 @param imageUrls NSURL数组
 */
- (void)loadImageUrls:(NSArray *)imageUrls;

@end

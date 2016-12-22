//
//  MIImageViewer.m
//
//  Created by s3636586400 on 2016/11/17.
//  Copyright © 2016年 MaskIsland. All rights reserved.
//

#import "MIImageViewer.h"
#import "MIImageContainer.h"

typedef enum : NSUInteger {
    MIURLSource = 0,//URL源
    MIImageSource   //图片源
} MISourceType;     //源类型

@interface MIImageViewer ()

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *imageUrls;
@property (nonatomic, assign) MISourceType sourceType;

@end

@implementation MIImageViewer

static NSString * const reuseIdentifier = @"MICell";

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
    
    [self.collectionView registerClass:[MIImageContainer class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.navigationController) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    [self.collectionView reloadData];
    
    if (_defaultIndex) {
        CGFloat width = self.view.frame.size.width;
        self.collectionView.contentOffset = CGPointMake(width * _defaultIndex, 0);
    }
}

#pragma mark - Public Method

+ (MIImageViewer *)imageViewer {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width   = [UIScreen mainScreen].bounds.size.width;
    CGFloat height  = [UIScreen mainScreen].bounds.size.height;
    layout.itemSize = CGSizeMake(width, height);
    layout.minimumLineSpacing       = 0;
    layout.minimumInteritemSpacing  = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    MIImageViewer *imageViewer = [[MIImageViewer alloc] initWithCollectionViewLayout:layout];
    return imageViewer;
}

- (void)loadImages:(NSArray *)images {
    _images = images;
    _sourceType = MIImageSource;
}

- (void)loadImageUrls:(NSArray *)imageUrls {
    _imageUrls = imageUrls;
    _sourceType = MIURLSource;
}

#pragma mark - Private Method

- (void)setUp {
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _sourceType ? _images.count : _imageUrls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MIImageContainer *container = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (_sourceType) {
        UIImage *image = _images[indexPath.row];
        [container loadImage:image];
    }else {
        NSURL *url = _imageUrls[indexPath.row];
        [container loadImageURL:url];
    }
    return container;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

//
//  ViewController.m
//  MIImageViewer
//
//  Created by s3636586400 on 2016/11/16.
//  Copyright © 2016年 MaskIsland. All rights reserved.
//

#import "ViewController.h"
#import "MIImageViewer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (IBAction)click:(UIButton *)sender {
    MIImageViewer *imageViewer = [MIImageViewer imageViewer];
    NSArray *images = [self images];
    [imageViewer loadImages:images];
    //默认选中第三个
//    imageViewer.defaultIndex = 2;
    [self.navigationController pushViewController:imageViewer animated:YES];
}

- (NSArray *)images {
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < 5; index++) {
        NSString *fileName = [NSString stringWithFormat:@"IMG_074%ld",index];
        UIImage *image = [UIImage imageNamed:fileName];
        [images addObject:image];
    }
    return images;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

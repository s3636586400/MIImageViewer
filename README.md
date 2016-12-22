# MIImageViewer
简单图片浏览视图，左右滑动+缩放

![image](https://github.com/s3636586400/MIImageViewer/blob/master/GIF/MIImageViewGIF.gif)
# How To Use
```
MIImageViewer *imageViewer = [MIImageViewer imageViewer];
NSArray *images = [self images];
[imageViewer loadImages:images];
imageViewer.defaultIndex = 2;//默认选中第三个
[self.navigationController pushViewController:imageViewer animated:YES];
```
加载UIImage数组：
```
- (void)loadImages:(NSArray *)images;
```
加载图片NSURL数组（或字符串数组）：
```
- (void)loadImageUrls:(NSArray *)imageUrls;
```
# TODO
1.未做横屏处理 2.图片缩放时，滑动体验太渣

用到横屏时再处理吧……

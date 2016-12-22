# MIImageViewer
简单图片浏览视图，左右滑动+缩放

![image](https://github.com/s3636586400/MIImageViewer/blob/master/GIF/MIImageViewGIF.gif)
# How To Use
```
MIImageViewer *imageViewer = [MIImageViewer imageViewer];
NSArray *images = [self images];
[imageViewer loadImages:images];
//默认选中第三个
imageViewer.defaultIndex = 2;
[self.navigationController pushViewController:imageViewer animated:YES];
```
加载UIImage数组：
```
- (void)loadImages:(NSArray *)images;
```
加载图片NSURL数组（传字符串也行）：
```
- (void)loadImageUrls:(NSArray *)imageUrls;
```
# TODO
未做横屏处理 
图片缩放时，滑动体验太渣   
用到横屏时再处理吧……

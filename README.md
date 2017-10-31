# SignatureView
手写签名并保存

## Usage

### SignatureView


#### 获取签名视图

```objective-c
- (UIImage *)signatureImage {
    UIGraphicsBeginImageContext(self.frame.size);//创建一个基于位图的上下文，并设置当前上下文
    CGContextRef contex = UIGraphicsGetCurrentContext();//获取图形上下文
    UIRectClip(CGRectMake(3, 15, self.frame.size.width-6, self.frame.size.height-30));//裁剪区域
    [self.layer renderInContext:contex];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    NSData* imageData =  UIImagePNGRepresentation(image);
    UIImage* pngImage = [UIImage imageWithData:imageData];
    return pngImage;
}

```

#### 撤销/恢复绘制

```objective-c
/**
 撤销上一步绘制
 */
- (void)undoLastDraw;

/**
 恢复上次撤销操作
 */
- (void)redoLastDraw;

```

#### 清空操作

```objective-c
/**
 清除所有操作
 */
- (void)clearSignature;

```
#### 说明：
 [视图封装](http://www.cnblogs.com/ZachRobin/p/7760317.html)


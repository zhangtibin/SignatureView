//
//  SignatureView.m
//  SignatureView
//
//  Created by 张体宾 on 2017/10/30.
//  Copyright © 2017年 Dreams of Ideal World Co., Ltd. All rights reserved.
//

#import "SignatureView.h"

@interface SignatureView ()

@property (nonatomic, strong) NSMutableArray *pathsArray;
@property (nonatomic, strong) NSMutableArray *backPathsArray;
@property (nonatomic, copy) UIBezierPath *bezierPath;

@end

@implementation SignatureView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initConfigure];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    for (UIBezierPath *bPath in self.pathsArray) {
        [_lineColor setStroke];
        [bPath stroke];
    }
}

- (void)initConfigure {
    _lineColor = [UIColor blueColor];
    _lineWidth = 3.0;
    self.backgroundColor = [UIColor clearColor];
    
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
}

#pragma mark - 获取签名图片
- (UIImage *)signatureImage {
    UIGraphicsBeginImageContext(self.frame.size);//创建一个基于位图的上下文，并设置当前上下文
    CGContextRef contex = UIGraphicsGetCurrentContext();//获取图形上下文
    UIRectClip(CGRectMake(3, 15, self.frame.size.width-6, self.frame.size.height-30));//裁剪区域
    [self.layer renderInContext:contex];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    NSData* imageData =  UIImagePNGRepresentation(image);//生成 PNG 格式的图片（如果是其他格式，可以自行更改）
    UIImage* pngImage = [UIImage imageWithData:imageData];
    return pngImage;
}

#pragma mark - Public Actions
#pragma mark - 撤销上步绘制操作
- (void)undoLastDraw {
    if (self.pathsArray.count >0) {
        NSInteger index = self.pathsArray.count - 1;
        [self.backPathsArray addObject:self.pathsArray[index]];
        [self.pathsArray removeObjectAtIndex:index];
        [self setNeedsDisplay];
    }
}

#pragma mark - 恢复上步撤销的d操作
- (void)redoLastDraw {
    if (self.backPathsArray.count >0) {
        NSInteger index = self.backPathsArray.count - 1;
        [self.pathsArray addObject:self.backPathsArray[index]];
        [self.backPathsArray removeObjectAtIndex:index];
        [self setNeedsDisplay];
    }
}

#pragma mark - 清空所有操作
- (void)clearSignature {
    [self.pathsArray removeAllObjects];
    [self.backPathsArray removeAllObjects];
    [self setNeedsDisplay];
}

#pragma mark - 保存到相册
- (void)saveSignature {
    UIImage *pngImage = [self signatureImage];
    UIImageWriteToSavedPhotosAlbum(pngImage, self, nil, NULL);
}

#pragma mark - Touches Action
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches allObjects].lastObject;
    CGPoint startPoint = [touch locationInView:self];
    [self.bezierPath moveToPoint:startPoint];
    [self.pathsArray addObject:self.bezierPath];
    [self.backPathsArray removeAllObjects];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches allObjects].lastObject;
    CGPoint touchPoint = [touch locationInView:self];
    [self.bezierPath addLineToPoint:touchPoint];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.bezierPath = nil;
}

- (NSMutableArray *)pathsArray {
    if (!_pathsArray) {
        _pathsArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _pathsArray;
}

- (NSMutableArray *)backPathsArray {
    if (!_backPathsArray) {
        _backPathsArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _backPathsArray;
}

- (UIBezierPath *)bezierPath {
    if (!_bezierPath) {
        _bezierPath = [UIBezierPath bezierPath];
        _bezierPath.lineJoinStyle = kCGLineJoinRound;
        _bezierPath.lineCapStyle = kCGLineCapRound;
        _bezierPath.lineWidth = _lineWidth;
    }
    return _bezierPath;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

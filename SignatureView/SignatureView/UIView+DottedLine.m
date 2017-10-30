//
//  UIView+DottedLine.m
//  CustomerSigning
//
//  Created by 张体宾 on 2017/10/30.
//  Copyright © 2017年 Shanghai Wo'aiwojia Housing Rental Exchange Co.,Ltd. All rights reserved.
//

#import "UIView+DottedLine.h"

@implementation UIView (DottedLine)

#pragma mark - 水平方向虚线
- (void)drawHorizontalDottedLineWithLength:(CGFloat)lineLength
                               lineSpacing:(CGFloat)lineSpacing
                                 lineColor:(UIColor *)lineColor {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setBounds:self.bounds];
    
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(self.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(self.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [self.layer addSublayer:shapeLayer];
}

#pragma mark - 竖直方向虚线
- (void)drawVerticalDotterLineWithHeight:(CGFloat)lineHeight
                             lineSpacing:(CGFloat)lineSpacing
                               lineColor:(UIColor *)lineColor{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setBounds:self.bounds];
    
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetWidth(self.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineHeight], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,0, CGRectGetHeight(self.frame));
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [self.layer addSublayer:shapeLayer];
    
}

#pragma mark - 给视图添加虚线边框
- (void)drawRectDotterLineWithLineWidth:(CGFloat)lineWidth
                            lineLength:(CGFloat)lineLength
                           lineSpacing:(CGFloat)lineSpacing
                             lineColor:(UIColor *)lineColor
                          cornerRadius:(CGFloat)cornerRadius{
    
    CAShapeLayer  *_shapeLayer = [CAShapeLayer layer];
    
    _shapeLayer.strokeColor = lineColor.CGColor;
    
    _shapeLayer.fillColor = nil;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
    
    _shapeLayer.path = path.CGPath;
    
    _shapeLayer.frame = self.bounds;
    
    _shapeLayer.lineWidth = lineWidth;
    
    _shapeLayer.lineCap = @"butt";
    
    _shapeLayer.lineDashPattern = @[[NSNumber numberWithFloat:lineLength*2], [NSNumber numberWithFloat:lineSpacing]];
    
    [self.layer addSublayer:_shapeLayer];
    
    if (cornerRadius!=0) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = cornerRadius;
    }
    
}

@end

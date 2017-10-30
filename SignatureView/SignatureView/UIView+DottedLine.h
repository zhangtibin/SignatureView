//
//  UIView+DottedLine.h
//  CustomerSigning
//
//  Created by 张体宾 on 2017/10/30.
//  Copyright © 2017年 Shanghai Wo'aiwojia Housing Rental Exchange Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Class 描述：虚线视图
 */
@interface UIView (DottedLine)

///水平方向虚线
/**
 水平方向虚线

 @param lineLength 虚线段长度
 @param lineSpacing 虚线段间隔
 @param lineColor 虚线段颜色
 */
- (void)drawHorizontalDottedLineWithLength:(CGFloat)lineLength
                               lineSpacing:(CGFloat)lineSpacing
                                 lineColor:(UIColor *)lineColor;

///竖直方向虚线
/**
 竖直方向虚线

 @param lineHeight 虚线段长度
 @param lineSpacing 虚线段间隔
 @param lineColor 虚线段颜色
 */
- (void)drawVerticalDotterLineWithHeight:(CGFloat)lineHeight
                             lineSpacing:(CGFloat)lineSpacing
                               lineColor:(UIColor *)lineColor;

///给视图添加虚线边框
/**
 给视图添加虚线边框

 @param lineWidth 虚线段宽度
 @param lineLength 虚线段长度
 @param lineSpacing 虚线段间隔
 @param lineColor 虚线段颜色
 @param cornerRadius 虚线段圆角
 */
- (void)drawRectDotterLineWithLineWidth:(CGFloat)lineWidth
                            lineLength:(CGFloat)lineLength
                           lineSpacing:(CGFloat)lineSpacing
                             lineColor:(UIColor *)lineColor
                          cornerRadius:(CGFloat)cornerRadius;

@end

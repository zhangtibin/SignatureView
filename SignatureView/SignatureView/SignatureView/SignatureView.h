//
//  SignatureView.h
//  SignatureView
//
//  Created by 张体宾 on 2017/10/30.
//  Copyright © 2017年 Dreams of Ideal World Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignatureView : UIView

@property (nonatomic, strong) UIColor *lineColor;   //画笔颜色
@property (nonatomic, assign) CGFloat lineWidth;    //画笔宽度
@property (nonatomic, strong) UIImage *backgroundImage; //背景图片

/**
 获取签名图片
 
 @return 签名Image
 */
- (UIImage *)signatureImage;

/**
 撤销上一步绘制
 */
- (void)undoLastDraw;

/**
 恢复上次撤销操作
 */
- (void)redoLastDraw;

/**
 清除所有操作
 */
- (void)clearSignature;

/**
 保存签名
 */
- (void)saveSignature;


@end

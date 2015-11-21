//
//  LZCircleView.h
//  LZWeather
//
//  Created by comst on 15/11/21.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZCircleView : UIView

@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) BOOL clockWise;
@property (nonatomic, assign) CGFloat startAngle;


- (void)buildview;

- (void)strokeEnd:(CGFloat)percent animated:(BOOL)animated duration:(CGFloat)duration;

- (void)strokeStart:(CGFloat)percent animated:(BOOL)animated duration:(CGFloat)duration;

+ (instancetype)defaultCircleView:(CGRect)frame;


@end

//
//  LZLineBakgroundView.h
//  LZWeather
//
//  Created by comst on 15/11/14.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SetRect.h"
@interface LZLineBakgroundView : UIView
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat lineGap;
@property (nonatomic, strong) UIColor *lineColor;

- (void)buildView;

+ (instancetype)linebackgroundViewWithWith:(CGFloat)width lineGap:(CGFloat)gap lineColor:(UIColor *)color frame:(CGRect)frameRect;

@end

//
//  LZLineBakgroundView.m
//  LZWeather
//
//  Created by comst on 15/11/14.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZLineBakgroundView.h"
#define lineBackGroundViewWidth 1000
#define lineBackGrounViewHeight 1000
@implementation LZLineBakgroundView


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
    }
    
    return self;
}

- (void)buildView{
    
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, lineBackGroundViewWidth, lineBackGrounViewHeight)];
    containerView.center = self.center;
    
    CGFloat lineWith = lineBackGroundViewWidth;
    CGFloat lineHeight = self.lineWidth;
    CGFloat lineX = 0;
    CGFloat lineY = 0;
    NSInteger count = lineBackGrounViewHeight / (self.lineWidth + self.lineGap);
    
    for (NSInteger index = 0; index < count; index ++) {
        
        lineY  = index * (self.lineWidth + self.lineGap);
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(lineX, lineY, lineWith, lineHeight)];
        [containerView addSubview:lineView];
        lineView.backgroundColor = self.lineColor;
        lineView.alpha = 0.035;
        
    }
    containerView.transform = CGAffineTransformRotate(self.transform, M_PI_4 * 3);
   
     [self addSubview:containerView];
    return ;
    
}

+ (instancetype)linebackgroundViewWithWith:(CGFloat)width lineGap:(CGFloat)gap lineColor:(UIColor *)color frame:(CGRect)frameRect{
    
    LZLineBakgroundView *view ;
    
    view = [[LZLineBakgroundView alloc] initWithFrame:frameRect];
    view.lineWidth = width;
    view.lineGap = gap;
    view.lineColor = color;
    
    [view buildView];
    
    return view;
}
@end

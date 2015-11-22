//
//  LZCircleView.m
//  LZWeather
//
//  Created by comst on 15/11/21.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZCircleView.h"
#import "YXEasing.h"
#import "LZCommon.h"

@interface LZCircleView ()

@property (nonatomic, strong) CAShapeLayer *circleLayer;

@end

@implementation LZCircleView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initCircleLayer];
    }
    
    return self;
}

- (void)initCircleLayer{
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    
    circleLayer.frame = self.bounds;
    
    self.circleLayer = circleLayer;
    
    [self.layer addSublayer:circleLayer];
}

- (void)buildview{
    
    CGFloat lineWidth = self.lineWidth > 0 ? self.lineWidth : 1;
    UIColor *lineColor = self.lineColor != nil? self.lineColor :[UIColor blackColor];
    CGSize size = self.bounds.size;
    CGFloat circleRadius = size.width * 0.5 - lineWidth * 0.5;
    
    BOOL clockWise = self.clockWise;
    
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    
    if (clockWise == YES) {
        startAngle = - RADIAN(180 - self.startAngle);
        endAngle = RADIAN(180 + self.startAngle);
    }else{
        startAngle = RADIAN(180 -  self.startAngle);
        endAngle = - RADIAN(180 + self.startAngle);
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width * 0.5, size.height * 0.5) radius:circleRadius startAngle:startAngle endAngle:endAngle clockwise:clockWise];
    
    self.circleLayer.path = path.CGPath;
    self.circleLayer.strokeColor = lineColor.CGColor;
    self.circleLayer.lineWidth = lineWidth;
    self.circleLayer.strokeEnd = 0;
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    
}

- (void)strokeEnd:(CGFloat)percent animated:(BOOL)animated duration:(CGFloat)duration{
    
    if (percent <= 0) {
        percent = 0;
    }else if (percent >= 1){
        percent = 1;
    }
    
    if (animated) {
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
        keyAnimation.keyPath = @"strokeEnd";
        keyAnimation.duration = duration;
        keyAnimation.values = [YXEasing calculateFrameFromValue:self.circleLayer.strokeEnd toValue:percent func:CubicEaseInOut frameCount:duration * 30];
        self.circleLayer.strokeEnd = percent;
        
        [self.circleLayer addAnimation:keyAnimation forKey:nil];
    }else{
        [CATransaction setDisableActions:YES];
        self.circleLayer.strokeEnd = percent;
        [CATransaction setDisableActions:NO];
    }
}

- (void)strokeStart:(CGFloat)percent animated:(BOOL)animated duration:(CGFloat)duration{
    if (percent <= 0) {
        percent = 0;
    }else if (percent >= 1){
        percent = 1;
    }
//    self.circleLayer.strokeEnd = 1;
    if (animated) {
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
        keyAnimation.keyPath = @"strokeStart";
        keyAnimation.duration = duration;
        keyAnimation.values = [YXEasing calculateFrameFromValue:self.circleLayer.strokeStart toValue:percent func:CubicEaseInOut frameCount:duration * 30];
        self.circleLayer.strokeStart = percent;
        
        [self.circleLayer addAnimation:keyAnimation forKey:nil];
    }else{
        [CATransaction setDisableActions:YES];
        self.circleLayer.strokeStart = percent;
        [CATransaction setDisableActions:NO];
    }

}

+ (instancetype)defaultCircleView:(CGRect)frame{
    
    LZCircleView *view = [[LZCircleView alloc] initWithFrame:frame];
    view.lineWidth = 2;
    view.lineColor = [UIColor blackColor];
    view.clockWise = YES;
    view.startAngle = 180;
    return view;
}
@end

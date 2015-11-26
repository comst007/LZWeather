//
//  LZPathDirectionView.m
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZPathDirectionView.h"
#import "UIView+SetRect.h"
@interface LZPathDirectionView ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end
@implementation LZPathDirectionView

+ (Class)layerClass{
    return [CAShapeLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.shapeLayer = (CAShapeLayer *)self.layer;
        self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
        self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
        self.shapeLayer.lineWidth = 1;
        self.shapeLayer.strokeEnd = 0;
        self.shapeLayer.opacity = 0;
        self.shapeLayer.path = [self pathWithHeight:0];
    }
    
    return self;
}

- (CGPathRef)pathWithHeight:(CGFloat)height{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointZero;
    
    if (self.startPointAtRight == NO) {
        startPoint = CGPointMake(self.width, height);
        endPoint = CGPointMake(0, 0);
    }else{
        startPoint = CGPointMake(0, height);
        endPoint = CGPointMake(self.width, 0);
    }
    
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    
    return path.CGPath;
}

- (void)showPercent:(CGFloat)percent{
    
    if (percent < 0) {
        self.shapeLayer.path = [self pathWithHeight:0];
        self.shapeLayer.strokeEnd = 0;
        self.shapeLayer.opacity = 0;
    }else if (percent >= 0 && percent <= 0.5)
    {
        self.shapeLayer.path = [self pathWithHeight:0];
        self.shapeLayer.strokeEnd = percent * 2;
        self.shapeLayer.opacity = percent * 2;
    }else if (percent <= 1){
        CGFloat currentPercent = percent - 0.5;
        self.shapeLayer.path = [self pathWithHeight:currentPercent * self.height * 2];
        self.shapeLayer.strokeEnd = 1;
        self.shapeLayer.opacity = 1;
    }else{
        self.shapeLayer.path = [self pathWithHeight:self.height];
        self.shapeLayer.strokeEnd = 1;
        self.shapeLayer.opacity = 1;
    }
}
@end

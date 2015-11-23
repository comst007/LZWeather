//
//  LZAlphaView.m
//  LZWeather
//
//  Created by comst on 15/11/24.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZAlphaView.h"

@interface LZAlphaView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation LZAlphaView

+ (Class)layerClass{
    
    return [CAGradientLayer class];
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.gradientLayer = (CAGradientLayer *)self.layer;
        
    }
    
    return self;
}

- (void)alphaType{
    
    self.colors = @[[UIColor clearColor],[UIColor blackColor],[UIColor clearColor]];
    self.locations = @[@(0.25), @(0.5), @(0.75)];
    self.startPoint = CGPointMake(0, 0);
    self.endPoint = CGPointMake(1, 0);
    
}

- (void)setColors:(NSArray *)colors{
    
    _colors = colors;
    
    NSMutableArray *cgcolors = [NSMutableArray array];
    for (UIColor *color in colors) {
        [cgcolors addObject:(id)color.CGColor];
    }
    self.gradientLayer.colors = cgcolors;
    
}

- (void)setLocations:(NSArray *)locations{
    
    _locations = locations;
    
    self.gradientLayer.locations = locations;
}

- (void)setStartPoint:(CGPoint)startPoint{
    
    _startPoint = startPoint;
    
    self.gradientLayer.startPoint = startPoint;
}

- (void)setEndPoint:(CGPoint)endPoint{
    _endPoint = endPoint;
    
    self.gradientLayer.endPoint = endPoint;
}
@end

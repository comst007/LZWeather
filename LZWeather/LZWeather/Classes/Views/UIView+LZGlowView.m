//
//  UIView+LZGlowView.m
//  LZWeather
//
//  Created by comst on 15/11/17.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "UIView+LZGlowView.h"
#import <objc/runtime.h>
static char glowIntervalKey;
static char glowDurationKey;
static char glowOpacityKey;
static char dispatchSourceKey;
static char glowShowFlagKey;

@interface UIView ()

@property (nonatomic, strong) dispatch_source_t dispatchSource;
@property (nonatomic, strong) NSNumber *glowViewShowFlag;

@end

@implementation UIView (LZGlowView)

- (void)setGlowInterval:(NSNumber *)glowInterval{
    objc_setAssociatedObject(self, &glowIntervalKey, glowInterval, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)glowInterval{
    return objc_getAssociatedObject(self, &glowIntervalKey);
}

- (void)setGlowDuration:(NSNumber *)glowDuration{
    objc_setAssociatedObject(self, &glowDurationKey, glowDuration, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)glowDuration{
    return objc_getAssociatedObject(self, &glowDurationKey);
}

- (void)setGlowOpacity:(NSNumber *)glowOpacity{
    objc_setAssociatedObject(self, &glowOpacityKey, glowOpacity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)glowOpacity{
    return objc_getAssociatedObject(self, &glowOpacityKey);
}

- (void)setDispatchSource:(dispatch_source_t)dispatchSource{
    objc_setAssociatedObject(self, &dispatchSourceKey, dispatchSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_source_t)dispatchSource{
    return objc_getAssociatedObject(self, &dispatchSourceKey);
}

- (void)setGlowViewShowFlag:(NSNumber *)glowViewShowFlag{
    objc_setAssociatedObject(self, &glowShowFlagKey, glowViewShowFlag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)glowViewShowFlag{
    
    return objc_getAssociatedObject(self, &glowShowFlagKey);
}

- (void)createGlowLayer:(UIColor *)color glowRadius:(CGFloat)radius{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIBezierPath  *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [color setFill];
    [path fillWithBlendMode:kCGBlendModeSourceAtop alpha:1.0];
    CALayer *glowLayer = [CALayer layer];
    glowLayer.name = @"glowlayer";
    glowLayer.frame = self.bounds;
    glowLayer.contents = (id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    glowLayer.shadowOpacity = 1.0;
    glowLayer.shadowOffset =  CGSizeZero;
    glowLayer.shadowColor = color == nil ? [UIColor redColor].CGColor:color.CGColor;
    glowLayer.shadowRadius = (radius > 0) ? radius : 2;
    glowLayer.opacity = 0.0;
    
    
}

- (void)startGlow{
    
}

- (void)glowToGlowLayer{
    
}

-(void)glowToNormalLayer{
    
}

@end

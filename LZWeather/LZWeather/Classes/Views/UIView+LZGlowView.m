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
    [self.layer addSublayer:glowLayer];
    UIGraphicsEndImageContext();
    
    
}

- (void)startGlow{
    
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer.name isEqualToString:@"glowlayer"]) {
            if (self.glowViewShowFlag == nil) {
                self.glowViewShowFlag = @(NO);
            }
            if (self.dispatchSource == nil) {
                self.dispatchSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0 , 0, dispatch_get_main_queue());
                dispatch_source_set_timer(self.dispatchSource, dispatch_time(DISPATCH_TIME_NOW, 0), NSEC_PER_SEC * (self.glowInterval == nil ? 1 : self.glowInterval.floatValue), 0);
                
                dispatch_source_set_event_handler(self.dispatchSource, ^{
                    
                    if (self.glowViewShowFlag.boolValue == NO) {
                        self.glowViewShowFlag = @(YES);
                        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
                        animation.fromValue = @(0);
                        animation.toValue = self.glowOpacity == nil ?@(0.8):self.glowOpacity;
                        layer.opacity = [animation.toValue floatValue];
                        animation.duration = self.glowDuration == nil? 0.8 : self.glowDuration.floatValue;
                        [layer addAnimation:animation forKey:nil];
                    }else{
                        self.glowViewShowFlag = @(NO);
                        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
                        animation.fromValue = @(layer.opacity);
                        animation.toValue = 0;
                        animation.duration = self.glowDuration == nil? 0.8 : self.glowDuration.floatValue;
                        layer.opacity = 0;
                        [layer addAnimation:animation forKey:nil];
                    }
                    
                });
                dispatch_resume(self.dispatchSource);
                
            }
        }
    }
}

- (void)glowToGlowLayer{
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer.name isEqualToString:@"glowlayer"]) {
            self.glowViewShowFlag = @(YES);
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            animation.fromValue = @(0);
            animation.toValue = self.glowOpacity == nil ?@(0.8):self.glowOpacity;
            layer.opacity = [animation.toValue floatValue];
            animation.duration = self.glowDuration == nil? 0.8 : self.glowDuration.floatValue;
            [layer addAnimation:animation forKey:nil];
        }
    }
}

- (void)glowToNormalLayer{
    
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer.name isEqualToString:@"glowlayer"]) {
            self.glowViewShowFlag = @(NO);
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            animation.fromValue = @(layer.opacity);
            animation.toValue = 0;
            animation.duration = self.glowDuration == nil? 0.8 : self.glowDuration.floatValue;
            layer.opacity = 0;
            [layer addAnimation:animation forKey:nil];
        }
    }
    
}

@end

//
//  UIView+LZGlowView.h
//  LZWeather
//
//  Created by comst on 15/11/17.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LZGlowView)
@property (nonatomic, assign) NSNumber *glowInterval;
@property (nonatomic, assign) NSNumber *glowDuration;
@property (nonatomic, assign) NSNumber *glowOpacity;

- (void)createGlowLayer:(UIColor *)color glowRadius:(CGFloat)radius;
- (void)startGlow;
- (void)glowToGlowLayer;
- (void)glowToNormalLayer;
@end

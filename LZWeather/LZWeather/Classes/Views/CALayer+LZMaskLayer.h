//
//  CALayer+LZMaskLayer.h
//  LZWeather
//
//  Created by comst on 15/11/17.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface CALayer (LZMaskLayer)
+ (CALayer *)maskLayerWithSize:(CGSize)size image:(UIImage *)image;
@end

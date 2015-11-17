//
//  CALayer+LZMaskLayer.m
//  LZWeather
//
//  Created by comst on 15/11/17.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "CALayer+LZMaskLayer.h"

@implementation CALayer (LZMaskLayer)
+ (CALayer *)maskLayerWithSize:(CGSize)size image:(UIImage *)image{
    CALayer *layer ;
    layer = [CALayer layer];
    layer.anchorPoint = CGPointMake(0, 0);
    layer.bounds = CGRectMake(0, 0, size.width, size.height);
    if (image) {
        layer.contents = (id)image.CGImage;
    }
    
    return layer;
}
@end

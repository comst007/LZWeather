//
//  LZRainView.h
//  LZWeather
//
//  Created by comst on 15/11/17.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZEmitterLayerView.h"

@interface LZRainView : LZEmitterLayerView

@property (nonatomic, assign) CGFloat lifeTime;
@property (nonatomic, assign) CGFloat birthRate;
@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, assign) CGFloat speedRange;
@property (nonatomic, assign) CGFloat gravity;

- (void)showRain;

@end

//
//  LZTemperatureCountLabel.h
//  LZWeather
//
//  Created by comst on 15/11/23.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTemperatureCount.h"

@interface LZTemperatureCountLabel : UIView

@property (nonatomic, strong) NSNumber *fromVlaue;
@property (nonatomic, strong) NSNumber *toValue;
@property (nonatomic, strong) LZTemperatureCount *temperatureCount;

@property (nonatomic, strong) UILabel *temperatureLabel;

- (void)showDuration:(CGFloat)duration;

- (void)hideDuration:(CGFloat)duration;

@end

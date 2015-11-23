//
//  LZHumidityCountLabel.h
//  LZWeather
//
//  Created by comst on 15/11/22.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZHumidityCount.h"
@interface LZHumidityCountLabel : UIView

@property (nonatomic, strong) NSNumber *fromValue;

@property (nonatomic, strong) NSNumber *toValue;

@property (nonatomic, strong) LZHumidityCount *humidityCont;

@property (nonatomic, strong) UILabel *countLabel;

- (void)showDuration:(CGFloat)duration;

- (void)hideDuration:(CGFloat)duration;

@end

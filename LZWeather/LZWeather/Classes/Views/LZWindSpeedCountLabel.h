//
//  LZWindSpeedCountLabel.h
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZWindSpeedCount.h"
@interface LZWindSpeedCountLabel : UIView


@property (nonatomic, strong) NSNumber *fromVlaue;
@property (nonatomic, strong) NSNumber *toValue;

@property (nonatomic, strong) LZWindSpeedCount *speedCount;

@property (nonatomic, strong) UILabel *windSpeedLable;

- (void)showDuration:(CGFloat)duration;

- (void)hideDuration:(CGFloat)duration;

@end

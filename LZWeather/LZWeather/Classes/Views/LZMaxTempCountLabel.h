//
//  LZMaxTempCountLabel.h
//  LZWeather
//
//  Created by comst on 15/11/24.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZMaxTempCount.h"
@interface LZMaxTempCountLabel : UIView

@property (nonatomic, strong) NSNumber *fromVlaue;
@property (nonatomic, strong) NSNumber *toValue;
@property (nonatomic, strong) LZMaxTempCount *maxTempCount;

@property (nonatomic, strong) UILabel *maxTempLabel;

- (void)showDuration:(CGFloat)duration;

- (void)hideDuration:(CGFloat)duration;

@end

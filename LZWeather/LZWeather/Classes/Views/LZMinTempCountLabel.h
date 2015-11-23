//
//  LZMinTempCountLabel.h
//  LZWeather
//
//  Created by comst on 15/11/24.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZMinTempCount.h"
@interface LZMinTempCountLabel : UIView
@property (nonatomic, strong) NSNumber *fromVlaue;
@property (nonatomic, strong) NSNumber *toValue;
@property (nonatomic, strong) LZMinTempCount *minTempCount;

@property (nonatomic, strong) UILabel *minTempLabel;

- (void)showDuration:(CGFloat)duration;

- (void)hideDuration:(CGFloat)duration;

@end

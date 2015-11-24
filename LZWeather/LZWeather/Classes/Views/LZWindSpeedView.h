//
//  LZWindSpeedView.h
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZWindSpeedView : UIView
@property (nonatomic, strong) NSNumber *circlePerSecond;
@property (nonatomic, strong) NSNumber *windSpeed;

- (void)buildview;

- (void)show;

- (void)hide;

@end

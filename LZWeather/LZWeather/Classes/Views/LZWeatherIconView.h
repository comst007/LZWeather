//
//  LZWeatherIconView.h
//  LZWeather
//
//  Created by comst on 15/11/23.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZWeatherIconView : UIView
@property (nonatomic, strong) NSNumber *weatherCode;

- (void)builview;

- (void)show;

- (void)hide;

@end

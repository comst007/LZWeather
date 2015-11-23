//
//  LZTemperatureView.h
//  LZWeather
//
//  Created by comst on 15/11/23.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZTemperatureView : UIView

@property (nonatomic, strong) NSNumber *temperature;

- (void)buildView;

- (void)show;

- (void)hide;

@end

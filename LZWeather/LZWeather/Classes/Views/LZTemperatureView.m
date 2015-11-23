//
//  LZTemperatureView.m
//  LZWeather
//
//  Created by comst on 15/11/23.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZTemperatureView.h"
#import "LZTitleLabel.h"
#import "LZTemperatureCountLabel.h"
#import "LZRectsDuringAnimation.h"
#import "UIView+SetRect.h"
@interface LZTemperatureView ()

@property (nonatomic, strong) LZTemperatureCountLabel *temperatureLabel;
@property (nonatomic, strong) LZRectsDuringAnimation  *lableRects;
@property (nonatomic, strong) LZTitleLabel *temperatureTitle;


@end

@implementation LZTemperatureView

- (void)buildView{
    CGRect rect = CGRectMake(0, 0, 160, 140);
    self.temperatureLabel = [[LZTemperatureCountLabel alloc] initWithFrame:rect];
    [self addSubview:self.temperatureLabel];
    self.temperatureLabel.center = self.middlePoint;
    self.lableRects = [[LZRectsDuringAnimation alloc] init];
    self.lableRects.midRect = self.temperatureLabel.frame;
    self.temperatureLabel.x += 10;
    self.lableRects.startRect = self.temperatureLabel.frame;
    self.temperatureLabel.x -= 20;
    
    self.lableRects.endRect = self.temperatureLabel.frame;
    
    self.temperatureLabel.frame = self.lableRects.startRect;
    self.temperatureTitle = [LZTitleLabel titleLabelWithText:@"Temperature"];
    [self addSubview:self.temperatureTitle];
    
    
}

- (void)show{
    
    CGFloat duration = 1.75;
    self.temperatureLabel.toValue = self.temperature;
    self.temperatureLabel.fromVlaue = @(0);
    [self.temperatureLabel showDuration:duration];
    
    [self.temperatureTitle show];
    
    [UIView animateWithDuration:duration animations:^{
        
        self.temperatureLabel.frame = self.lableRects.midRect;
        
    }];
}

- (void)hide{
    
    CGFloat duration = 0.75;
    [self.temperatureLabel hideDuration:duration];
    [self.temperatureTitle hide];
    
    [UIView animateWithDuration:duration animations:^{
        self.temperatureLabel.frame = self.lableRects.endRect;
    } completion:^(BOOL finished) {
        self.temperatureLabel.frame = self.lableRects.startRect;
    }];
}
@end

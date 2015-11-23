//
//  LZWeatherIconView.m
//  LZWeather
//
//  Created by comst on 15/11/23.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZWeatherIconView.h"
#import "LZTitleLabel.h"
#import "UIView+LZGlowView.h"
#import "WeatherNumberMeaningTransform.h"
#import "LZCommon.h"
#import "AppColor.h"
#import "LZRectsDuringAnimation.h"
#import "LZFont.h"
#import "UIView+SetRect.h"
@interface LZWeatherIconView ()
@property (nonatomic, strong) LZTitleLabel *titleLabel;
@property (nonatomic, strong) UILabel *glowLabel;
@property (nonatomic, strong) LZRectsDuringAnimation *labelRects;
@end
@implementation LZWeatherIconView

- (void)builview{
    self.titleLabel = [LZTitleLabel titleLabelWithText:@"Weather"];
    [self addSubview:self.titleLabel];
    self.labelRects = [[LZRectsDuringAnimation alloc] init];
}

- (void)show{
    
    [self.titleLabel show];
    self.glowLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.glowLabel.textAlignment = NSTextAlignmentCenter;
    
    if (iPhone4_4s || iPhone5_5s) {
        self.glowLabel.font = [UIFont fontWithName:LZFontNameWeahterAndTime size:80];
        self.glowLabel.y = 10;
        self.glowLabel.x = 5;
    }else if (iPhone6 || iPhone6_plus){
        self.glowLabel.font = [UIFont fontWithName:LZFontNameWeahterAndTime size:110];
        self.glowLabel.y = 14;
        self.glowLabel.x = 8;
    }else{
        self.glowLabel.font = [UIFont fontWithName:LZFontNameWeahterAndTime size:80];
        self.glowLabel.y = 10;
        self.glowLabel.x = 5;
    }
    
    self.labelRects.midRect = self.glowLabel.frame;
    self.glowLabel.x -= 10;
    self.labelRects.startRect = self.glowLabel.frame;
    self.glowLabel.x += 20;
    self.labelRects.endRect = self.glowLabel.frame;
    self.glowLabel.frame = self.labelRects.startRect;
    
    self.glowInterval = @(1.75);
    self.glowOpacity = @(1.5);
    self.glowDuration = @(1);
    self.glowLabel.alpha = 1;
    self.glowLabel.text = [WeatherNumberMeaningTransform fontTextWeatherNumber:self.weatherCode];
    [self.glowLabel createGlowLayer:[WeatherNumberMeaningTransform iconColor:self.weatherCode] glowRadius:2];
    
    [self.glowLabel startGlow];
    self.glowLabel.alpha = 0;
    
    [self addSubview:self.glowLabel];
    
    [UIView animateWithDuration:1.75 animations:^{
        self.glowLabel.alpha = 1;
        self.glowLabel.frame = self.labelRects.midRect;
    }];
}



- (void)hide{
    [self.titleLabel hide];
    
    [UIView animateWithDuration:0.75 animations:^{
        self.glowLabel.alpha = 0;
        self.glowLabel.frame = self.labelRects.endRect;
    } completion:^(BOOL finished) {
        self.glowLabel.frame = self.labelRects.startRect;
        [self.glowLabel removeFromSuperview];
    }];
}
@end

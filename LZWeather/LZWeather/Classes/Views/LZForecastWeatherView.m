//
//  LZForecastWeatherView.m
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZForecastWeatherView.h"
#import "LZLineBakgroundView.h"
#import "UIView+SetRect.h"
#import "LZFont.h"
#import "LZCommon.h"
@interface LZForecastWeatherView ()
@property (nonatomic, strong) LZLineBakgroundView *backgroundView;

@property (nonatomic, strong) UIView *countryCodeBackgroundView;
@property (nonatomic, strong) UILabel *countryCodeLabel;
@property (nonatomic, strong) UILabel *forecastLabel;
@property (nonatomic, strong) UILabel *cityNameLabel;

@end
@implementation LZForecastWeatherView


- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.85];
        [self initViews];
    }
    return self;
}

- (void)initViews{
    self.backgroundView = [LZLineBakgroundView linebackgroundViewWithWith:4 lineGap:4 lineColor:[[UIColor blackColor] colorWithAlphaComponent:0.3] frame:self.bounds];
    [self addSubview:self.backgroundView];
    
}
- (void)buildview{
    self.countryCodeBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 37, 22)];
    self.countryCodeBackgroundView.backgroundColor = [UIColor redColor];
    [self addSubview:self.countryCodeBackgroundView];
    
    self.countryCodeLabel = [[UILabel alloc] initWithFrame:self.countryCodeBackgroundView.bounds];
    [self.countryCodeBackgroundView addSubview:self.countryCodeLabel];
    self.countryCodeLabel.textAlignment = NSTextAlignmentCenter;
    self.countryCodeLabel.font = [UIFont fontWithName:LZFontNameLight size:14];
    self.countryCodeLabel.textColor = [UIColor whiteColor];
    
    self.forecastLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.countryCodeBackgroundView.x + 50, self.countryCodeBackgroundView.y, 0, 0)];
    [self addSubview:self.forecastLabel];
    self.forecastLabel.text = @"Weather Forecast";
    self.forecastLabel.font = [UIFont fontWithName:LZFontNameLight size:16];
    self.forecastLabel.textColor = [UIColor blackColor];
    [self.forecastLabel sizeToFit];
    
    NSString *fontName = LZFontNameThin;
    CGFloat fontSize = 24;
    
    self.cityNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.countryCodeBackgroundView.x, self.countryCodeBackgroundView.y + 30, 0, 0)];
    
    if (iPhone6) {
        fontName = LZFontNameThin;
        fontSize = 40;
    }else if (iPhone6_plus){
        fontName = LZFontNameLight;
        fontSize = 47;
    }
    self.cityNameLabel.font = [UIFont fontWithName:fontName size:fontSize];
    [self.cityNameLabel sizeToFit];
    [self addSubview:self.cityNameLabel];
    
}

- (void)show{
    
}

- (void)hide{
    
}

- (void)setCityName:(NSString *)cityName{
    _cityName = cityName;
    self.cityNameLabel.text = cityName;
    [self.cityNameLabel sizeToFit];
}

- (void)setCountryCode:(NSString *)countryCode{
    _countryCode = countryCode;
    self.countryCodeLabel.text = countryCode;
}
@end

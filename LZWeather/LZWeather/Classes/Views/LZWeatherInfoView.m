//
//  LZWeatherInfoView.m
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//
#import "LZCommon.h"
#import "LZFont.h"
#import "LZWeatherInfoView.h"

#import "LZCityView.h"
#import "LZWeatherIconView.h"
#import "LZTemperatureView.h"
#import "LZHumidityView.h"
#import "LZSunInfoView.h"
#import "LZMaxAndMinTempView.h"
#import "LZWindSpeedView.h"
#import "LZVerticalSeperator.h"
#import "LZHorizontalSeperator.h"
#import "LZShowDownView.h"
#import "LZStringPathView.h"
#import "UIView+SetRect.h"
@interface LZWeatherInfoView ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) LZStringPathView *pathView;
@property (nonatomic, strong) LZCityView *cityView;
@property (nonatomic, strong) LZWeatherIconView *weatherIconView;
@property (nonatomic, strong) LZTemperatureView *temperatureView;
@property (nonatomic, strong) LZHumidityView *humidityView;
@property (nonatomic, strong) LZSunInfoView *sunInfoView;
@property (nonatomic, strong) LZMaxAndMinTempView *maxAndMinTemperatureView;
@property (nonatomic, strong) LZWindSpeedView *windSpeedView;
@property (nonatomic, strong) LZShowDownView *showDownView;


@property (nonatomic, strong) LZVerticalSeperator *verticalSperatorView;
@property (nonatomic, strong) LZHorizontalSeperator *horizontalseperatorView1;
@property (nonatomic, strong) LZHorizontalSeperator *horizontalseperatorView2;
@property (nonatomic, strong) LZHorizontalSeperator *horizontalseperatorView3;
@property (nonatomic, strong) LZHorizontalSeperator *horizontalseperatorView4;

@property (nonatomic, strong) UITableView *tableview;
@end

@implementation LZWeatherInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = 0;
    }
    return self;
}

- (void)buildview{
    self.tableview = [[UITableView alloc] initWithFrame:self.bounds];
    [self addSubview: self.tableview];
    
    self.tableview.backgroundColor = [UIColor clearColor];
    self.tableview.delegate = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if(iPhone4_4s){
        
        self.humidityView = [[LZHumidityView alloc] initWithFrame:CGRectMake(0, LZHeight - LZWidth * 0.5, LZHeight * 0.5, LZHeight * 0.5)];
        [self.humidityView buildview];
        [self.tableview addSubview:self.humidityView];
        
        self.sunInfoView = [[LZSunInfoView alloc] initWithFrame:CGRectMake(LZWidth * 0.5, LZHeight - LZWidth * 0.5, LZWidth * 0.5, LZWidth * 0.5)];
        [self.sunInfoView buildview];
        [self.tableview addSubview:self.sunInfoView];
        
        self.temperatureView = [[LZTemperatureView alloc] initWithFrame:CGRectMake(LZWidth * 0.5, LZHeight - LZWidth, LZWidth * 0.5, LZWidth * 0.5)];
        [self.temperatureView buildView];
        [self.tableview addSubview:self.temperatureView];
        
        self.weatherIconView = [[LZWeatherIconView alloc] initWithFrame:CGRectMake(0, LZHeight - LZWidth, LZWidth * 0.5, LZWidth * 0.5)];
        [self.weatherIconView builview];
        [self.tableview addSubview:self.weatherIconView];
        
    }else{
        self.humidityView = [[LZHumidityView alloc] initWithFrame:CGRectMake(0, LZHeight - LZWidth, LZWidth * 0.5, LZWidth * 0.5)];
        [self.humidityView buildview];
        [self.tableview addSubview:self.humidityView];
        
        self.sunInfoView = [[LZSunInfoView alloc] initWithFrame:CGRectMake(LZWidth * 0.5, LZHeight - LZWidth, LZWidth * 0.5, LZWidth * 0.5)];
        [self.sunInfoView buildview];
        [self.tableview addSubview:self.sunInfoView];
        
        self.maxAndMinTemperatureView = [[LZMaxAndMinTempView alloc] initWithFrame:CGRectMake(0, LZHeight - LZWidth * 0.5, LZWidth * 0.5, LZWidth * 0.5)];
        [self.maxAndMinTemperatureView buildview];
        [self.tableview addSubview:self.maxAndMinTemperatureView];
        
        self.windSpeedView = [[LZWindSpeedView alloc] initWithFrame:CGRectMake(LZWidth * 0.5, LZHeight - LZWidth * 0.5, LZWidth * 0.5, LZWidth * 0.5)];
        [self.windSpeedView buildview];
        [self.tableview addSubview:self.windSpeedView];
        
        self.weatherIconView = [[LZWeatherIconView alloc] initWithFrame:CGRectMake(0, LZHeight - 1.5 * LZWidth, LZWidth * 0.5, LZWidth * 0.5)];
        [self.weatherIconView builview];
        [self.tableview addSubview: self.weatherIconView];
        
        self.temperatureView = [[LZTemperatureView alloc]  initWithFrame:CGRectMake(LZWidth * 0.5, LZHeight - 1.5 * LZWidth, LZWidth * 0.5, LZWidth * 0.5)];
        [self.temperatureView buildView];
        [self.tableview addSubview:self.temperatureView];
    }
    
    self.horizontalseperatorView1 = [[LZHorizontalSeperator alloc] initWithFrame:CGRectMake(0, LZHeight - 1.5 * LZWidth, LZWidth, 0.5)];
    self.horizontalseperatorView1.alpha = 0.1;
    self.horizontalseperatorView1.backgroundColor = [UIColor blackColor];
    [self.tableview addSubview:self.horizontalseperatorView1];
    
    self.horizontalseperatorView2 = [[LZHorizontalSeperator alloc] initWithFrame:CGRectMake(0, LZHeight - 1 * LZWidth, LZWidth, 0.5)];
    self.horizontalseperatorView2.alpha = 0.1;
    self.horizontalseperatorView2.backgroundColor = [UIColor blackColor];
    [self.tableview addSubview:self.horizontalseperatorView2];
    
    self.horizontalseperatorView3 = [[LZHorizontalSeperator alloc] initWithFrame:CGRectMake(0, LZHeight - 0.5 * LZWidth, LZWidth, 0.5)];
    self.horizontalseperatorView3.alpha = 0.1;
    self.horizontalseperatorView3.backgroundColor = [UIColor blackColor];
    [self.tableview addSubview:self.horizontalseperatorView3];
    
    self.horizontalseperatorView4 = [[LZHorizontalSeperator alloc] initWithFrame:CGRectMake(0, LZHeight - 1, LZWidth, 0.5)];
    self.horizontalseperatorView4.alpha = 0.1;
    self.horizontalseperatorView4.backgroundColor = [UIColor blackColor];
    [self.tableview addSubview:self.horizontalseperatorView4];
    
    self.verticalSperatorView = [[LZVerticalSeperator alloc] initWithFrame:CGRectMake(LZWidth * 0.5 - 1, LZHeight - 1.5 * LZWidth, 0.5, 1.5 * LZWidth)];
    self.verticalSperatorView.alpha = 0.1;
    self.verticalSperatorView.backgroundColor = [UIColor blackColor];
    
    [self.tableview addSubview:self.verticalSperatorView];
    
    self.cityView = [[LZCityView alloc] initWithFrame:CGRectMake(0, 0, LZWidth, LZHeight - 1.5 * LZWidth)];
    [self.cityView builview];
    [self.tableview addSubview:self.cityView];
    
    self.showDownView = [[LZShowDownView alloc] initWithFrame:CGRectMake(0, 0, 30, 10)];
    self.showDownView.center = self.middlePoint;
    self.showDownView.y = LZHeight + 20;
    [self.tableview addSubview:self.showDownView];
    self.showDownView.layer.transform = CATransform3DRotate(self.showDownView.layer.transform, M_PI, 1, 0, 0);
    
    self.pathView = [[LZStringPathView alloc] initWithFrame:CGRectMake(0, -60, LZWidth, 60)];
    [self.tableview addSubview:self.pathView];
    self.pathView.text = @"Release To Refresh";
    self.pathView.textFont = [UIFont fontWithName:LZFontNameThin size:20];
    self.pathView.textWidth = 0.5;
    self.pathView.textColor = [UIColor redColor];
    [self.pathView buildView];
    

        
    
}

- (void)show{
    
    if (self.weatherInfo == nil) {
        return;
    }
    self.alpha = 1;
    self.humidityView.percent = @(self.weatherInfo.weatherMain.humidity.integerValue / 100.0);
    self.windSpeedView.windSpeed = self.weatherInfo.wind.speed;
    self.windSpeedView.circlePerSecond = @(self.windSpeedView.windSpeed.floatValue / 5);
    
    self.maxAndMinTemperatureView.maxTemp = @(self.weatherInfo.weatherMain.temp_max.floatValue - 273.15) ;
    self.maxAndMinTemperatureView.minTemp = @(self.weatherInfo.weatherMain.temp_min.floatValue - 273.15) ;
    
    //id temp = self.weatherInfo.weatherMain;
    self.sunInfoView.sunRiseSeconds = self.weatherInfo.sys.sunrise;
    self.sunInfoView.sunSetSeconds = self.weatherInfo.sys.sunset;
    
    self.temperatureView.temperature = @(self.weatherInfo.weatherMain.temp.floatValue - 273.15);
    
    self.cityView.cityName = self.weatherInfo.cityName;
    self.cityView.weatherDescription = self.weatherInfo.weather.desc;
    self.cityView.baseStation = self.weatherInfo.base;
    self.cityView.secondsSince1970 = self.weatherInfo.dt;
    self.cityView.weatherNumber = self.weatherInfo.weather.weatherID;
    
    self.weatherIconView.weatherCode = self.weatherInfo.weather.weatherID;
    
    [self.cityView show];
    [self.weatherIconView show];
    [self.temperatureView show];
    [self.humidityView show];
    [self.sunInfoView show];
    [self.maxAndMinTemperatureView show];
    [self.windSpeedView show];
    [self.horizontalseperatorView1 show];
    [self.horizontalseperatorView2 show];
    [self.horizontalseperatorView3 show];
    [self.horizontalseperatorView4 show];
    
    [self.verticalSperatorView show];
    
}

- (void)hide{
    self.alpha = 0;
    [self.cityView hide];
    [self.weatherIconView hide];
    [self.temperatureView hide];
    [self.humidityView hide];
    [self.sunInfoView hide];
    [self.maxAndMinTemperatureView hide];
    [self.windSpeedView hide];
    [self.horizontalseperatorView1 hide];
    [self.horizontalseperatorView2 hide];
    [self.horizontalseperatorView3 hide];
    [self.horizontalseperatorView4 hide];
    
    [self.verticalSperatorView hide];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat percent = scrollView.contentOffset.y / 60;
    [self.showDownView showPercent:percent];
    
    CGFloat offsetY = - scrollView.contentOffset.y;
    if (offsetY > 0) {
        percent = offsetY / 60;
        [self.pathView percentage:percent animated:NO];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (scrollView.contentOffset.y <= -60) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(weatherInfoViewDidPullDownRefresh:)]) {
            [self.delegate weatherInfoViewDidPullDownRefresh:self];
        }
    }
    if (scrollView.contentOffset.y >= 60) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(weatherInfoViewDidPullUpLoadForecast:)]) {
            [self.delegate weatherInfoViewDidPullUpLoadForecast:self];
        }
    }
}
@end

//
//  LZViewController.m
//  LZWeather
//
//  Created by comst on 15/11/28.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZViewController.h"
#import "LZCommon.h"
#import "LZFont.h"
#import "UIView+SetRect.h"

#import "LZWeatherInfo.h"
#import "LZForecastInfo.h"
#import "LZGlobal.h"


#import "LZLocationManager.h"
#import "LZWeatherInfoView.h"
#import "LZForecastController.h"
#import "LZUpdateView.h"
#import "LZFadeBlackView.h"
#import "LZLoadview.h"
#import "TWMessageBarManager.h"

#import "LZWeatherRequest.h"
#import "LZForecastRequest.h"
@interface LZViewController ()<LZLocationManagerProtocal>


@property (nonatomic, strong) LZLocationManager *locationManager;
@property (nonatomic, strong) LZWeatherInfoView *weatherInfoView;
@property (nonatomic, strong) LZWeatherRequest *weatherRequest;
@property (nonatomic, strong) LZForecastRequest *forecastRequest;
@property (nonatomic, strong) LZLoadview *loadWeatherView;
@property (nonatomic, strong) LZUpdateView *updateView;
@property (nonatomic, strong) LZFadeBlackView *fadeBlackView;


@end
@implementation LZViewController


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.locationManager = [[LZLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.weatherInfoView = [[LZWeatherInfoView alloc] initWithFrame:self.view.bounds];
    [self.weatherInfoView buildview];
    [self.view addSubview:self.weatherInfoView];
    
    
   
}
@end

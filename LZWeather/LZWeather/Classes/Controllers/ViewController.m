//
//  ViewController.m
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//
#import "LZGlobal.h"
#import "ViewController.h"
#import "LZWeatherRequest.h"
#import "LZForecastRequest.h"
#import "TWMessageBarManager.h"
#import "LZLabelView.h"
#import "LZLineBakgroundView.h"
#import "LZLongpressButton.h"
#import "LZLoadview.h"
#import "UIView+SetRect.h"
#import "LZStringPathView.h"
#import "LZFadeBlackView.h"
#import "LZSnowView.h"
#import "LZRainView.h"
#import "UIView+LZGlowView.h"
#import "LZUpdateView.h"
#import "LZCityView.h"
#import "LZCommon.h"
#import "UIView+LZTemperature.h"
#import "LZCircleView.h"
#import "LZTitleLabel.h"
#import "LZNumberCount.h"
#import "LZHumidityCountLabel.h"
#import "LZHumidityView.h"
#import "LZTemperatureView.h"
#import "LZWeatherIconView.h"
#import "LZMaxAndMinTempView.h"
#import "LZSunInfoView.h"
#import "LZWindSpeedView.h"
#import "LZWeatherInfoView.h"
#import "LZForecastController.h"
@interface ViewController ()<TWMessageBarStyleSheet, LZNumberCountProtocal>
@property (nonatomic, strong) LZWeatherRequest *weatherRequest;
@property (nonatomic, strong) LZForecastRequest *forecastRequest;
@property (nonatomic, strong) LZLabelView *labelview;
@property (nonatomic, strong) LZWeatherInfoView *weatherInfoView;
@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    LZWeatherInfoView *view = [[LZWeatherInfoView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:view];
//    [view buildview];
//    self.weatherInfoView = view;
    
    // Do any additional setup after loading the view, typically from a nib.
    
     __weak typeof(self) weakSelf = self;
    NSDictionary *weatherArgDic = @{
                             @"apiKey":@"8781e4ef1c73ff20a180d3d7a42a8c04",
                             @"latitude":@"22.673309",
                             @"longitude": @"114.034191"
                             };
    LZWeatherRequest *request = [[LZWeatherRequest alloc] init];
    [request weatherRequestWithArgDic:weatherArgDic completionHandler:^(LZWeatherRequest *request) {
//        
//        weakSelf.weatherInfoView.weatherInfo = [LZGlobal sharedGlobal].weatherInfo;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            [weakSelf.weatherInfoView show];
//            
//        });
    }];
    self.weatherRequest = request;
    
    NSDictionary *forecastArgDic = @{
                                     @"apiKey":@"8781e4ef1c73ff20a180d3d7a42a8c04",
                                     @"cnt":@14,
                                     @"id":@"1802620"
                                     };
    
    LZForecastRequest *forecastRequest = [[LZForecastRequest alloc] init];
    
    self.forecastRequest = forecastRequest;
    
    [forecastRequest forecastRequestWithArgDic:forecastArgDic completionHandler:^(LZForecastRequest *request) {
        NSLog(@"over");
    }];
     
    
     /*
    TWMessageBarManager *barManager = [[TWMessageBarManager alloc] init];
    [barManager showMessageWithTitle:@"can not get location" description:@"hello  world" type:TWMessageBarMessageTypeError duration:2];
     
    
    LZLineBakgroundView *backView = [LZLineBakgroundView linebackgroundViewWithWith:4 lineGap:4 lineColor:[UIColor blackColor] frame:self.view.frame];
    //backView.center = self.view.center;
    [self.view addSubview:backView];
    
    LZLongpressButton *pressButton = [[LZLongpressButton alloc] initWithFrame:CGRectMake(0, 0, self.view.width - 20, 50)];
    
    [self.view addSubview:pressButton];
    
    pressButton.center = self.view.center;
    
    
    LZLoadview *view = [[LZLoadview alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    [view show];
   
    UIView *glowview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    glowview.center = self.view.center;
    [self.view addSubview:glowview];
    glowview.backgroundColor = [UIColor yellowColor];
    
    [glowview createGlowLayer:[UIColor redColor] glowRadius:2];
    
    glowview.glowOpacity = @1;
    glowview.glowDuration = @10;
    glowview.glowInterval = @20;
    
    [glowview startGlow];
     */
    
    
}

- (UIColor *) backgroundColorForMessageType:(TWMessageBarMessageType)type{
    
    return [UIColor blackColor];
}

- (UIColor *)strokeColorForMessageType:(TWMessageBarMessageType)type{
    return [UIColor redColor];
}

- (UIImage *)iconImageForMessageType:(TWMessageBarMessageType)type{
    if (TWMessageBarMessageTypeError == type) {
        return [UIImage imageNamed:@"icon-error"];
    }else if (TWMessageBarMessageTypeInfo == type){
        return [UIImage imageNamed:@"icon-info"];
    }else{
        return [UIImage imageNamed:@"icon-success"];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    NSLog(@"touc");
    /*
    self.labelview = [LZLabelView labelWithText:@"长按刷新" origin:CGPointMake(100, 100)];
    [self.view addSubview:self.labelview];
     
    LZStringPathView *pathView = [[LZStringPathView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    pathView.center = self.view.center;
    [self.view addSubview:pathView];
    pathView.text = @"Hello World";
    [pathView buildView];
    [pathView percentage:1 animated:YES];
     
    LZFadeBlackView *view = [[LZFadeBlackView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:view];
    
    [view show];
     
    LZRainView *rainView = [[LZRainView alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.5, self.view.width * 0.5)];
    rainView.center = self.view.center;
    rainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:rainView];
    [rainView show];
     
    
    LZUpdateView *updateView = [[LZUpdateView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    updateView.center = self.view.center;
    updateView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:updateView];
    [updateView show];
     */
    
    
//    LZCityView *view = [[LZCityView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, LZHeight - 1.5 * LZWidth)];
//    [view builview];
//    view.weatherNumber = @(600);
//    [self.view addSubview:view];
//    [view show];
    
     
     
//    LZHumidityView *view = [[LZHumidityView alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.5, self.view.width * 0.5)];
//    [self.view addSubview:view];
//    
//    view.percent = @(0.73);
//    view.center = self.view.center;
//    [view buildview];
//    [view show];
    
     
     
//    LZTemperatureView *view = [[LZTemperatureView alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.5, self.view.width * 0.5)];
//    
//    [self.view addSubview:view];
//    
//    view.center = self.view.center;
//    
//    view.temperature = @(23);
//    [view buildView];
//    [view show];
    
//     
//    LZWeatherIconView *view = [[LZWeatherIconView alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.5, self.view.width * 0.5)];
//    [self.view addSubview:view];
//    view.center = self.view.center;
//    view.weatherCode = @(300);
//    [view builview];
//    [view show];
//     
    
//    LZMaxAndMinTempView *view = [[LZMaxAndMinTempView alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.5, self.view.width * 0.5)];
//    [self.view addSubview: view];
//    view.center = self.view.center;
//    
//    view.minTemp = @20;
//    view.maxTemp = @29;
//    [view buildview];
//    [view show];
    
    
//    LZSunInfoView *view = [[LZSunInfoView alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.5, self.view.width * 0.5)];
//    
//    [self.view addSubview: view];
//    view.center = self.view.center;
//    view.sunRiseSeconds = @(123456);
//    view.sunSetSeconds = @(45678899);
//    [view buildview];
//    [view show];
    
    
//    LZWindSpeedView *view = [[LZWindSpeedView alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.5, self.view.width * 0.5)];
//    [self.view addSubview:view];
//    
//    view.center = self.view.center;
//    view.windSpeed = @6;
//    view.circlePerSecond = @(1);
//    [view buildview];
//    [view show];
//    [view performSelector:@selector(hide) withObject:nil afterDelay:3];
    
    LZForecastController *forecastVC = [[LZForecastController alloc] init];
    forecastVC.forecastInfo = [LZGlobal sharedGlobal].forecastInfo;
    
    [self presentViewController:forecastVC animated:YES completion:nil];
    
}

- (void)numberCount:(LZNumberCount *)numberCount currentNumber:(NSNumber *)number{
    NSLog(@"----%@", number);
}
@end

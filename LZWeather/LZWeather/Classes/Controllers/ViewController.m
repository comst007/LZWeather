//
//  ViewController.m
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "ViewController.h"
#import "LZWeatherRequest.h"
#import "LZForecastRequest.h"
@interface ViewController ()
@property (nonatomic, strong) LZWeatherRequest *weatherRequest;
@property (nonatomic, strong) LZForecastRequest *forecastRequest;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    NSDictionary *weatherArgDic = @{
                             @"apiKey":@"8781e4ef1c73ff20a180d3d7a42a8c04",
                             @"latitude":@"22.673309",
                             @"longitude": @"114.034191"
                             };
    LZWeatherRequest *request = [[LZWeatherRequest alloc] init];
    [request weatherRequestWithArgDic:weatherArgDic completionHandler:^(LZWeatherRequest *request) {
        NSLog(@"over.....");
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
     */
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

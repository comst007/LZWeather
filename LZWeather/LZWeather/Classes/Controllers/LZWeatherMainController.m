//
//  LZWeatherMainController.m
//  LZWeather
//
//  Created by comst on 15/11/28.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//
#import "LZCommon.h"
#import "LZFont.h"
#import "UIView+SetRect.h"

#import "LZWeatherInfo.h"
#import "LZForecastInfo.h"
#import "LZGlobal.h"

#import "LZWeatherMainController.h"
#import "LZLocationManager.h"
#import "LZWeatherInfoView.h"
#import "LZForecastController.h"
#import "LZUpdateView.h"
#import "LZFadeBlackView.h"
#import "LZLoadview.h"
#import "TWMessageBarManager.h"

#import "LZWeatherRequest.h"
#import "LZForecastRequest.h"

@interface LZWeatherMainController ()<LZLocationManagerProtocal, LZLoadviewDelegate, LZWeatherInfoViewProtocal>

@property (nonatomic, strong) LZLocationManager *locationManager;
@property (nonatomic, strong) LZWeatherInfoView *weatherInfoView;
@property (nonatomic, strong) LZWeatherRequest *weatherRequest;
@property (nonatomic, strong) LZForecastRequest *forecastRequest;
@property (nonatomic, strong) LZLoadview *weatherLoadView;
@property (nonatomic, strong) LZUpdateView *updateView;
@property (nonatomic, strong) LZFadeBlackView *fadeBlackView;

@end

@implementation LZWeatherMainController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    
    
    

    
    self.weatherLoadView = [[LZLoadview alloc] initWithFrame:self.view.bounds];
    [self.weatherLoadView builview];
    
    [self.view addSubview:self.weatherLoadView];
    
    self.fadeBlackView = [[LZFadeBlackView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.fadeBlackView];

    self.updateView = [[LZUpdateView alloc] initWithFrame:CGRectZero];
    self.updateView.center = self.view.center;
    
    
    [self.view addSubview:self.updateView];
    
    
    self.weatherInfoView = [[LZWeatherInfoView alloc] initWithFrame:self.view.bounds];
    [self.weatherInfoView buildview];
    self.weatherInfoView.delegate = self;
    [self.view addSubview:self.weatherInfoView];
    
    
    [self.weatherLoadView show];
    
    self.weatherLoadView.delegate = self;
    
}

- (void)getLocation{
    
    if (self.locationManager == nil) {
        
        self.locationManager = [[LZLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    [self.weatherLoadView hide];
    [self.updateView show];
    [self.fadeBlackView show];
    [self.locationManager performSelector:@selector(start) withObject:nil afterDelay:3];
    
}


- (void)loadviewDidFinish:(LZLoadview *)loadview{
    
    [self getLocation];
}

- (void)manager:(LZLocationManager *)manager DidFailed:(NSError *)error{
    NSLog(@"error");
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.updateView hide];
        [self.fadeBlackView hide];
        [self.weatherLoadView show];
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"faile to locate" description: @"unable to get the location" type:TWMessageBarMessageTypeError callback:^{
        }];
        
    });
    
}

- (void)managerServiceClosed:(LZLocationManager *)manager{
    NSLog(@"close");
}

- (void)manager:(LZLocationManager *)manager DidUpdateLocation:(CLLocation *)location{
    
    NSLog(@"success");
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        [self.updateView hide];
        [self.fadeBlackView hide];
        [self.weatherLoadView hide];
        [self getWeatherData:location];
    });
}

- (void)getWeatherData:(CLLocation *)currentlocation{
    
    
    NSDictionary *weatherArgDic = @{
                                    @"apiKey":@"8781e4ef1c73ff20a180d3d7a42a8c04",
                                    @"latitude":[NSString stringWithFormat:@"%lf",currentlocation.coordinate.latitude],
                                    @"longitude": [NSString stringWithFormat:@"%lf",currentlocation.coordinate.longitude]
                                    };
     __weak typeof(self) weakSelf = self;
    [self.weatherRequest weatherRequestWithArgDic:weatherArgDic completionHandler:^(LZWeatherRequest *request) {
        
        
        NSDictionary *forecastArgDic = @{
                                         @"apiKey":@"8781e4ef1c73ff20a180d3d7a42a8c04",
                                         @"cnt":@14,
                                         @"id":[LZGlobal sharedGlobal].weatherInfo.cityID
                                         };
        [weakSelf.forecastRequest forecastRequestWithArgDic:forecastArgDic completionHandler:^(LZForecastRequest *request) {
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.weatherInfoView.weatherInfo = [LZGlobal sharedGlobal].weatherInfo;
                [weakSelf.weatherInfoView show];
                
                
            });
            
        }];
        
        
    }];
}



- (LZWeatherRequest *)weatherRequest{
    if (!_weatherRequest) {
        _weatherRequest = [[LZWeatherRequest alloc] init];
    }
    return _weatherRequest;
}

- (LZForecastRequest *)forecastRequest{
    if (!_forecastRequest) {
        _forecastRequest = [[LZForecastRequest alloc] init];
    }
    return _forecastRequest;
}



- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)weatherInfoViewDidPullUpLoadForecast:(LZWeatherInfoView *)infoView{
    LZForecastController *forecastVC = [[LZForecastController alloc] init];
    forecastVC.forecastInfo = [LZGlobal sharedGlobal].forecastInfo;
    [self presentViewController:forecastVC animated:YES completion:^{
        
    }];

}

- (void)weatherInfoViewDidPullDownRefresh:(LZWeatherInfoView *)infoView{
    
    [self.weatherInfoView hide];
    [self getLocation];
}
@end

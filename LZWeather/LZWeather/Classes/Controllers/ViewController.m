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
#import "TWMessageBarManager.h"
#import "LZLabelView.h"
#import "LZLineBakgroundView.h"
@interface ViewController ()<TWMessageBarStyleSheet>
@property (nonatomic, strong) LZWeatherRequest *weatherRequest;
@property (nonatomic, strong) LZForecastRequest *forecastRequest;
@property (nonatomic, strong) LZLabelView *labelview;
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
     
    
    TWMessageBarManager *barManager = [[TWMessageBarManager alloc] init];
    [barManager showMessageWithTitle:@"can not get location" description:@"hello  world" type:TWMessageBarMessageTypeError duration:2];
     */
    
    LZLineBakgroundView *backView = [LZLineBakgroundView linebackgroundViewWithWith:4 lineGap:4 lineColor:[UIColor redColor] frame:self.view.frame];
    //backView.center = self.view.center;
    [self.view addSubview:backView];
    
    
    
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

    self.labelview = [LZLabelView labelWithText:@"长按刷新" origin:CGPointMake(100, 100)];
    [self.view addSubview:self.labelview];
}

@end

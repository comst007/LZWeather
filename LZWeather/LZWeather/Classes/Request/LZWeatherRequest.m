//
//  LZWeatherRequest.m
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZWeatherRequest.h"
#import "LZWeatherInfo.h"
#import "LZGlobal.h"
static NSString*  appKey = @"8781e4ef1c73ff20a180d3d7a42a8c04";
@interface LZWeatherRequest ()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDataTask *weatherTask;


@end
@implementation LZWeatherRequest

/**
 *  http://api.openweathermap.org/data/2.5/weather?APPID=8781e4ef1c73ff20a180d3d7a42a8c04&lat=22.673309&lon=114.034191
 *
 *  @param argDic  <#argDic description#>
 *  @param handler <#handler description#>
 */
- (void)weatherRequestWithArgDic:(NSDictionary *)argDic completionHandler:(weatherCompletionHandler)handler{
    
    [self cancel];
    
    self.session = [NSURLSession sharedSession];
    
    NSString *url = @"http://api.openweathermap.org/data/2.5/weather";
    url = [NSString stringWithFormat:@"%@?APPID=%@&lat=%@&lon=%@",url, argDic[@"apiKey"], argDic[@"latitude"], argDic[@"longitude"]];
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *weatherURL = [NSURL URLWithString:url];
    
     __weak typeof(self) weakSelf = self;
    self.weatherTask = [self.session dataTaskWithURL:weatherURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        weakSelf.error = error;
        
        if (error == nil && [(NSHTTPURLResponse *)response statusCode] == 200) {
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            LZWeatherInfo *weatherinfo = [[LZWeatherInfo alloc] initWithDic:jsonDic];
            
            [LZGlobal sharedGlobal].weatherInfo = weatherinfo;
            
        }
        
        handler(weakSelf);
    }];
    
    [self.weatherTask resume];
    
}


- (void)cancel{
    
    [self.weatherTask cancel];
    self.session = nil;
    self.weatherTask = nil;
    
}

@end

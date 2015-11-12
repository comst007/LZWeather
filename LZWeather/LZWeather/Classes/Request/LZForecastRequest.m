//
//  LZForecastRequest.m
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZForecastRequest.h"
#import "LZGlobal.h"
@interface LZForecastRequest ()

@property (nonatomic, strong) NSURLSession *session;

@property (nonatomic, strong) NSURLSessionDataTask *forecastTask;

@end

@implementation LZForecastRequest



/**
 *http://api.openweathermap.org/data/2.5/forecast/daily?APPID=8781e4ef1c73ff20a180d3d7a42a8c04&cnt=14&id=1802620
 *
 *  @param argDic  <#argDic description#>
 *  @param handler <#handler description#>
 */
- (void)forecastRequestWithArgDic:(NSDictionary *)argDic completionHandler:(forecastRequestCompletionHandler)handler{
    
    [self cancel];
    
    self.session = [NSURLSession sharedSession];
    
    NSString *url = @"http://api.openweathermap.org/data/2.5/forecast/daily";
    url = [NSString stringWithFormat:@"%@?APPID=%@&cnt=%@&id=%@",url, argDic[@"apiKey"], argDic[@"cnt"], argDic[@"id"]];
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *weatherURL = [NSURL URLWithString:url];
     __weak typeof(self) weakSelf = self;
    self.forecastTask = [self.session dataTaskWithURL:weatherURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        weakSelf.error = error;
        
        if (error == nil && [(NSHTTPURLResponse *)response statusCode] == 200) {
            
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            LZForecastInfo *forecastInfo = [[LZForecastInfo alloc] init];
            
            [forecastInfo setValuesForKeysWithDictionary:jsonDic];
            [LZGlobal sharedGlobal].forecastInfo = forecastInfo;
            
            NSLog(@"request  over");
            
        }
        handler(weakSelf);
    }];
    
    [self.forecastTask resume];
    
}

- (void)cancel{
    
    [self.forecastTask cancel];
    self.session = nil;
    self.forecastTask = nil;
    
}
@end

//
//  LZLocationManager.m
//  LZWeather
//
//  Created by comst on 15/11/28.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZLocationManager.h"

@interface LZLocationManager ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *manager;
@end

@implementation LZLocationManager

- (void)start{
    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;
    self.manager.desiredAccuracy = kCLLocationAccuracyBest;
    self.manager.distanceFilter = 5;
    
    if ([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.manager requestWhenInUseAuthorization];
    }
    [self.manager startUpdatingLocation];
    
}



- (CLAuthorizationStatus)authorizationSatus{
    
    return [CLLocationManager authorizationStatus];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation *location = [locations lastObject];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(manager:DidUpdateLocation:)]) {
        [self.delegate manager:self DidUpdateLocation:location];
    }
    [self.manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
        [manager startUpdatingLocation];
    }else{
        if (self.delegate && [self.delegate respondsToSelector:@selector(manager:DidFailed:)]) {
            [self.delegate manager:self DidFailed:[NSError errorWithDomain:@"LZLocation" code:1 userInfo:@{@"reason":@"denied"}]];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(manager:DidFailed:)]) {
        [self.delegate manager:self DidFailed:nil];
    }
}
@end

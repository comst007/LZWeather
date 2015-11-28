//
//  LZLocationManager.h
//  LZWeather
//
//  Created by comst on 15/11/28.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@class LZLocationManager;

@protocol LZLocationManagerProtocal <NSObject>

- (void)manager:(LZLocationManager *)manager DidUpdateLocation:(CLLocation *)location;

- (void)manager:(LZLocationManager *)manager DidFailed:(NSError *)error;

- (void)managerServiceClosed:(LZLocationManager *)manager;


@end

@interface LZLocationManager : NSObject

@property (nonatomic, weak) id<LZLocationManagerProtocal>  delegate;

@property (nonatomic, assign) CLAuthorizationStatus authorizationSatus;


- (void)start;

@end

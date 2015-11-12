//
//  LZListItem.h
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZTemp.h"
#import "LZWeather.h"

@interface LZListItem : NSObject
@property (nonatomic, strong) NSNumber *dt;
@property (nonatomic, strong) NSNumber *rain;
@property (nonatomic, strong) LZTemp *temp;
@property (nonatomic, strong) NSNumber *deg;
@property (nonatomic, strong) LZWeather *weather;
@property (nonatomic, strong) NSNumber *humidity;
@property (nonatomic, strong) NSNumber *pressure;
@property (nonatomic, strong) NSNumber *clouds;
@property (nonatomic, strong) NSNumber *speed;


@end

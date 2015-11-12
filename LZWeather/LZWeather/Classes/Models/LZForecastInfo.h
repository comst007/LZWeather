//
//  LZForecastInfo.h
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZCity.h"
#import "LZListItem.h"
@interface LZForecastInfo : NSObject

@property (nonatomic, strong) LZCity *city;
@property (nonatomic, copy) NSString *cod;
@property (nonatomic, strong) NSNumber *cnt;
@property (nonatomic, strong) NSNumber *message;
@property (nonatomic, strong) NSArray *list;

@end

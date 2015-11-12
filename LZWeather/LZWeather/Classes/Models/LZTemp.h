//
//  LZTemp.h
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZTemp : NSObject
@property (nonatomic, strong) NSNumber *min;
@property (nonatomic, strong) NSNumber *max;
@property (nonatomic, strong) NSNumber *eve;
@property (nonatomic, strong) NSNumber *night;
@property (nonatomic, strong) NSNumber *day;
@property (nonatomic, strong) NSNumber *morn;

@end

//
//  LZCity.h
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZCoord.h"
@interface LZCity : NSObject
@property (nonatomic, copy) NSString *country;
@property (nonatomic, strong) LZCoord *coord;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *cityID;

@end

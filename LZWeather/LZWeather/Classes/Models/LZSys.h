//
//  LZSys.h
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZSys : NSObject
@property (nonatomic, copy) NSString *country;
@property (nonatomic, strong) NSNumber *sunrise;
@property (nonatomic, strong) NSNumber *sunset;
@property (nonatomic, strong) NSNumber *sysID;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end

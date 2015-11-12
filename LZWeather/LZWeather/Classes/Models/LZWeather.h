//
//  LZWeather.h
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZWeather : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *main;
@property (nonatomic, copy) NSNumber *weatherID;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end

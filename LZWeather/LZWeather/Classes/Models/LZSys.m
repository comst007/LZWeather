//
//  LZSys.m
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZSys.h"

@implementation LZSys

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.sysID = value;
        return;
    }
    if ([key isEqualToString:@"message"]) {
        return;
    }
    
}
@end

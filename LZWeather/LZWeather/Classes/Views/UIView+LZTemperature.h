//
//  UIView+LZTemperature.h
//  LZWeather
//
//  Created by comst on 15/11/21.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppColor.h"
@interface UIView (LZTemperature)


+ (UILabel *)labelWithTemperature:(NSString *)temperatureText tag:(NSInteger)tag;
@end

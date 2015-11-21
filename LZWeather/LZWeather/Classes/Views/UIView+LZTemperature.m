//
//  UIView+LZTemperature.m
//  LZWeather
//
//  Created by comst on 15/11/21.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "UIView+LZTemperature.h"
#import "LZFont.h"
@implementation UIView (LZTemperature)

+ (UILabel *)labelWithTemperature:(NSString *)temperatureText tag:(NSInteger)tag{
    UILabel *temperatureLabel;
    temperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 45, 100)];
    temperatureLabel.text = temperatureText;
    temperatureLabel.tag = tag;
    temperatureLabel.textAlignment = NSTextAlignmentCenter;
    temperatureLabel.textColor = COLOR_PURE_;
    temperatureLabel.font = [UIFont fontWithName:LZFontNameThin size:75];
    
    return temperatureLabel;
}
@end

//
//  LZHumidityCount.m
//  LZWeather
//
//  Created by comst on 15/11/22.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZHumidityCount.h"
#import "NSString+RichText.h"
#import "LZFont.h"
#import "AppColor.h"
@implementation LZHumidityCount

- (void)startAnimation{
    
    self.countAnimation.fromValue = self.fromeValue;
    self.countAnimation.toValue = self.toValue;
    self.countAnimation.duration = [self.duration floatValue];
    self.countAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.69 :0.11 :0.32 :0.88];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberCount:currentString:)]) {
        self.countAnimation.property = [POPMutableAnimatableProperty propertyWithName:@"countAnimation" initializer:^(POPMutableAnimatableProperty *prop) {
            prop.writeBlock = ^(id obj, const CGFloat values[]){
                NSNumber *number = @(values[0]);
                NSAttributedString *res = [self attributeStringWithnumber:number];
                [self.delegate numberCount:self currentString:res];
            };
        }];
        
        [self pop_addAnimation:self.countAnimation forKey:nil];
    }
}

- (NSAttributedString *)attributeStringWithnumber:(NSNumber *)number{
    
    NSInteger count = [number integerValue];
    NSString *countString = [NSString stringWithFormat:@"%02li", count];
    NSString *totalString = [NSString stringWithFormat:@"%@%%", countString];
    
    UIFont *font1 = [UIFont fontWithName:LZFontNameLight size:40];
    UIFont *font2 = [UIFont fontWithName:LZFontNameLight size:19];
    
    NSRange countRange = [countString rangeFrom:totalString];
    NSRange  totalRange = [totalString range];
    
    return [totalString createAttributedStringAndConfig:@[
                                                          [ConfigAttributedString font:font2 range:totalRange],
                                                          [ConfigAttributedString font:font1 range:countRange],
                                                          [ConfigAttributedString foregroundColor:COLOR_PURE_ range:totalRange],
                                                          [ConfigAttributedString foregroundColor:COLOR_CIRCLE_ range:countRange]
                                                          ]];
}
@end

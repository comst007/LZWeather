//
//  LZTemperatureCount.m
//  LZWeather
//
//  Created by comst on 15/11/23.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZTemperatureCount.h"
#import "NSString+RichText.h"
#import "LZCommon.h"
#import "AppColor.h"
#import "LZFont.h"
#import "POP.h"
@implementation LZTemperatureCount
- (void)startAnimation{
    
    CGFloat fromeValue = [self.fromeValue floatValue];
    CGFloat toValue    = [self.toValue floatValue];
    CGFloat duration   = (self.duration <= 0 ? 1.f : [self.duration floatValue]);
    
    // 设定动画
    self.countAnimation.fromValue      = @(fromeValue);
    self.countAnimation.toValue        = @(toValue);
    self.countAnimation.timingFunction = \
    [CAMediaTimingFunction functionWithControlPoints:0.69 :0.11 :0.32 :0.88];
    self.countAnimation.duration       = duration;
    
    // 只有执行了代理才会执行计数引擎
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberCount:currentString:)]) {
        /* 将计算出来的值通过writeBlock动态给控件设定 */
        self.countAnimation.property = \
        [POPMutableAnimatableProperty propertyWithName:@"conutAnimation"
                                           initializer:^(POPMutableAnimatableProperty *prop) {
                                               prop.writeBlock      = ^(id obj, const CGFloat values[]) {
                                                   NSNumber *number = @(values[0]);
                                                   
                                                   NSAttributedString *ats = [self attributeStringWithNumber:number];
                                                   [self.delegate numberCount:self currentString:ats];
                                               };
                                           }];
        
        // 添加动画
        [self pop_addAnimation:self.countAnimation forKey:nil];
    }

}

- (NSAttributedString *)attributeStringWithNumber:(NSNumber *)number{
    
    NSInteger count = [number integerValue];
    NSString *countString = [NSString stringWithFormat:@"%li", count];
    NSString *duString = @"°";
    NSString *totalString = [NSString stringWithFormat:@"%@%@", countString, duString];
    
    UIFont *totalFont = nil;
    UIFont *duFont = nil;
    if (iPhone4_4s || iPhone5_5s) {
        totalFont = [UIFont fontWithName:LZFontNameThin size:75];
        duFont = [UIFont fontWithName:LZFontNameThin size:75];
        
    }else if (iPhone6){
        
        totalFont = [UIFont fontWithName:LZFontNameThin size:90];
        duFont = [UIFont fontWithName:LZFontNameThin size:90];
        
    }else if (iPhone6_plus){
        totalFont = [UIFont fontWithName:LZFontNameThin size:95];
        duFont = [UIFont fontWithName:LZFontNameThin size:95];
    }else{
        
        totalFont = [UIFont fontWithName:LZFontNameThin size:75];
        duFont = [UIFont fontWithName:LZFontNameThin size:75];
        
    }
    NSRange totalRange = [totalString range];
    NSRange countRange = [countString rangeFrom:totalString];
    NSRange duRange = [duString rangeFrom:totalString];
    
    return [totalString createAttributedStringAndConfig:@[
                                                          [ConfigAttributedString font:totalFont range:totalRange],
                                                          [ConfigAttributedString font:duFont range:duRange],
                                                          [ConfigAttributedString foregroundColor:COLOR_PURE_ range:totalRange]
                                                          ]];
}
@end

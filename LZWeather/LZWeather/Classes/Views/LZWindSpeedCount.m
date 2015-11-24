//
//  LZWindSpeedCount.m
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZWindSpeedCount.h"
#import "AppColor.h"
@interface LZWindSpeedCount ()

@end

@implementation LZWindSpeedCount


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
    
    CGFloat count = [number floatValue];
    NSString *countString = [NSString stringWithFormat:@"%.2f", count];
    NSString *totalString = [NSString stringWithFormat:@"%@ mps", countString];
    
    UIFont *totalFont = [UIFont fontWithName:LZFontNameBold size:8];
    UIFont *countFont = [UIFont fontWithName:LZFontNameRegular size:12];
    
    
    NSRange totalRange = [totalString range];
    NSRange countRange = [countString rangeFrom:totalString];
    
    
    return [totalString createAttributedStringAndConfig:@[
                                                          [ConfigAttributedString font:totalFont range:totalRange],
                                                          [ConfigAttributedString font:countFont range:countRange],
                                                          [ConfigAttributedString foregroundColor:COLOR_CIRCLE_ range:totalRange],
                                                          [ConfigAttributedString foregroundColor:[UIColor blackColor] range:countRange]
                                                          
                                                          ]];
}


@end

//
//  LZNumberCount.m
//  LZWeather
//
//  Created by comst on 15/11/22.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZNumberCount.h"

@implementation LZNumberCount

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        self.countAnimation = [POPBasicAnimation animation];
        
    }
    
    return self;
}

- (void)startAnimation{
    
    self.countAnimation.fromValue = self.fromeValue;
    self.countAnimation.toValue = self.toValue;
    self.countAnimation.duration = [self.duration floatValue];
    
    self.countAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.69 :0.11 :0.32 :0.88];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberCount:currentNumber:)]) {
        
        self.countAnimation.property = [POPMutableAnimatableProperty propertyWithName:@"countAnimation" initializer:^(POPMutableAnimatableProperty *prop) {
            prop.writeBlock = ^(id obj, const CGFloat values[]){
              
                NSNumber *number = @(values[0]);
                
                [self.delegate numberCount:self currentNumber:number];
                
            };
        }];
        
        [self pop_addAnimation:self.countAnimation forKey:nil];
    }
}
@end

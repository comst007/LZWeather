//
//  LZTemperatureCountLabel.m
//  LZWeather
//
//  Created by comst on 15/11/23.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZTemperatureCountLabel.h"

@interface LZTemperatureCountLabel ()<LZNumberCountProtocal>

@end

@implementation LZTemperatureCountLabel

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.temperatureLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.temperatureLabel.textAlignment = NSTextAlignmentCenter;
        self.temperatureLabel.alpha = 0;
        self.temperatureLabel.numberOfLines = 0;
        [self addSubview:self.temperatureLabel];
        
        self.temperatureCount = [[LZTemperatureCount alloc] init];
        self.temperatureCount.delegate = self;
    }
    
    return self;
}

- (void)numberCount:(LZNumberCount *)numberCount currentString:(NSAttributedString *)string{
    
    self.temperatureLabel.attributedText = string;
    
}

- (void)showDuration:(CGFloat)duration{
    
    self.temperatureCount.fromeValue = self.fromVlaue;
    self.temperatureCount.toValue = self.toValue;
    self.temperatureCount.duration = @(duration);
    
    [self.temperatureCount startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.temperatureLabel.alpha = 1;
    }];
    
}

- (void)hideDuration:(CGFloat)duration{
    
    self.temperatureCount.fromeValue = self.toValue;
    self.temperatureCount.toValue = @(0);
    self.temperatureCount.duration = @(duration);
    [self.temperatureCount startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.temperatureLabel.alpha = 0;
    }];
    
}

@end

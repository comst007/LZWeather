//
//  LZHumidityCountLabel.m
//  LZWeather
//
//  Created by comst on 15/11/22.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZHumidityCountLabel.h"

@interface LZHumidityCountLabel ()<LZNumberCountProtocal>

@end

@implementation LZHumidityCountLabel

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.countLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:self.countLabel];
        self.countLabel.alpha = 0;
        
        self.humidityCont = [[LZHumidityCount alloc] init];
        self.humidityCont.delegate = self;
        
    }
    
    return self;
}

- (void)numberCount:(LZNumberCount *)numberCount currentString:(NSAttributedString *)string{
    
    self.countLabel.attributedText = string;
    
}

- (void)showDuration:(CGFloat)duration{
    self.humidityCont.fromeValue = self.fromValue;
    self.humidityCont.toValue = self.toValue;
    self.humidityCont.duration = @(duration);
    self.countLabel.transform = CGAffineTransformMake(1.5, 0, 0, 1.5, 0, 0);
    
    [self.humidityCont startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.countLabel.alpha = 1;
        self.countLabel.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
    }];
    
}

- (void)hideDuration:(CGFloat)duration{
    
    self.humidityCont.fromeValue = self.toValue;
    self.humidityCont.toValue = @(0);
    self.humidityCont.duration = @(duration);
    
    [self.humidityCont startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.countLabel.alpha = 0;
        self.countLabel.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0); 
    }];
}
@end

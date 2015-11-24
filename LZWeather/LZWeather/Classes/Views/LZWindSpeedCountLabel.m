//
//  LZWindSpeedCountLabel.m
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZWindSpeedCountLabel.h"

@interface LZWindSpeedCountLabel ()<LZNumberCountProtocal>

@end
@implementation LZWindSpeedCountLabel


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.windSpeedLable = [[UILabel alloc] initWithFrame:self.bounds];
        self.windSpeedLable.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.windSpeedLable];
        self.windSpeedLable.alpha = 0;
        
        self.speedCount = [[LZWindSpeedCount alloc] init];
        self.speedCount.delegate = self;
    }
    return self;
}

- (void)numberCount:(LZNumberCount *)numberCount currentString:(NSAttributedString *)string{
    
    self.windSpeedLable.attributedText = string;
    
}

- (void)showDuration:(CGFloat)duration{
    self.speedCount.fromeValue = self.fromVlaue;
    self.speedCount.toValue = self.toValue;
    self.speedCount.duration = @(duration);
    
    [self.speedCount startAnimation];
    [UIView animateWithDuration:duration animations:^{
        self.windSpeedLable.alpha = 1;
    }];
    
}

- (void)hideDuration:(CGFloat)duration{
    
    self.speedCount.fromeValue = self.toValue;
    self.speedCount.toValue = @(0);
    self.speedCount.duration = @(duration);
    
    [self.speedCount startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.windSpeedLable.alpha = 0;
    }];
}

@end

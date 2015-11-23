//
//  LZMinTempCountLabel.m
//  LZWeather
//
//  Created by comst on 15/11/24.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZMinTempCountLabel.h"

@interface LZMinTempCountLabel ()<LZNumberCountProtocal>

@end
@implementation LZMinTempCountLabel


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.minTempLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.minTempLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.minTempLabel];
        self.minTempLabel.alpha = 0;
        
        self.minTempCount = [[LZMinTempCount alloc] init];
        self.minTempCount.delegate = self;
    }
    return self;
}

- (void)numberCount:(LZNumberCount *)numberCount currentString:(NSAttributedString *)string{
    
    self.minTempLabel.attributedText = string;
    
}

- (void)showDuration:(CGFloat)duration{
    self.minTempCount.fromeValue = self.fromVlaue;
    self.minTempCount.toValue = self.toValue;
    self.minTempCount.duration = @(duration);
    
    [self.minTempCount startAnimation];
    [UIView animateWithDuration:duration animations:^{
        self.minTempLabel.alpha = 1;
    }];
    
}

- (void)hideDuration:(CGFloat)duration{
    
    self.minTempCount.fromeValue = self.toValue;
    self.minTempCount.toValue = @(0);
    self.minTempCount.duration = @(duration);
    
    [self.minTempCount startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.minTempLabel.alpha = 0;
    }];
}
@end

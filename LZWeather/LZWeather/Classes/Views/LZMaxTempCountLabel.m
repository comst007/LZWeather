//
//  LZMaxTempCountLabel.m
//  LZWeather
//
//  Created by comst on 15/11/24.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZMaxTempCountLabel.h"

@interface LZMaxTempCountLabel ()<LZNumberCountProtocal>

@end
@implementation LZMaxTempCountLabel

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.maxTempLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.maxTempLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.maxTempLabel];
        self.maxTempLabel.alpha = 0;
        
        self.maxTempCount = [[LZMaxTempCount alloc] init];
        self.maxTempCount.delegate = self;
    }
    return self;
}

- (void)numberCount:(LZNumberCount *)numberCount currentString:(NSAttributedString *)string{
    
    self.maxTempLabel.attributedText = string;
    
}

- (void)showDuration:(CGFloat)duration{
    self.maxTempCount.fromeValue = self.fromVlaue;
    self.maxTempCount.toValue = self.toValue;
    self.maxTempCount.duration = @(duration);
    
    [self.maxTempCount startAnimation];
    [UIView animateWithDuration:duration animations:^{
        self.maxTempLabel.alpha = 1;
    }];
    
}

- (void)hideDuration:(CGFloat)duration{
    
    self.maxTempCount.fromeValue = self.toValue;
    self.maxTempCount.toValue = @(0);
    self.maxTempCount.duration = @(duration);
    
    [self.maxTempCount startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.maxTempLabel.alpha = 0;
    }];
}
@end

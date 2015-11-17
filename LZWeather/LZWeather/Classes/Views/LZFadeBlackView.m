//
//  LZFadeBlackView.m
//  LZWeather
//
//  Created by comst on 15/11/16.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZFadeBlackView.h"

@implementation LZFadeBlackView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0;
    }
    
    return self;
}

- (void)show{
    [UIView animateWithDuration:1.0 animations:^{
        self.alpha = 0.75;
    }];
}

- (void)hide{
    [UIView animateWithDuration:0.6 animations:^{
        self.alpha = 0.0;
    }];
}
@end

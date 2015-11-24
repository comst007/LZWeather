//
//  LZSun.m
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZSun.h"
#import "UIView+SetRect.h"

@implementation LZSun

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initRects];
        
    }
    
    return self;
}

- (void)initRects{
    
    CGFloat width = self.width;
    CGFloat height = self.height * 0.5;
    self.upRect = CGRectMake(0, 0, width, height);
    self.downRect = CGRectMake(0, height, width, height);
    
}

- (void)showWithDuration:(CGFloat)duration{
    
}

- (void)hideWithDuration:(CGFloat)duration{
    
}
@end

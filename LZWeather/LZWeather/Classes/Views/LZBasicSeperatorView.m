//
//  LZBasicSeperatorView.m
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZBasicSeperatorView.h"
#import "UIView+SetRect.h"
@implementation LZBasicSeperatorView
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.maxAlpha = 0.1;
        self.showDuration = 1.75;
        self.hideDuration = 0.75;
        self.alpha = 0;
        self.rects = [[LZRectsDuringAnimation alloc] init];
        
    }

    return self;
}
@end

//
//  LZHorizontalSeperator.m
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZHorizontalSeperator.h"

@implementation LZHorizontalSeperator
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat x = frame.origin.x;
        CGFloat y = frame.origin.y;
        CGFloat w = frame.size.width;
        CGFloat h = frame.size.height;
        self.rects.midRect = CGRectMake(x, y, w, h);
        self.rects.startRect = CGRectMake(x, y, 0, h);
        self.rects.endRect = CGRectMake(x + w, y, 0, h);
        self.frame = self.rects.startRect;
    }
    return self;
}

- (void)show{
    [UIView animateWithDuration:self.showDuration animations:^{
        self.alpha = self.maxAlpha;
        self.frame = self.rects.midRect;
    }];
}

- (void)hide{
    [UIView animateWithDuration:self.hideDuration animations:^{
        self.alpha = 0;
        self.frame = self.rects.endRect;
    } completion:^(BOOL finished) {
        self.frame = self.rects.startRect;
    }];
}
@end

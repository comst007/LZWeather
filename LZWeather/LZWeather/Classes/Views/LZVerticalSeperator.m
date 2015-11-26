//
//  LZVerticalSeperator.m
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZVerticalSeperator.h"

@implementation LZVerticalSeperator
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat x = frame.origin.x;
        CGFloat y = frame.origin.y;
        CGFloat w = frame.size.width;
        CGFloat h = frame.size.height;
        self.rects.midRect = CGRectMake(x, y, w, h);
        self.rects.startRect = CGRectMake(x, y, w, 0);
        self.rects.endRect = CGRectMake(x, y + h, w, 0);
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

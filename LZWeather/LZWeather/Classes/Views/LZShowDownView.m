//
//  LZShowDownView.m
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZShowDownView.h"
#import "LZPathDirectionView.h"

@interface LZShowDownView ()
@property (nonatomic, strong) LZPathDirectionView *leftPathView;
@property (nonatomic, strong) LZPathDirectionView *rightPathView;

@end
@implementation LZShowDownView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width * 0.5;
        CGFloat height = frame.size.height;
        CGRect leftRect = CGRectMake(0, 0, width, height);
        CGRect rightRect = CGRectMake(width, 0, width, height);
        
        self.leftPathView = [[LZPathDirectionView alloc] initWithFrame:leftRect];
        self.rightPathView = [[LZPathDirectionView alloc] initWithFrame:rightRect];
        [self addSubview:self.leftPathView];
        [self addSubview:self.rightPathView];
        self.rightPathView.startPointAtRight = YES;
    }
    
    return self;
}

- (void)showPercent:(CGFloat)percent{
    [self.leftPathView showPercent:percent];
    [self.rightPathView showPercent:percent];
}

@end

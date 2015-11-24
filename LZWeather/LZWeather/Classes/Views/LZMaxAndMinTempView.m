//
//  LZManAndMinTempView.m
//  LZWeather
//
//  Created by comst on 15/11/24.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZMaxAndMinTempView.h"
#import "LZGridView.h"
#import "LZMaxTempCountLabel.h"
#import "LZMinTempCountLabel.h"
#import "LZRectsDuringAnimation.h"
#import "LZTitleLabel.h"
#import "LZCommon.h"
#import "UIView+SetRect.h"
@interface LZMaxAndMinTempView ()

@property (nonatomic, strong) LZGridView *gridView;
@property (nonatomic, strong) UIView *centerlineView;
@property (nonatomic, strong) LZRectsDuringAnimation *centerlineViewRects;

@property (nonatomic, strong) UIView *minTempView;
@property (nonatomic, strong) LZRectsDuringAnimation *minTempViewRect;

@property (nonatomic, strong) UIView *maxTempView;
@property (nonatomic, strong) LZRectsDuringAnimation *maxTempViewRect;

@property (nonatomic, strong) UIView *maxCountView;
@property (nonatomic, strong) LZRectsDuringAnimation *maxCountViewRect;

@property (nonatomic, strong) UIView *minCountView;
@property (nonatomic, strong) LZRectsDuringAnimation *minCountViewRect;

@property (nonatomic, strong) LZMaxTempCountLabel *maxTempLabel;
@property (nonatomic, strong) LZMinTempCountLabel *minTempLabel;

@property (nonatomic, strong) LZTitleLabel *titleLabel;

@end
@implementation LZMaxAndMinTempView


- (void)buildview{
    
    CGFloat gridOffsetX = 12;
    CGFloat gridOffsetY = 13;
    
    self.gridView = [[LZGridView alloc] initWithFrame:CGRectZero];
    self.gridView.alpha = 0;
    
    if (iPhone4_4s || iPhone5_5s) {
        gridOffsetX = 30;
        gridOffsetY = 45;
        self.gridView.origin = CGPointMake(gridOffsetX, gridOffsetY);
        self.gridView.gridLength = 23;
    }else if (iPhone6){
        
        gridOffsetX = 30;
        gridOffsetY = 50;
        self.gridView.origin = CGPointMake(gridOffsetX, gridOffsetY);
        self.gridView.gridLength = 26;
    }else if (iPhone6_plus){
        
        gridOffsetX = 30;
        gridOffsetY = 50;
        self.gridView.origin = CGPointMake(gridOffsetX, gridOffsetY);
        self.gridView.gridLength = 30;
    }else{
        self.gridView.origin = CGPointMake(gridOffsetX, gridOffsetY);
        self.gridView.gridLength = 23;
    }
    
    [self.gridView buildview];
    [self addSubview:self.gridView];
    
    self.centerlineView = [[UIView alloc] initWithFrame:CGRectMake(0, 2 * self.gridView.gridLength, self.gridView.gridLength * 5, 1)];
    [self addSubview:self.centerlineView];
    self.centerlineView.backgroundColor = [UIColor blackColor];
    self.centerlineView.x += gridOffsetX;
    self.centerlineView.y += gridOffsetY;
    
    self.centerlineViewRects = [[LZRectsDuringAnimation alloc] init];
    self.centerlineViewRects.midRect = self.centerlineView.frame;
    
    self.centerlineView.width = 0;
    self.centerlineViewRects.startRect = self.centerlineView.frame;
    self.centerlineView.x = 5 * self.gridView.gridLength;
    self.centerlineViewRects.endRect = self.centerlineView.frame;
    
    self.centerlineView.frame = self.centerlineViewRects.startRect;
    self.centerlineView.alpha = 0;
    
    
    self.minTempViewRect = [[LZRectsDuringAnimation alloc] init];
    self.minTempView = [[UIView alloc] initWithFrame:CGRectMake(self.gridView.gridLength, 2 * self.gridView.gridLength, self.gridView.gridLength, 0)];
    
    [self addSubview: self.minTempView];
    
    self.minTempView.x += gridOffsetX;
    self.minTempView.y += gridOffsetY;
    self.minTempView.backgroundColor = [UIColor blackColor];
    self.minTempView.alpha = 0;
    self.minTempViewRect.startRect = self.minTempView.frame;
    
    self.minCountViewRect = [[LZRectsDuringAnimation alloc] init];
    self.minCountView = [[UIView alloc] initWithFrame:CGRectMake(self.gridView.gridLength, 2 * self.gridView.gridLength, self.gridView.gridLength, self.gridView.gridLength)];
    [self addSubview:self.minCountView];
    self.minCountView.alpha = 0;
    self.minCountView.x += gridOffsetX;
    self.minCountView.y += gridOffsetY;
    self.minCountViewRect.startRect = self.minCountView.frame;
    
    self.maxTempViewRect = [[LZRectsDuringAnimation alloc] init];
    self.maxTempView = [[UIView alloc] initWithFrame:CGRectMake(3 * self.gridView.gridLength, 2 * self.gridView.gridLength, self.gridView.gridLength, 0)];
    [self addSubview:self.maxTempView];
    self.maxTempView.alpha = 0;
    self.maxTempView.x += gridOffsetX;
    self.maxTempView.y += gridOffsetY;
    self.maxTempView.backgroundColor = [UIColor blackColor];
    self.maxTempViewRect.startRect = self.maxTempView.frame;
    
    self.maxCountViewRect = [[LZRectsDuringAnimation alloc] init];
    self.maxCountView = [[UIView alloc] initWithFrame:CGRectMake(self.gridView.gridLength * 3, self.gridView.gridLength * 2, self.gridView.gridLength, self.gridView.gridLength)];
    
    [self addSubview:self.maxCountView];
    self.maxCountView.alpha = 0;
    self.maxCountView.x += gridOffsetX;
    self.maxCountView.y += gridOffsetY;
    self.maxCountViewRect.startRect = self.maxCountView.frame;
    
    self.maxTempLabel = [[LZMaxTempCountLabel alloc] initWithFrame:CGRectMake(0, 0, 60, self.gridView.gridLength)];
    [self.maxCountView addSubview:self.maxTempLabel];
    
    self.minTempLabel = [[LZMinTempCountLabel alloc] initWithFrame:CGRectMake(0, 0, 60, self.gridView.gridLength)];
    
    [self.minCountView addSubview:self.minTempLabel];
    
    
    self.titleLabel = [LZTitleLabel titleLabelWithText:@"Min/Max Temp"];
    [self.titleLabel buildView];
    [self addSubview:self.titleLabel];

    
}

- (void)show{
    
    CGFloat duration = 1.75;
    
    [self.titleLabel show];
    
    [self.gridView showDuration:duration];
    
    if ([self.minTemp floatValue] >= 0) {
        self.minCountView.y -= self.gridView.gridLength;
    }
    if ([self.maxTemp floatValue] >= 0) {
        self.maxCountView.y -= self.gridView.gridLength;
    }
    
    self.maxTempLabel.toValue = self.maxTemp;
    self.maxTempLabel.fromVlaue = @(0);
    [self.maxTempLabel showDuration:duration];
    
    self.minTempLabel.fromVlaue = @(0);
    self.minTempLabel.toValue = self.minTemp;
    [self.minTempLabel showDuration:duration];
    
    [UIView animateWithDuration:duration animations:^{
        self.centerlineView.frame = self.centerlineViewRects.midRect;
        self.centerlineView.alpha = 1;
        
        self.minTempView.height = [self.minTemp floatValue];
        self.minTempView.y -= [self.minTemp floatValue];
        self.minTempView.alpha = 1;
        self.minCountView.y -= [self.minTemp floatValue];
        self.minCountView.alpha = 1;
        
        self.maxTempView.height = [self.maxTemp floatValue];
        self.maxTempView.y -= [self.maxTemp floatValue];
        self.maxTempView.alpha = 1;
        self.maxCountView.y -= [self.maxTemp floatValue];
        self.maxCountView.alpha = 1;

        
    }];
}

- (void)hide{
    
    CGFloat duration = 0.75;
    [self.gridView hideDuration:duration];
    [UIView animateWithDuration:duration animations:^{
        self.centerlineView.alpha = 0;
        self.minTempView.frame = self.minTempViewRect.startRect;
        self.minTempView.alpha = 0;
        
        self.maxTempView.frame = self.maxTempViewRect.startRect;
        self.maxTempView.alpha = 0;
        
        self.minCountView.x += 10;
        self.minCountView.alpha = 0;
        
        self.maxCountView.x += 10;
        self.maxCountView.alpha = 0;
        
        
    } completion:^(BOOL finished) {
        
        self.centerlineView.frame = self.centerlineViewRects.startRect;
        self.minCountView.frame = self.minCountViewRect.startRect;
        self.maxCountView.frame  = self.maxCountViewRect.startRect;
    }];
}
@end

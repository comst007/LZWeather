//
//  LZWindSpeedView.m
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZWindSpeedView.h"
#import "LZThreeLineView.h"
#import "LZRectsDuringAnimation.h"
#import "LZTitleLabel.h"
#import "UIView+SetRect.h"
#import "LZWindSpeedCountLabel.h"
#import "LZCommon.h"
@interface LZWindSpeedView ()

@property (nonatomic, strong) LZThreeLineView *threeLineView;

@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) LZRectsDuringAnimation *lineRects;

@property (nonatomic, strong) UIView *circleView;

@property (nonatomic, strong) LZTitleLabel *titleLabel;

@property (nonatomic, strong) LZWindSpeedCountLabel *windSpeedLabel;
@property (nonatomic, strong) LZRectsDuringAnimation *windSpeedRects;

@end
@implementation LZWindSpeedView

- (void)buildview{
    CGFloat windOffsetX = 40;
    CGFloat windOffsetY = 40;
    CGFloat windWidth  = 60;
    CGFloat windHeight = 60;
    
    if (iPhone6) {
        windOffsetY = 50;
        windWidth = 65;
        windHeight = 65;
    }else if (iPhone6_plus){
        windOffsetY = 55;
        windWidth = 70;
        windHeight = 70;
    }
    self.threeLineView = [[LZThreeLineView alloc] initWithFrame:CGRectMake(windOffsetX, windOffsetY, windWidth, windHeight)];
    [self addSubview:self.threeLineView];
    
    self.titleLabel = [LZTitleLabel titleLabelWithText:@"Wind Speed"];
    [self.titleLabel buildView];
    [self addSubview:self.titleLabel];
    
    if (iPhone4_4s || iPhone5_5s) {
        self.windSpeedLabel = [[LZWindSpeedCountLabel alloc] initWithFrame:CGRectMake(45, 120, 93, 15)];
    } else if (iPhone6) {
        self.windSpeedLabel = [[LZWindSpeedCountLabel alloc] initWithFrame:CGRectMake(45, 143, 93, 15)];
    } else if (iPhone6_plus) {
        self.windSpeedLabel = [[LZWindSpeedCountLabel alloc] initWithFrame:CGRectMake(45, 155, 93, 15)];
    } else {
        self.windSpeedLabel = [[LZWindSpeedCountLabel alloc] initWithFrame:CGRectMake(15, 90, 93, 15)];
    }
    [self addSubview:self.windSpeedLabel];
    self.windSpeedRects = [[LZRectsDuringAnimation alloc] init];
    self.windSpeedRects.midRect = self.windSpeedLabel.frame;
    self.windSpeedLabel.x += 10;
    self.windSpeedRects.startRect = self.windSpeedLabel.frame;
    
    self.windSpeedLabel.x -= 10;
    self.windSpeedLabel.y -= 10;
    self.windSpeedRects.endRect = self.windSpeedLabel.frame;
    
    self.windSpeedLabel.frame = self.windSpeedRects.startRect;
    self.windSpeedLabel.alpha = 0;
    
    if (iPhone4_4s || iPhone5_5s) {
        self.line         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2.f, 60.f)];
    } else if (iPhone6) {
        self.line         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2.f, 70.f)];
    } else if (iPhone6_plus) {
        self.line         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2.f, 75.f)];
    } else {
        self.line         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2.f, 60.f)];
    }
    
    [self addSubview:self.line];
    self.line.centerX = self.threeLineView.middleX;
    self.line.y = windHeight * 0.5;
    self.line.x += windOffsetX;
    self.line.y += windOffsetY;
    self.line.backgroundColor = [UIColor blackColor];
    
    CGFloat gapFromCenter = 3;
    self.lineRects = [[LZRectsDuringAnimation alloc] init];
    self.lineRects.startRect = CGRectMake(self.line.x, self.line.y + self.line.height + gapFromCenter * 2, self.line.width, 0);
    self.lineRects.midRect = CGRectMake(self.line.x, self.line.y + gapFromCenter, self.line.width, self.line.height);
    self.lineRects.endRect = CGRectMake(self.line.x, self.line.y, self.line.width, 0);
    
    self.line.frame = self.lineRects.startRect;
    
    self.circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 4)];
    self.circleView.layer.cornerRadius = 2;
    self.circleView.layer.masksToBounds = YES;
    
    self.circleView.alpha = 0;
    [self addSubview:self.circleView];
    self.circleView.center = self.threeLineView.middlePoint;
    self.circleView.x += windOffsetX;
    self.circleView.y += windOffsetY;
    self.circleView.backgroundColor = [UIColor blackColor];
    

    
}

- (void)show{
    CGFloat duration = 1.75;
    
    [self.threeLineView.layer removeAllAnimations];
    [self.threeLineView showWithDuration:duration animated:YES];
    self.threeLineView.circlesPerSecond = self.circlePerSecond;
    [self.threeLineView rotateWhithCirclePerSecond];
    
    self.windSpeedLabel.fromVlaue = @0;
    self.windSpeedLabel.toValue = self.windSpeed;
    [self.windSpeedLabel showDuration:duration];
    
    [self.titleLabel show];
    
    [UIView animateWithDuration:duration animations:^{
        self.line.alpha = 1;
        self.line.frame = self.lineRects.midRect;
        
        self.circleView.alpha = 1;
        
        self.windSpeedLabel.frame = self.windSpeedRects.midRect;
        self.windSpeedLabel.alpha = 1;
    }];
}

- (void)hide{
    CGFloat duration = 0.75;
    
    [self.threeLineView hideWithDuration:duration animated:YES];
    [self.titleLabel hide];
    
    [self.windSpeedLabel hideDuration:duration];
    
    [UIView animateWithDuration:duration animations:^{
        self.line.alpha = 0;
        self.line.frame = self.lineRects.endRect;
        
        self.circleView.alpha = 0;
        
        self.windSpeedLabel.frame = self.windSpeedRects.endRect;
        self.windSpeedLabel.alpha = 0;

        
    } completion:^(BOOL finished) {
        self.line.frame = self.lineRects.startRect;
        self.windSpeedLabel.frame = self.windSpeedRects.startRect;
    }];
}
@end

//
//  LZHumidityView.m
//  LZWeather
//
//  Created by comst on 15/11/23.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZHumidityView.h"
#import "LZHumidityCountLabel.h"
#import "LZCircleView.h"
#import "LZRotateAngleView.h"
#import "LZTitleLabel.h"
#import "LZRectsDuringAnimation.h"
#import "LZCommon.h"
#import "AppColor.h"
#import "UIView+SetRect.h"
@interface LZHumidityView ()

@property (nonatomic, strong) LZCircleView *fullCircle;
@property (nonatomic, strong) LZCircleView *showCircle;
@property (nonatomic, strong) LZRotateAngleView *rotateView;
@property (nonatomic, strong) LZHumidityCountLabel *countLabel;
@property (nonatomic, strong) LZTitleLabel *humidityLabel;
@end

@implementation LZHumidityView

- (void)buildview{
    
    CGRect circleRect = CGRectZero;
    CGRect rotateRect = CGRectZero;
    
    if (iPhone4_4s || iPhone5_5s) {
        circleRect = CGRectMake(0, 0, 100, 100);
        rotateRect = CGRectMake(37, 40, circleRect.size.width, circleRect.size.height);
        
    }else if (iPhone6){
        circleRect = CGRectMake(0, 0, 110, 110);
        rotateRect = CGRectMake(40, 50, circleRect.size.width, circleRect.size.height);
    }else if (iPhone6_plus){
        circleRect = CGRectMake(0, 0, 115, 115);
        rotateRect = CGRectMake(25, 15, circleRect.size.width, circleRect.size.height);
    }else{
        circleRect = CGRectMake(0, 0, 90, 90);
        rotateRect = CGRectMake(25, 15, circleRect.size.width, circleRect.size.height);
    }
    self.humidityLabel = [LZTitleLabel titleLabelWithText:@"Humidity"];
    [self addSubview:self.humidityLabel];
    self.fullCircle = [LZCircleView defaultCircleView:circleRect];
    self.fullCircle.lineColor = COLOR_CIRCLE_;
    [self.fullCircle buildview];
    
    self.showCircle = [LZCircleView defaultCircleView:circleRect];
    [self.showCircle buildview];
    
    self.rotateView = [[LZRotateAngleView alloc] initWithFrame:rotateRect];
    [self.rotateView addSubview:self.fullCircle];
    [self.rotateView addSubview:self.showCircle];
    
    [self addSubview:self.rotateView];
    
    self.countLabel = [[LZHumidityCountLabel alloc] initWithFrame:rotateRect];
    self.countLabel.backgroundColor = [UIColor clearColor];
    self.countLabel.x += 34;
    [self addSubview:self.countLabel];
    
}

- (void)show{
    CGFloat circlefullPercent = 0.75;
    CGFloat duration = 1.5;
    
    [self.fullCircle strokeEnd:0 animated:NO duration:0];
    [self.showCircle strokeEnd:0 animated:NO duration:0];
    [self.fullCircle strokeStart:0 animated:NO duration:0];
    [self.showCircle strokeStart:0 animated:NO duration:0];
    [self.rotateView rotateAngle:0 animated:NO duration:0];
    
    [self.humidityLabel show];
    
    [self.fullCircle strokeEnd:circlefullPercent animated:YES duration:duration];
    [self.showCircle strokeEnd:circlefullPercent * [self.percent floatValue] animated:YES duration:duration];
    
    [self.rotateView rotateAngle:45 animated:YES duration:duration];
    self.countLabel.toValue = @([self.percent floatValue] * 100);
    self.countLabel.fromValue = @(0);
    [self.countLabel showDuration:duration];
}

- (void)hide{
    
    CGFloat duration = 0.75;
    CGFloat circlefullPercent = 0.75;
    
    [self.humidityLabel hide];
    
    [self.fullCircle strokeStart:circlefullPercent animated:YES duration:duration];
    [self.showCircle strokeStart:circlefullPercent * [self.percent floatValue] animated:YES duration:duration];
    [self.rotateView rotateAngle:90 animated:YES duration:duration];
    [self.countLabel hideDuration:duration];
    
}
@end

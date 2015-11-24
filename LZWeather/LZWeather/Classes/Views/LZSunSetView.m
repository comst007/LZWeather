//
//  LZSunSetView.m
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZSunSetView.h"
#import "LZRectsDuringAnimation.h"
#import "UIView+SetRect.h"
#import "AppColor.h"
@interface LZSunSetView ()

@property (nonatomic, strong) UIView *upview;
@property (nonatomic, strong) UIView *downView;
@property (nonatomic, strong) UIImageView *sunImageview;
@property (nonatomic, strong) LZRectsDuringAnimation *sunRects;

@property (nonatomic, strong) UIImageView *moonImageview;
@property (nonatomic, strong) LZRectsDuringAnimation *moonRect;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation LZSunSetView


- (void)buildview{
    
    self.upview = [[UIView alloc] initWithFrame:self.upRect];
    self.upview.layer.masksToBounds = YES;
    [self addSubview:self.upview];
    
    self.downView = [[UIView alloc]  initWithFrame:self.downRect];
    self.downView.layer.masksToBounds = YES;
    [self addSubview:self.downView];
    
    self.sunImageview = [[UIImageView alloc] initWithFrame:self.upRect];
    [self.upview addSubview:self.sunImageview];
    self.sunImageview.image = [UIImage imageNamed:@"sun"];
    self.sunImageview.alpha = 0;
    
    self.sunRects = [[LZRectsDuringAnimation alloc] init];
    self.sunRects.startRect = self.sunImageview.frame;
    
    self.sunImageview.y += self.sunImageview.height;
    self.sunRects.midRect = self.sunImageview.frame;
    
    self.sunImageview.y += 10;
    self.sunRects.endRect = self.sunImageview.frame;
    
    self.sunImageview.frame = self.sunRects.startRect;
    
    self.moonImageview = [[UIImageView alloc] initWithFrame:self.upRect];
    [self.downView addSubview:self.moonImageview];
    self.moonImageview.image = [UIImage imageNamed:@"moon"];
    self.moonImageview.alpha = 0;
    
    self.moonRect = [[LZRectsDuringAnimation alloc] init];
    self.moonRect.midRect = self.moonImageview.frame;
    
    self.moonImageview.y -= self.moonImageview.height;
    self.moonRect.startRect = self.moonImageview.frame;
    
    self.moonImageview.y += 10 + self.moonImageview.height;
    self.moonRect.endRect = self.moonImageview.frame;
    
    self.moonImageview.frame = self.moonRect.startRect;
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height * 0.5, self.width, 1)];
    [self addSubview:self.lineView];
    self.lineView.backgroundColor = COLOR_CIRCLE_;
    self.lineView.alpha = 0;
    
}

- (void)showWithDuration:(CGFloat)duration{
    [UIView animateWithDuration:duration animations:^{
        self.sunImageview.alpha = 1;
        self.sunImageview.frame = self.sunRects.midRect;
        self.moonImageview.alpha = 1;
        self.moonImageview.frame = self.moonRect.midRect;
        
        self.lineView.alpha = 1;
    }];

}

- (void)hideWithDuration:(CGFloat)duration{
    [UIView animateWithDuration:duration animations:^{
        self.sunImageview.alpha = 0;
        self.sunImageview.frame = self.sunRects.endRect;
        
        self.moonImageview.alpha = 0;
        self.moonImageview.frame = self.moonRect.endRect;
        
        self.lineView.alpha = 0;
        self.downView.layer.masksToBounds = YES;
        
    } completion:^(BOOL finished) {
        
        self.sunImageview.frame =self.sunRects.startRect;
        self.moonImageview.frame = self.moonRect.startRect;
        self.downView.layer.masksToBounds = YES;
    }];
}
@end

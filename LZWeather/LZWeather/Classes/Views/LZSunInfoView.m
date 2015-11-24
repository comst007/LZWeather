//
//  LZSunInfoView.m
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZSunInfoView.h"
#import "LZSunRiseView.h"
#import "LZSunSetView.h"
#import "LZRectsDuringAnimation.h"
#import "LZTitleLabel.h"
#import "LZCommon.h"
#import "LZFont.h"
#import "UIView+SetRect.h"
@interface LZSunInfoView ()

@property (nonatomic, copy) NSString *sunRiseString;
@property (nonatomic, copy) NSString *sunSetString;

@property (nonatomic, strong) LZTitleLabel *titleLabel;

@property (nonatomic, strong) LZSunRiseView *sunRiseView;
@property (nonatomic, strong) UILabel *sunRiseLabel;
@property (nonatomic, strong) LZRectsDuringAnimation *riseRects;

@property (nonatomic, strong) LZSunSetView *sunSetView;
@property (nonatomic, strong) UILabel *sunSetLabel;
@property (nonatomic, strong) LZRectsDuringAnimation *setRects;


@end
@implementation LZSunInfoView


- (void)buildview{
    
    self.titleLabel = [LZTitleLabel titleLabelWithText:@"Sunrise/Sunset"];
    [self.titleLabel buildView];
    
    [self addSubview:self.titleLabel];
    
    if (iPhone4_4s || iPhone5_5s) {
        self.sunRiseView = [[LZSunRiseView alloc] initWithFrame:CGRectMake(45, 50, 40, 80)];
        self.sunSetView = [[LZSunSetView alloc] initWithFrame:CGRectMake(95, 40, 40, 80)];
        self.sunRiseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 40, 20)];
        self.sunSetLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 40, 20)];
    }else{
        
        self.sunRiseView = [[LZSunRiseView alloc] initWithFrame:CGRectMake(50, 55, 50, 100)];
        self.sunSetView = [[LZSunSetView alloc] initWithFrame:CGRectMake(110, 60, 50, 100)];
        self.sunRiseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 50, 25)];
        self.sunSetLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 50, 25)];
    }
    
    [self.sunRiseView buidview];
    [self.sunSetView buildview];
    [self addSubview:self.sunRiseView];
    [self addSubview:self.sunSetView];
    
    [self.sunRiseView addSubview:self.sunRiseLabel];
    [self.sunSetView addSubview:self.sunSetLabel];
    
    self.sunSetLabel.alpha = 0;
    self.sunRiseLabel.alpha = 0;
    
    self.sunRiseLabel.textAlignment = NSTextAlignmentCenter;
    self.sunSetLabel.textAlignment = NSTextAlignmentCenter;
    
    self.sunRiseLabel.font = [UIFont fontWithName:LZFontNameBold size:10];
    self.sunSetLabel.font = [UIFont fontWithName:LZFontNameBold size:10];
    
    self.setRects = [[LZRectsDuringAnimation alloc] init];
    self.setRects.midRect = self.sunSetView.frame;
    
    self.sunSetView.y -= 10;
    
    self.setRects.startRect = self.sunSetView.frame;
    
    self.sunSetView.y += 20;
    self.setRects.endRect = self.sunSetView.frame;
    
    self.sunSetView.frame = self.setRects.startRect;
    
    self.riseRects = [[LZRectsDuringAnimation alloc] init];
    self.riseRects.midRect = self.sunRiseView.frame;
    
    self.sunRiseView.y += 10;
    self.riseRects.startRect = self.sunRiseView.frame;
    self.sunRiseView.y -= 20;
    
    self.riseRects.endRect = self.sunRiseView.frame;
    
    self.sunRiseView.frame = self.riseRects.startRect;
    
}

- (void)show{
    CGFloat duration = 1.75;
    
    [self.titleLabel show];
    [self.sunRiseView showWithDuration:1.5];
    [self.sunSetView showWithDuration:1.5];
    
    [UIView animateWithDuration:duration animations:^{
        
        self.sunSetView.frame = self.riseRects.midRect;
        self.sunSetView.frame = self.setRects.midRect;
        
        self.sunRiseLabel.alpha = 1;
        self.sunRiseLabel.text = self.sunRiseString;
        
        self.sunSetLabel.alpha = 1;
        self.sunSetLabel.text = self.sunSetString;
        
    }];
}

- (void)hide{
    
    CGFloat duration = 0.75;
    [self.titleLabel hide];
    
    [self.sunRiseView hideWithDuration:duration];
    [self.sunSetView hideWithDuration:duration];
    
    [UIView animateWithDuration:duration animations:^{
        
        self.sunRiseView.frame =  self.riseRects.endRect;
        self.sunSetView.frame = self.setRects.endRect;
        
        self.sunRiseLabel.alpha = 0;
        self.sunSetLabel.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        self.sunRiseView.frame = self.riseRects.startRect;
        self.sunSetView.frame = self.setRects.startRect;
        
    }];
    
    
}


- (void)setSunSetSeconds:(NSNumber *)sunSetSeconds{
    
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:[sunSetSeconds integerValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH : mm";
    
    self.sunSetString = [formatter stringFromDate:date];
    
}

- (void)setSunRiseSeconds:(NSNumber *)sunRiseSeconds{
    
    
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:[sunRiseSeconds integerValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH : mm";
    
    self.sunRiseString = [formatter stringFromDate:date];
    
}
@end

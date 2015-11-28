//
//  LZUpdateView.m
//  LZWeather
//
//  Created by comst on 15/11/18.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZUpdateView.h"
#import "LZRectsDuringAnimation.h"
#import "LZCommon.h"
#import "LZFont.h"
#define LabelHeight 20

@interface LZUpdateView ()
@property (nonatomic, strong) UILabel *updatingLabel;
@property (nonatomic, strong) UILabel *failLabel;
@property (nonatomic, strong) LZSnowView *snowView;
@property (nonatomic, strong) LZRectsDuringAnimation *updatingRect;
@property (nonatomic, strong) LZRectsDuringAnimation *failRect;


@end
@implementation LZUpdateView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(0, 0, LZWidth * 0.5 , LZWidth * 0.5 + LabelHeight)];
    
    if (self) {
        self.alpha = 0;
        //self.backgroundColor = [UIColor blackColor];
        self.userInteractionEnabled = NO;
        [self initLabel];
        [self initSnowview];
    }
    return self;
}

- (void)initLabel{
    
    self.updatingLabel = [self glowLabel:@"Updating..."];
    
    self.updatingRect = [[LZRectsDuringAnimation alloc] init];
    self.updatingRect.midRect = self.updatingLabel.frame;
    self.updatingLabel.x -= 30;
    self.updatingRect.startRect = self.updatingLabel.frame;
    self.updatingLabel.x += 60;
    self.updatingRect.endRect = self.updatingLabel.frame;
    self.updatingLabel.frame = self.updatingRect.startRect;
    
    self.failLabel = [self glowLabel:@"failed..."];
    
    self.failRect = [[LZRectsDuringAnimation alloc] init];
    self.failRect.midRect = self.failLabel.frame;
    self.failLabel.x -= 30;
    self.failRect.startRect = self.failLabel.frame;
    self.failLabel.x += 60;
    self.failRect.endRect = self.failLabel.frame;
    self.failLabel.frame = self.failRect.startRect;

    
    
}

- (UILabel *)glowLabel:(NSString *)text{
    
    UILabel *label;
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, LZWidth * 0.5, LZWidth * 0.5, LabelHeight)];
    [self addSubview:label];
    label.text = text;
    label.font = [UIFont fontWithName:LZFontNameLight size:18];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [label createGlowLayer:[UIColor yellowColor] glowRadius:2.0];
    [label startGlow];
    label.alpha = 0;
    return label;
    
}

- (void)initSnowview{
    
    self.snowView = [[LZSnowView alloc] initWithFrame:CGRectMake(0, 0, LZWidth * 0.5, LZWidth * 0.5)];
    [self addSubview:self.snowView];
    self.snowView.alpha = 0;
    [self.snowView show];
    
}

- (void)show{
    
    [UIView animateWithDuration:1.0 animations:^{
        self.alpha = 0.75;
        self.snowView.alpha = 0.75;
       
        self.updatingLabel.frame = self.updatingRect.midRect;
        self.updatingLabel.alpha = 0.75;
        
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showFailed{
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 1;
        self.updatingLabel.frame = self.updatingRect.endRect;
        self.updatingLabel.alpha = 0;
        
    } completion:^(BOOL finished) {
        self.failLabel.frame = self.failRect.midRect;
        self.failLabel.alpha = 1;
        self.updatingLabel.frame = self.updatingRect.startRect;
    }];
}

- (void)hide{
    
    [UIView animateWithDuration:0.75 animations:^{
        self.snowView.alpha = 0;
        self.alpha = 0;
        self.updatingLabel.frame = self.updatingRect.endRect;
        self.updatingLabel.alpha = 0;
        
        self.failLabel.alpha = 0;
        self.failLabel.frame = self.failRect.endRect;
        
    } completion:^(BOOL finished) {
        
        self.updatingLabel.frame = self.updatingRect.startRect;
        self.failLabel.frame = self.failRect.startRect;
    }];
}

@end

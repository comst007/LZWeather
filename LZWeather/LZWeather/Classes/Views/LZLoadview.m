//
//  LZLoadview.m
//  LZWeather
//
//  Created by comst on 15/11/16.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZLoadview.h"
#import "LZLineBakgroundView.h"
#import "LZLongpressButton.h"
#import "LZRectsDuringAnimation.h"
#import "LZFont.h"
#define animationTime 1
@interface LZLoadview ()<LZLongpressbuttonDelegate>

@property (nonatomic, strong) UIImageView *iconview;
@property (nonatomic, strong) LZRectsDuringAnimation *imageviewRects;
@property (nonatomic, strong) LZLineBakgroundView *backview;
@property (nonatomic, strong) LZLongpressButton *pressbutton;
@property (nonatomic, strong) LZRectsDuringAnimation *pressButtonRects;

@end

@implementation LZLoadview

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self builview];
    }
    return self;
}

- (void)builview{
    
    [self buildBackview];
    [self buildImageview];
    [self buildPressbutton];
}

- (void)buildImageview{
    self.iconview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cover"]];
    [self addSubview:self.iconview];
    self.iconview.bounds = CGRectMake(0, 0, 180, 180);
    self.iconview.center = self.center;
    self.iconview.alpha = 0.0;
    self.imageviewRects = [[LZRectsDuringAnimation alloc] init];
    self.iconview.y = self.iconview.y - 100;
    self.imageviewRects.midRect = self.iconview.frame;
    self.iconview.y -= 20;
    self.imageviewRects.startRect = self.iconview.frame;
    
    self.iconview.y += 40;
    self.imageviewRects.endRect = self.iconview.frame;
    
    self.iconview.frame = self.imageviewRects.startRect;
    
    
}

- (void)buildPressbutton{
    self.pressbutton = [[LZLongpressButton alloc] initWithFrame:CGRectMake(0, 0, self.width - 30, 50)];
    
    [self addSubview:self.pressbutton];
    self.pressbutton.alpha = 0.0;
    self.pressbutton.center = self.center ;
    self.pressbutton.y = self.height - 60;
    self.pressbutton.delegate = self;
    self.pressbutton.font = [UIFont fontWithName:LZFontNameLight size:16];;
    self.pressButtonRects = [[LZRectsDuringAnimation alloc] init];
    self.pressButtonRects.midRect = self.pressbutton.frame;
    
    self.pressbutton.y -= 20;
    self.pressButtonRects.startRect = self.pressbutton.frame;
    
    self.pressbutton.y += 40;
    self.pressButtonRects.endRect = self.pressbutton.frame;
    
    self.pressbutton.frame = self.pressButtonRects.startRect;
    
}

- (void)buildBackview{
    self.backview = [LZLineBakgroundView linebackgroundViewWithWith:4 lineGap:4 lineColor:[UIColor blackColor] frame:self.bounds];
    self.backview.alpha = 0;
    [self addSubview:self.backview];
}

- (void)hide{
    [UIView animateWithDuration:animationTime animations:^{
        self.iconview.frame = self.imageviewRects.endRect;
        self.iconview.alpha = 0.0;
        self.pressbutton.frame = self.pressButtonRects.endRect;
        self.pressbutton.alpha = 0.0;
        self.backview.alpha = 0;
    } completion:^(BOOL finished) {
        self.iconview.frame = self.imageviewRects.startRect;
        self.pressbutton.frame = self.pressButtonRects.startRect;
    }];
}

- (void)show{
    [UIView animateWithDuration:animationTime animations:^{
        
        self.iconview.frame = self.imageviewRects.midRect;
        self.pressbutton.frame = self.pressButtonRects.midRect;
        
        self.iconview.alpha = 1.0;
        self.pressbutton.alpha = 1.0;
        self.backview.alpha = 1;
    } completion:^(BOOL finished) {
        
        
    }];
}

- (void)remove{
    [UIView animateWithDuration:animationTime animations:^{
        self.backview.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)longpressButtonDidFinish:(LZLongpressButton *)pressButton{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(loadviewDidFinish:)]) {
        [self.delegate loadviewDidFinish:self];
    }
}
@end

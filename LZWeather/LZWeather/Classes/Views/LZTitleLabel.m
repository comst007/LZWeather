//
//  LZTitleLabel.m
//  LZWeather
//
//  Created by comst on 15/11/21.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZTitleLabel.h"
#import "LZCommon.h"
#import "LZFont.h"
#import "LZRectsDuringAnimation.h"
#import "UIView+SetRect.h"
@interface LZTitleLabel ()

@property (nonatomic, strong) UILabel *tilteLabel;
@property (nonatomic, strong) LZRectsDuringAnimation *labelRects;

@end

@implementation LZTitleLabel

- (void)buildView{
    
    self.tilteLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    self.tilteLabel.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.tilteLabel];
    
    self.tilteLabel.textAlignment = NSTextAlignmentLeft;
    
    if (self.text) {
        
        self.tilteLabel.text = self.text;
        
    }
    
    if (self.textColor) {
        
        self.tilteLabel.textColor = self.textColor;
    }
    
    if (self.textFont) {
        self.tilteLabel.font = self.textFont;
    }
    
    if (self.distance <= 0) {
        self.distance = 10;
    }
    
    [self.tilteLabel sizeToFit];
    
    self.labelRects = [[LZRectsDuringAnimation alloc] init];
    self.labelRects.midRect = self.tilteLabel.frame;
    self.tilteLabel.x -= self.distance;
    self.labelRects.startRect = self.tilteLabel.frame;
    self.tilteLabel.x += self.distance * 2;
    self.labelRects.endRect = self.tilteLabel.frame;
    self.tilteLabel.alpha = 0;
    self.tilteLabel.frame = self.labelRects.startRect;
    self.width = self.tilteLabel.width;
    self.height = self.tilteLabel.height;

}

- (void)show{
    
    [UIView animateWithDuration:TitleShowDuration animations:^{
       
        self.tilteLabel.alpha = 1;
        self.tilteLabel.frame = self.labelRects.midRect;
        
    }];
    
}

- (void)hide{
    
    [UIView animateWithDuration:TitleHideDuration animations:^{
        
        self.tilteLabel.alpha = 0;
        self.tilteLabel.frame = self.labelRects.endRect;
        
        
    } completion:^(BOOL finished) {
        
        self.tilteLabel.frame = self.labelRects.startRect;
        
    }];
}

+ (instancetype)titleLabelWithText:(NSString *)text{
    LZTitleLabel *label = [[LZTitleLabel alloc] initWithFrame:CGRectMake(20, 10, 0, 0)];
    label.text = text;
    label.textColor = [UIColor blackColor];
    label.distance = 10;
    if (iPhone4_4s || iPhone5_5s) {
        label.textFont = [UIFont fontWithName:LZFontNameBold size:10];
    }else if (iPhone6 || iPhone6_plus){
        label.textFont = [UIFont fontWithName:LZFontNameLight size:14];
    }else{
        label.textFont = [UIFont fontWithName:LZFontNameBold size:10];
    }
    [label buildView];
    
    return label;
}

@end

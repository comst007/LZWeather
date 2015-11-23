//
//  LZGridView.m
//  LZWeather
//
//  Created by comst on 15/11/24.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZGridView.h"
#import "LZAlphaView.h"
#import "AppColor.h"
#import "UIView+SetRect.h"
@interface LZGridView ()

@property (nonatomic, strong) LZAlphaView *alphaView;

@end

@implementation LZGridView

- (void)buildview{
    
    CGFloat len = self.gridLength <= 0 ? 10 : self.gridLength;
    
    NSInteger hCount = 5;
    NSInteger vCount = 6;
    
    CGFloat hLineW = hCount * len;
    CGFloat hLineH = 0.5;
    CGFloat vLineW = 0.5;
    CGFloat vLineH = (vCount - 2) * len;
    NSInteger i ;
    
    for (i = 0 ; i < hCount; i ++) {
        CGRect lineRect = CGRectMake(0, i * len, hLineW, hLineH);
        UIView *lineView = [[UIView alloc] initWithFrame:lineRect];
        lineView.backgroundColor = COLOR_CIRCLE_;
        
        if (i == 0) {
            lineView.alpha = 0;
        }else if (i == hCount - 1){
            lineView.alpha = 0;
        }
        [self addSubview:lineView];
    }
    for (i = 0; i < vCount; i ++) {
        CGRect lineRect = CGRectMake(i * len, 0, vLineW, vLineH);
        UIView *lineView = [[UIView alloc] initWithFrame:lineRect];
        
        lineView.backgroundColor = COLOR_CIRCLE_;
        
        if (i == 0 || i == vCount - 1) {
            lineView.alpha = 0;
        }
        [self addSubview:lineView];
    }
    
    self.height = hCount *len;
    self.width = vCount * len;
    self.viewOrigin = self.origin;
    
    self.alphaView = [[LZAlphaView alloc] initWithFrame:self.bounds];
    [self.alphaView alphaType];
    self.alphaView.x -= self.width;
    self.maskView = self.alphaView;
    
    
}

- (void)showDuration:(CGFloat)duration{
    [UIView animateWithDuration:duration animations:^{
        self.alphaView.x = -5;
        self.alpha = 1;
    }];
}

- (void)hideDuration:(CGFloat)duration{
    
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
        self.alphaView.x = self.width;
        
    } completion:^(BOOL finished) {
        self.alphaView.x = -self.width;
    }];
}
@end

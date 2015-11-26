//
//  LZBasicSeperatorView.h
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZRectsDuringAnimation.h"
@interface LZBasicSeperatorView : UIView
@property (nonatomic, strong) LZRectsDuringAnimation *rects;
@property (nonatomic, assign) CGFloat maxAlpha;
@property (nonatomic, assign) CGFloat showDuration;
@property (nonatomic, assign) CGFloat hideDuration;

- (void)show;

- (void)hide;
@end

//
//  LZGridView.h
//  LZWeather
//
//  Created by comst on 15/11/24.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZGridView : UIView

@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat gridLength;

- (void)buildview;

- (void)showDuration:(CGFloat)duration;

- (void)hideDuration:(CGFloat)duration;

@end

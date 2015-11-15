//
//  LZLongpressButton.h
//  LZWeather
//
//  Created by comst on 15/11/16.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZLongpressButton;

@protocol LZLongpressbuttonDelegate <NSObject>

- (void)longpressButtonDidFinish:(LZLongpressButton *)pressButton;

@end

@interface LZLongpressButton : UIButton

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, copy) UIColor *highlightColor;
@property (nonatomic, strong) UIColor *animationColor;
@property (nonatomic, assign) CGFloat animationWidth;

@property (nonatomic, assign) CGFloat animationTime;
@property (nonatomic, assign) CGFloat normalTime;

@property (nonatomic, weak) id<LZLongpressbuttonDelegate> delegate;
@end

//
//  LZTitleLabel.h
//  LZWeather
//
//  Created by comst on 15/11/21.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TitleShowDuration 1.75
#define TitleHideDuration 0.75

@interface LZTitleLabel : UIView

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) CGFloat distance;

- (void)buildView;

- (void)hide;

- (void)show;

+ (instancetype)titleLabelWithText:(NSString *)text;

@end

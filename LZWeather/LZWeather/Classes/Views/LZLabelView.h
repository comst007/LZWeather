//
//  LZLabelView.h
//  LZWeather
//
//  Created by comst on 15/11/13.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZFont.h"
#import "UIView+SetRect.h"
#import "NSString+StringHeight.h"
@interface LZLabelView : UIView
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *bkColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;

+ (instancetype)labelWithText:(NSString *)text origin:(CGPoint)orgin;

- (void)buildview;
@end

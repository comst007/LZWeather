//
//  LZStringPathView.h
//  LZWeather
//
//  Created by comst on 15/11/16.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZStringPathView : UIView
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) CGFloat textWidth;

- (void)buildView;

- (void)percentage:(CGFloat)percent animated:(BOOL)animated;

@end

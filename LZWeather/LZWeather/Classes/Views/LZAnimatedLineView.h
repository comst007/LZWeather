//
//  LZAnimatedLineView.h
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZAnimatedLineView : UIView

@property (nonatomic, strong) UIImage *image;

- (void)showWithDuration:(CGFloat)duration animated:(BOOL)animated;

- (void)hideWithDuration:(CGFloat)duration animated:(BOOL)animated;

@end

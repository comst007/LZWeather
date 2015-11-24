//
//  LZThreeLineView.h
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZThreeLineView : UIView

- (void)showWithDuration:(CGFloat)duration animated:(CGFloat)animated;

- (void)hideWithDuration:(CGFloat)duration animated:(CGFloat)animated;

@property (nonatomic, strong) NSNumber *circlesPerSecond;

- (void)rotateWhithCirclePerSecond;

@end

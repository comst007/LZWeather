//
//  LZRotateAngleView.h
//  LZWeather
//
//  Created by comst on 15/11/22.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZRotateAngleView : UIView

- (void)rotateAngle:(CGFloat)angle animated:(BOOL)animated duration:(CGFloat)duration;

- (void)recover:(CGFloat)duration;

@end

//
//  LZPathDirectionView.h
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZBasicSeperatorView.h"

@interface LZPathDirectionView : LZBasicSeperatorView

@property (nonatomic, assign) BOOL startPointAtRight;

- (void)showPercent:(CGFloat)percent;

@end

//
//  LZSunInfoView.h
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZSunInfoView : UIView
@property (nonatomic, strong) NSNumber *sunRiseSeconds;
@property (nonatomic, strong) NSNumber *sunSetSeconds;

- (void)buildview;

- (void)show;

- (void)hide;
@end

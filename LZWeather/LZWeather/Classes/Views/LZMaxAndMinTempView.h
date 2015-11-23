//
//  LZManAndMinTempView.h
//  LZWeather
//
//  Created by comst on 15/11/24.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZMaxAndMinTempView : UIView

@property (nonatomic, strong) NSNumber *maxTemp;
@property (nonatomic, strong) NSNumber *minTemp;

- (void)buildview;

- (void)show;

- (void)hide;
@end

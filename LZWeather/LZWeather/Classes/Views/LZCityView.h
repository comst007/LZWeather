//
//  LZCityView.h
//  LZWeather
//
//  Created by comst on 15/11/18.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZCityView : UIView
@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, copy) NSString *baseStation;
@property (nonatomic, copy) NSString *weatherDescription;
@property (nonatomic, copy) NSString *cityCode;
@property (nonatomic, copy) NSString *updatHour;
@property (nonatomic, copy) NSString *updateYear;
@property (nonatomic, strong) NSNumber *weatherNumber;
@property (nonatomic, strong) NSNumber *secondsSince1970;

- (void)builview;

- (void)show;

- (void)hide;
@end

//
//  LZCityView.m
//  LZWeather
//
//  Created by comst on 15/11/18.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZCityView.h"
#import "LZEmitterLayerView.h"
#import "LZRectsDuringAnimation.h"
#import "LZFont.h"
#import "UIView+SetRect.h"
#import "LZCommon.h"
#import "LZFont.h"
#import "WeatherNumberMeaningTransform.h"
#import "LZRainView.h"
#import "LZSnowView.h"
@interface LZCityView ()
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) LZRectsDuringAnimation *cityRect;
@property (nonatomic, strong) UILabel *weatherlabel;
@property (nonatomic, strong) LZRectsDuringAnimation *weatherRect;
@property (nonatomic, strong) UILabel *stationLabel;
@property (nonatomic, strong) LZRectsDuringAnimation *stationRect;
@property (nonatomic, strong) UILabel *yearLabel;
@property (nonatomic, strong) LZRectsDuringAnimation *yearRect;
@property (nonatomic, strong) UILabel *hourLabel;
@property (nonatomic, strong) LZRectsDuringAnimation *hourRect;

@property (nonatomic, strong) UIView *redview;
@property (nonatomic, strong) LZRectsDuringAnimation *redRect;
@property (nonatomic, strong) UIView *blackview;
@property (nonatomic, strong) LZRectsDuringAnimation *blackRect;

@property (nonatomic, strong) LZEmitterLayerView *weatherView;

@end

@implementation LZCityView

- (void)builview{
    self.backgroundColor = [[UIColor whiteColor]  colorWithAlphaComponent:0.9];
    self.alpha = 0;
    [self buildStationview];
    [self buildRedview];
    [self buildBlackview];
    [self buildyearLabel];
    [self buildHourLabel];
    [self buildCityLabel];
    [self buildWeatherDescriptionLabel];
    
}

- (void)buildCityLabel{
    CGFloat viewX = 12;
    CGFloat viewY = 15;
    CGFloat viewWidth = LZWidth - 10;
    CGFloat viewHeight = 40;
    CGFloat fontSize = 30;
    if (iPhone4_4s || iPhone5_5s) {
        viewY = 16;
        fontSize = 26;
    }else if (iPhone6 || iPhone6_plus){
        viewY = 17;
        fontSize = 30;
    }else{
        viewY = 16;
        fontSize = 26;
    }
    self.cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, viewY, viewWidth, viewHeight)];
    self.cityLabel.alpha = 0;
    [self addSubview:self.cityLabel];
    self.cityLabel.text = @"Longhua";
    self.cityLabel.textAlignment = NSTextAlignmentLeft;
    self.cityLabel.textColor = [UIColor blackColor];
    self.cityLabel.font = [UIFont fontWithName:LZFontNameLight size:fontSize];
    self.cityRect = [self rects:self.cityLabel.frame moveRightDistance:5];
    self.cityLabel.frame = self.cityRect.startRect;
}

- (void)buildWeatherDescriptionLabel{
    CGFloat viewX = 15;
    CGFloat viewY = 50;
    CGFloat viewWidth = LZWidth - 10;
    CGFloat viewHeight = 20;
    CGFloat fontSize = 14;
    if (iPhone6 || iPhone6_plus) {
        viewY = 62;
        fontSize = 16;
    }
    self.weatherlabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, viewY, viewWidth, viewHeight)];
    [self addSubview:self.weatherlabel];
    self.weatherlabel.alpha = 0;
    self.weatherlabel.text = @"broken clouds";
    self.weatherlabel.textColor  = [UIColor blackColor];
    self.weatherlabel.font  = [UIFont fontWithName:LZFontNameThin size:fontSize];
    self.weatherRect = [self rects:self.weatherlabel.frame moveRightDistance:8];
    self.weatherlabel.frame = self.weatherRect.startRect;
}

- (void)buildyearLabel{
    CGFloat viewX = 0;
    CGFloat viewY = 30;
    CGFloat viewWidth = LZWidth - 40;
    CGFloat viewHeight = 12;
    CGFloat fontSize = 16;
    if (iPhone4_4s || iPhone5_5s) {
        viewHeight = 12;
        fontSize = 10;
    }else if (iPhone6 || iPhone6_plus){
        viewHeight = 18;
        fontSize = 16;
    }else{
        viewHeight = 12;
        fontSize = 16;
    }
    self.yearLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, viewY, viewWidth, viewHeight)];
    [self addSubview:self.yearLabel];
    self.yearLabel.alpha = 0;
    self.yearLabel.text = @"2015.11.18";
    self.yearLabel.textColor = [UIColor whiteColor];
    self.yearLabel.textAlignment = NSTextAlignmentRight;
    self.yearLabel.font = [UIFont fontWithName:LZFontNameLight size:fontSize];
    self.yearRect = [self rects:self.yearLabel.frame moveRightDistance:-20];
    self.yearLabel.frame = self.yearRect.startRect;
}

- (void)buildHourLabel{
    CGFloat viewX = 0;
    CGFloat viewY = 55;
    CGFloat viewWidth = LZWidth - 8;
    CGFloat viewHeight = 14;
    CGFloat fontSize = 12;
    if (iPhone4_4s || iPhone5_5s) {
        viewHeight = 14;
        fontSize = 12;
    }else if (iPhone6 || iPhone6_plus){
        viewHeight = 20;
        fontSize = 16;
    }else{
        viewHeight = 14;
        fontSize = 12;
    }
    self.hourLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewX, viewY, viewWidth, viewHeight)];
    self.hourLabel.alpha = 0;
    [self addSubview:self.hourLabel];
    self.hourLabel.text = @"21:21 update";
    self.hourLabel.textAlignment = NSTextAlignmentRight;
    self.hourLabel.textColor = [UIColor whiteColor];
    self.hourLabel.font = [UIFont fontWithName:LZFontNameRegular size:fontSize];
    self.hourRect = [self rects:self.hourLabel.frame moveRightDistance:-15];
    self.hourLabel.frame = self.hourRect.startRect;
    
}

- (void)buildRedview{
    CGFloat viewWidth = 100;
    CGFloat viewY = 22;
    CGFloat viewX = LZWidth - viewWidth;
    CGFloat viewHeight = 60;
    if (iPhone4_4s || iPhone5_5s) {
        viewWidth = 100;
        viewHeight = 44;
    }else if (iPhone6){
        viewWidth = 135;
        viewHeight = 60;
    }else if (iPhone6_plus){
        viewWidth = 135;
        viewHeight = 60;
    }else{
        viewHeight = 40;
        viewWidth = 100;
    }
    viewX = LZWidth - viewWidth;
    self.redview = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewWidth + 100, viewHeight)];
    self.redview.backgroundColor = [UIColor redColor];
    
    [self addSubview:self.redview];
    self.redview.alpha = 0;
    
    self.redRect = [self rects:self.redview.frame moveRightDistance:-30];
    self.redview.frame = self.redRect.startRect;
}

- (void)buildBlackview{
    
    CGFloat viewX = -30;
    CGFloat viewY = 22;
    CGFloat viewWidth = 5 + 30;
    CGFloat viewHeight = 44;
    
    if (iPhone6 || iPhone6_plus) {
        viewHeight = 60;
    }
    self.blackview = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewWidth, viewHeight)];
    self.blackview.backgroundColor = [UIColor blackColor];
    self.blackRect = [self rects:self.blackview.frame moveRightDistance:5];
    self.blackview.alpha = 0;
    self.blackview.frame = self.blackRect.startRect;
    [self addSubview:self.blackview];
    
    
}

- (void)buildStationview{
    
    self.stationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, LZWidth - 8, 12)];
    self.stationLabel.textAlignment = NSTextAlignmentRight;
    self.stationLabel.font = [UIFont fontWithName:LZFontNameBold size:10];
    self.stationLabel.text = @"cmc station";
    self.stationRect = [self rects:self.stationLabel.frame moveRightDistance:-10];
    self.stationLabel.frame = self.stationRect.startRect;
    self.stationLabel.alpha = 0 ;
    [self addSubview:self.stationLabel];
    
    
}


- (void)show{
    EMitterType type = [WeatherNumberMeaningTransform emitterTypeWithNumber:self.weatherNumber];
    if (type == LZEMitterTypeRain) {
        self.weatherView = [[LZRainView alloc] initWithFrame:CGRectMake(0, 0, LZWidth * 0.5, LZHeight - LZWidth * 1.5)];
        [self addSubview:self.weatherView];
        [self.weatherView configType:LZEMitterTypeRain];
        [self.weatherView show];
                                                                        
    }else if (type == LZEMitterTypeSnow){
        self.weatherView = [[LZSnowView alloc] initWithFrame:CGRectMake(0, 0, LZWidth * 0.5, LZHeight - 1.5 * LZWidth)];
        [(LZSnowView *)self.weatherView setColor:[UIColor lightGrayColor]];
        [self addSubview:self.weatherView];
        [self.weatherView configType:LZEMitterTypeSnow];
        [self.weatherView show];
    }else{
        
    }
    [UIView animateWithDuration:1.0 animations:^{
        
        self.alpha = 1;
        self.stationLabel.alpha = 1.0;
        self.stationLabel.frame = self.stationRect.midRect;
        
        self.yearLabel.alpha = 1.0;
        self.yearLabel.frame = self.yearRect.midRect;
        
        self.hourLabel.alpha = 1.0;
        self.hourLabel.frame = self.hourRect.midRect;
        
        self.cityLabel.alpha = 1.0;
        self.cityLabel.frame = self.cityRect.midRect;
        
        self.weatherlabel.alpha = 1.0;
        self.weatherlabel.frame = self.weatherRect.midRect;
        
        self.blackview.alpha = 1.0;
        self.blackview.frame = self.blackRect.midRect;
        
        self.redview.frame = self.redRect.midRect;
        self.redview.alpha = 1;
        }];
    
    
}

- (void)hide{
    [self.weatherView hide];
    [UIView animateWithDuration:0.75 animations:^{
        self.alpha = 0;
        self.stationLabel.alpha = 0;
        self.stationLabel.frame = self.stationRect.endRect;
        
        self.yearLabel.alpha = 0;
        self.yearLabel.frame = self.yearRect.endRect;
        
        self.hourLabel.alpha = 0;
        self.hourLabel.frame = self.hourRect.endRect;
        
        self.cityLabel.alpha = 0;
        self.cityLabel.frame = self.cityRect.endRect;
        
        self.weatherlabel.alpha = 0;
        self.weatherlabel.frame = self.weatherRect.endRect;
        
        self.blackview.alpha = 0;
        self.blackview.frame = self.blackRect.endRect;
        
        self.redview.frame = self.redRect.endRect;
        self.redview.alpha = 0;
        
    } completion:^(BOOL finished) {
       
        self.stationLabel.frame = self.stationRect.startRect;
        
      
        self.yearLabel.frame = self.yearRect.startRect;
        
    
        self.hourLabel.frame = self.hourRect.startRect;
        
       
        self.cityLabel.frame = self.cityRect.startRect;
        
      
        self.weatherlabel.frame = self.weatherRect.startRect;
        
      
        self.blackview.frame = self.blackRect.startRect;
        
        self.redview.frame = self.redRect.startRect;
       
    }];
}
/**
 *  left -> right distance > 0
 *
 *  @param frame
 *  @param distance
 *
 *  @return
 */
- (LZRectsDuringAnimation *)rects:(CGRect)frame moveRightDistance:(CGFloat)distance{
    
    LZRectsDuringAnimation *rects = [[LZRectsDuringAnimation alloc] init];
    
    rects.midRect = frame;
    
    frame.origin.x -= distance;
    rects.startRect = frame;
    
    frame.origin.x += distance * 2;
    
    rects.endRect = frame;
    
    
    return rects;
}

- (void)setCityName:(NSString *)cityName{
    _cityName = cityName;
    self.cityLabel.text = cityName;
    [self.cityLabel sizeToFit];
    
}

- (void)setWeatherDescription:(NSString *)weatherDescription{
    _weatherDescription = weatherDescription;
    self.weatherlabel.text = weatherDescription;
    [self.weatherlabel sizeToFit];
}

- (void)setBaseStation:(NSString *)baseStation{
    _baseStation = baseStation;
    self.stationLabel.text = baseStation;
}

- (void)setSecondsSince1970:(NSNumber *)secondsSince1970{
    _secondsSince1970 = secondsSince1970;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:secondsSince1970.integerValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy.MM.dd";
    self.yearLabel.text = [formatter stringFromDate:date];
    
    formatter.dateFormat = @"hh:mm";
    self.hourLabel.text = [NSString stringWithFormat:@"%@ update", [formatter stringFromDate:date]];
}
@end

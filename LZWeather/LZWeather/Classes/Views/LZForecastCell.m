//
//  LZForecastCell.m
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZForecastCell.h"
#import "LZFont.h"
#import "LZCommon.h"
#import "UIView+SetRect.h"
#import "WeatherNumberMeaningTransform.h"
@interface LZForecastCell ()
@property (nonatomic, strong) UILabel *weatherDescriptionLabel;
@property (nonatomic, strong) UILabel *weekDayLabel;
@property (nonatomic, strong) UILabel *maxTempLabel;
@property (nonatomic, strong) UILabel *minTempLabel;
@property (nonatomic, strong) UILabel *weatherIconLabel;


@end

@implementation LZForecastCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLabels];
    }
    return self;
}

- (void)initLabels{
    CGFloat fontSize = 28;
    CGFloat labelX = 0;
    CGFloat labelY = 0;
    if (iPhone6 || iPhone6_plus) {
        fontSize  = 40;
    }
    
    self.weekDayLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 + 17, 24, 100, 60)];
    [self addSubview:self.weekDayLabel];
    self.weekDayLabel.textAlignment = NSTextAlignmentLeft;
    self.weekDayLabel.font = [UIFont fontWithName:LZFontNameThin size:fontSize];
    //[self.weekDayLabel sizeToFit];
    
    labelX = 100;
    fontSize = 28;
    if (iPhone6) {
        labelX = 110;
        fontSize = 34;
    }else if (iPhone6_plus){
        labelX = 120;
        fontSize = 40;
    }
    
    self.minTempLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, 25, 200, 70)];
    self.minTempLabel.textAlignment = NSTextAlignmentLeft;
    self.minTempLabel.font = [UIFont fontWithName:LZFontNameThin size:fontSize];
    //[self.minTempLabel sizeToFit];
    [self addSubview:self.minTempLabel];
    
    labelX = 100 + 80;
    if (iPhone6) {
        labelX = 100 + 80 + 20;
        fontSize = 34;
    }else if (iPhone6_plus){
        labelX = 100 + 80 + 40;
        fontSize = 40;
    }
    
    self.maxTempLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, 25, 200, 70)];
    self.maxTempLabel.textAlignment = NSTextAlignmentLeft;
    self.maxTempLabel.font = [UIFont fontWithName:LZFontNameThin size:fontSize];
    //[self.maxTempLabel sizeToFit];
    [self addSubview:self.maxTempLabel];
    
    labelX = 250;
    fontSize = 40;
    labelY = 15;
    if (iPhone6) {
        labelX = 250 + 40;
        labelY = 20;
        fontSize = 45;
    }else if (iPhone6_plus){
        labelX = 250 + 70;
        labelY = 24;
        fontSize = 50;
    }
    
    self.weatherIconLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, 60, 60)];
    self.weatherIconLabel.textAlignment = NSTextAlignmentCenter;
    self.weatherIconLabel.font = [UIFont fontWithName:LZFontNameWeahterAndTime size:fontSize];
    
    [self addSubview:self.weatherIconLabel];
    
    self.weatherDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 300, 12)];
    self.weatherDescriptionLabel.textAlignment = NSTextAlignmentLeft;
    self.weatherDescriptionLabel.font = [UIFont fontWithName:LZFontNameRegular size:10];
    [self addSubview:self.weatherDescriptionLabel];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, LZWidth / 4 - 0.5, LZWidth, 0.5)];
    line.alpha = 0.1;
    line.backgroundColor = [UIColor blackColor];
    [self addSubview:line];
    
}

- (void)show{
    [UIView animateWithDuration:1 animations:^{
        
        self.weekDayLabel.x = 17;
    }];
}

- (void)hide{
    [UIView animateWithDuration:0.74 animations:^{
        
        self.weekDayLabel.x = 17 + 10;
    }];
}

- (void)setCurrentItem:(LZListItem *)currentItem{
    
    _currentItem = currentItem;
    self.weatherDescriptionLabel.text = currentItem.weather.desc;
    self.minTempLabel.text = [NSString stringWithFormat:@"%ld°", (long)@(currentItem.temp.min.floatValue - 273.15).integerValue];
    self.maxTempLabel.text = [NSString stringWithFormat:@"%ld°", @(currentItem.temp.max.floatValue - 273.15).integerValue];
    
    self.weatherIconLabel.text = [WeatherNumberMeaningTransform fontTextWeatherNumber:currentItem.weather.weatherID];
    
    NSDate *utcDate = [NSDate dateWithTimeIntervalSince1970:currentItem.dt.intValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEEE";
    formatter.weekdaySymbols = @[@"Sun", @"Mon", @"Tues", @"Wed", @"Thur", @"Fri", @"Sat"];
    self.weekDayLabel.textColor = [UIColor blackColor];
    NSString *weekday = [formatter stringFromDate:utcDate];
    if ([weekday isEqualToString:@"Sun"]) {
        self.weekDayLabel.textColor = [UIColor redColor];
    }
    self.weekDayLabel.text = weekday;
    
}
@end

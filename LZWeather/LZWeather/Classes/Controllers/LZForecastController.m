//
//  LZForecastController.m
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZForecastController.h"
#import "LZForecastWeatherView.h"
#import "LZShowDownView.h"
#import "UIView+SetRect.h"
#import "LZCommon.h"
#import "LZForecastCell.h"
@interface LZForecastController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) LZForecastWeatherView *forecastWeatherView;
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) NSArray *weatherDataArray;
@property (nonatomic, strong) LZShowDownView *showdownView;
@end
@implementation LZForecastController

- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTableView];
    
    NSMutableArray *indexArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.weatherDataArray.count; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [indexArray addObject:indexPath];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
       // [self.tableview insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
    });
    self.showdownView = [[LZShowDownView alloc] initWithFrame:CGRectMake(0, 0, 30, 10)];
    self.showdownView.center = self.view.center;
    self.showdownView.y = -30;
    [self.tableview addSubview:self.showdownView];
}

- (void)initTableView{
    
    self.cellHeight = LZWidth / 4;
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.showsVerticalScrollIndicator = NO;
    self.tableview.showsHorizontalScrollIndicator = NO;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableview registerClass:[LZForecastCell class] forCellReuseIdentifier:@"LZCell"];
    
    [self.view addSubview:self.tableview];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.weatherDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LZForecastCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LZCell"];
    cell.currentItem = self.weatherDataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellHeight;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.contentOffset.y <= -60) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat percent = - scrollView.contentOffset.y / 60.0;
    [self.showdownView showPercent:percent];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    LZForecastCell *forcastCell = (LZForecastCell *)cell;
    [forcastCell show];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    LZForecastCell *forcastCell = (LZForecastCell *)cell;
    [forcastCell hide];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return LZHeight - 1.5 * LZWidth;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        LZForecastWeatherView *forecastView = [[LZForecastWeatherView alloc] initWithFrame:CGRectMake(0, 0, LZWidth, LZHeight - 1.5 * LZWidth)];
        [forecastView buildview];
        
        forecastView.cityName = self.forecastInfo.city.name;
        forecastView.countryCode = self.forecastInfo.city.country;
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, LZHeight - 1.5 * LZWidth - 1, LZWidth, 0.5)];
        line.backgroundColor = [UIColor blackColor];
        line.alpha = 0.1;
        [forecastView addSubview:line];
        return forecastView;
        
    }
    
    return nil;
}


- (void)setForecastInfo:(LZForecastInfo *)forecastInfo{
    _forecastInfo = forecastInfo;
    self.weatherDataArray = forecastInfo.list;
    [self.tableview reloadData];
}

- (BOOL)prefersStatusBarHidden{
    
    return YES;
}
@end

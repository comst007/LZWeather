//
//  LZForecastCell.h
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LZListItem.h"
@interface LZForecastCell : UITableViewCell
@property (nonatomic, strong) LZListItem *currentItem;

- (void)show;

- (void)hide;

@end

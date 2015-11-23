//
//  LZAlphaView.h
//  LZWeather
//
//  Created by comst on 15/11/24.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZAlphaView : UIView

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) NSArray *locations;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;

- (void)alphaType;
@end

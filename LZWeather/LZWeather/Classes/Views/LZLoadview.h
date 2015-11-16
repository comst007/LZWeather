//
//  LZLoadview.h
//  LZWeather
//
//  Created by comst on 15/11/16.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZLoadview;

@protocol LZLoadviewDelegate <NSObject>

- (void)loadviewDidFinish:(LZLoadview *)loadview;

@end

@interface LZLoadview : UIButton

@property (nonatomic, weak) id<LZLoadviewDelegate> delegate;

- (void)builview;

- (void)show;

- (void)hide;

- (void)remove;

@end

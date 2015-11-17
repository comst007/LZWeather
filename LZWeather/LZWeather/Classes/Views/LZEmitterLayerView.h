//
//  LZEmitterLayerView.h
//  LZWeather
//
//  Created by comst on 15/11/17.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, EMitterType) {
    LZEMitterTypeSnow,
    LZEMitterTypeRain,
    LZEmitterTypeNone
};
@interface LZEmitterLayerView : UIView
- (void)setEmitterLayer:(CAEmitterLayer *)layer;

- (CAEmitterLayer *)emitterLayer;

- (void)show;

- (void)hide;

- (void)configType:(EMitterType)type;
@end

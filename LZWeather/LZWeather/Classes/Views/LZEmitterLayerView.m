//
//  LZEmitterLayerView.m
//  LZWeather
//
//  Created by comst on 15/11/17.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZEmitterLayerView.h"


@interface LZEmitterLayerView ()
@property (nonatomic, strong) CAEmitterLayer *emiiterlayer;
@end

@implementation LZEmitterLayerView

+ (Class)layerClass{
    
    return [CAEmitterLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.emiiterlayer = (CAEmitterLayer *)self.layer;
        //self.alpha = 0.0;
    }
    
    
    return self;
}

- (CAEmitterLayer *)emitterLayer{
    return _emiiterlayer;
}

- (void)setEmitterlayer:(CAEmitterLayer *)emiiterlayer{
    _emiiterlayer = emiiterlayer;
}


@end

//
//  LZRainView.m
//  LZWeather
//
//  Created by comst on 15/11/17.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZRainView.h"

@implementation LZRainView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
        self.emitterLayer.emitterShape = kCAEmitterLayerLine;
        self.emitterLayer.emitterSize = self.frame.size;
        self.emitterLayer.emitterPosition = CGPointMake(self.bounds.size.width * 0.5, -5);
        UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alpha"]];
        imageview.frame = self.bounds;
        self.maskView = imageview;
        self.alpha = 0;
        [self configType:LZEMitterTypeRain];
    }
    
    return self;
}

- (void)showRain{
    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    snowCell.name = @"rain";
    snowCell.birthRate = self.birthRate;
    snowCell.lifetime = self.lifeTime;
    snowCell.velocity = self.speed;
    snowCell.velocityRange = self.speedRange;
    snowCell.yAcceleration = self.gravity;
    snowCell.emissionRange = 0;
    
    snowCell.contents = (id)[UIImage imageNamed:@"rain"].CGImage;
    snowCell.scale = 0.5;
    snowCell.scaleRange = 0.3;
    snowCell.color = [UIColor blackColor].CGColor;
    self.emitterLayer.emitterCells = @[snowCell];
    
}

- (void)show{
    [self showRain];
    [UIView animateWithDuration:1.75 animations:^{
        self.alpha = 0.5;
    }];
}

- (void)hide{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;
    }];
}

- (void)configType:(EMitterType)type{
    if (type == LZEMitterTypeRain) {
        self.birthRate = 100;
        self.lifeTime = 30;
        self.speed = 10;
        self.speedRange = 10;
        self.gravity = 2000;
        
    }
}

@end

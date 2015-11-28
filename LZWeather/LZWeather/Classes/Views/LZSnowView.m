//
//  LZSnowView.m
//  LZWeather
//
//  Created by comst on 15/11/17.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZSnowView.h"

@implementation LZSnowView

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
        [self configType:LZEMitterTypeSnow];
    }
    
    return self;
}

- (void)showSnow{
    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    snowCell.name = @"snow";
    snowCell.birthRate = self.birthRate;
    snowCell.lifetime = self.lifeTime;
    snowCell.velocity = self.speed;
    snowCell.velocityRange = self.speedRange;
    snowCell.yAcceleration = self.gravity;
    snowCell.emissionRange = M_PI_2;
    snowCell.spinRange = M_PI_4;
    snowCell.contents = (id)[UIImage imageNamed:@"snow"].CGImage;
    snowCell.color =  self.color == nil ?[UIColor whiteColor].CGColor :self.color.CGColor;
    snowCell.scale = 0.5;
    snowCell.scaleRange = 0.3;
    self.emitterLayer.emitterCells = @[snowCell];
    
}

- (void)show{
    [self showSnow];
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
    if (type == LZEMitterTypeSnow) {
        self.birthRate = 5;
        self.lifeTime = 30;
        self.speed = 10;
        self.speedRange = 10;
        self.gravity = 2;
        
    }
}
@end

//
//  LZRotateAngleView.m
//  LZWeather
//
//  Created by comst on 15/11/22.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZRotateAngleView.h"
#import "LZCommon.h"

@interface LZRotateAngleView ()

@property (nonatomic, assign) CGAffineTransform defaultsTransform;

@end

@implementation LZRotateAngleView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.defaultsTransform = self.transform;
    }
    
    return self;
}

- (void)rotateAngle:(CGFloat)angle animated:(BOOL)animated duration:(CGFloat)duration{
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.transform = CGAffineTransformRotate(self.defaultsTransform, angle);
        }];
    }else{
        self.transform = CGAffineTransformRotate(self.defaultsTransform, angle);
    }
}

- (void)recover:(CGFloat)duration{
    
    [UIView animateWithDuration:duration animations:^{
        
        self.transform = CGAffineTransformRotate(self.defaultsTransform, 0);
        
    }];
}

@end

//
//  LZThreeLineView.m
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZThreeLineView.h"
#import "LZAnimatedLineView.h"
#import "UIView+SetRect.h"
#import "LZCommon.h"
@interface LZThreeLineView ()
@property (nonatomic, strong) LZAnimatedLineView *oneLine;
@property (nonatomic, strong) LZAnimatedLineView *twoLine;
@property (nonatomic, strong) LZAnimatedLineView *threeeLine;

@end
@implementation LZThreeLineView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initLines];
    }
    
    return self;
}

- (void)initLines{
    UIImage *image = [UIImage imageNamed:@"WindSpeed"];
    CGFloat width = self.height / image.size.height * image.size.width / 2;
    self.oneLine = [[LZAnimatedLineView alloc] initWithFrame:CGRectMake(0, 0, width, self.height)];
    self.oneLine.image = image;
    self.oneLine.center = self.middlePoint;
    [self addSubview:self.oneLine];
    
    self.twoLine = [[LZAnimatedLineView alloc] initWithFrame:CGRectMake(0, 0, width, self.height)];
    self.twoLine.image = image;
    self.twoLine.center = self.middlePoint;
    [self addSubview:self.twoLine];self.twoLine.transform = CGAffineTransformRotate(self.twoLine.transform, RADIAN(120));
    
    
    self.threeeLine= [[LZAnimatedLineView alloc] initWithFrame:CGRectMake(0, 0, width, self.height)];
    self.threeeLine.image = image;
    self.threeeLine.center = self.middlePoint;
    [self addSubview:self.threeeLine];
    self.threeeLine.transform = CGAffineTransformRotate(self.threeeLine.transform, RADIAN(240));
    

    
    
}

- (void)showWithDuration:(CGFloat)duration animated:(CGFloat)animated{
    
    [self.oneLine showWithDuration:duration animated:animated];
     [self.twoLine showWithDuration:duration animated:animated];
     [self.threeeLine showWithDuration:duration animated:animated];
}

- (void)hideWithDuration:(CGFloat)duration animated:(CGFloat)animated{
    [self.oneLine hideWithDuration:duration animated:animated];
    [self.twoLine hideWithDuration:duration animated:animated];
    [self.threeeLine hideWithDuration:duration animated:animated];

    
}

- (void)rotateWhithCirclePerSecond{
    
    CGFloat speed = [self.circlesPerSecond floatValue] <= 0 ? 0.001 : [self.circlesPerSecond floatValue];
    
    [UIView animateWithDuration:1.0 / speed delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.transform = CGAffineTransformRotate(self.transform, M_PI_2);
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self rotateWhithCirclePerSecond];
        }
    }];
}
@end

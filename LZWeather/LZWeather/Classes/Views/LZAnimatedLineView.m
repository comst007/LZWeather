//
//  LZAnimatedLineView.m
//  LZWeather
//
//  Created by comst on 15/11/25.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZAnimatedLineView.h"
#import "UIView+SetRect.h"
#import "LZRectsDuringAnimation.h"

@interface LZAnimatedLineView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) LZRectsDuringAnimation *rects;

@end
@implementation LZAnimatedLineView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initRects];
        self.imageView = [[UIImageView alloc] initWithFrame:self.rects.startRect];
        [self addSubview:self.imageView];
        self.imageView.alpha = 0;
    }
    
    return self;
}

- (void)initRects{
    
    self.rects = [[LZRectsDuringAnimation alloc] init];
    
    self.rects.startRect = CGRectMake(0, -10, self.width, self.height * 0.5);
    self.rects.midRect = CGRectMake(0, 0, self.width, self.height * 0.5);
    self.rects.endRect = CGRectMake(0, -5, self.width, self.height * 0.5);
    
}

- (void)reset{
    self.imageView.frame = self.rects.startRect;
    self.imageView.alpha = 0;
}

- (void)showWithDuration:(CGFloat)duration animated:(BOOL)animated{
    
    [self reset];
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.imageView.alpha = 1;
            self.imageView.frame = self.rects.midRect;
        }];
    }else{
        self.imageView.alpha = 1;
        self.imageView.frame = self.rects.midRect;
    }
}

- (void)hideWithDuration:(CGFloat)duration animated:(BOOL)animated{
    
    if (!animated) {
        self.imageView.alpha = 0;
        self.imageView.frame = self.rects.endRect;
    }else{
        [UIView animateWithDuration:duration animations:^{
            self.imageView.alpha = 0;
            self.imageView.frame = self.rects.endRect;
        }];
    }
}

- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
}
@end

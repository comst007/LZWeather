//
//  LZLongpressButton.m
//  LZWeather
//
//  Created by comst on 15/11/16.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZLongpressButton.h"
#import "UIView+SetRect.h"
#define kShowviewWidth 1000
#define kAnimationTime  1.5
#define kNormalTime 1


@interface LZLongpressButton ()

@property (nonatomic, strong) UILabel *normalLabel;
@property (nonatomic, strong) UILabel *highlightLabel;
@property (nonatomic, strong) UIButton *pressButton;
@property (nonatomic, strong) UIView *showView;

@end

@implementation LZLongpressButton

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
       
        [self createShowview];
        [self createButton];
         [self createLabel];
        self.animationTime = kAnimationTime;
        self.normalTime = kNormalTime;
        self.animationWidth = kShowviewWidth;
        self.animationColor = [UIColor blackColor];
    }
    
    return self;
}

- (void)createLabel{
    
    self.normalLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.normalLabel.alpha = 1.0;
    self.normalLabel.textColor = [UIColor blackColor];
    self.normalLabel.font = [UIFont systemFontOfSize:15];
    self.normalLabel.textAlignment = NSTextAlignmentCenter;
    self.normalLabel.text = @"Long Press To Update";
    
    self.highlightLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.highlightLabel.alpha = 0.0;
    self.highlightLabel.textColor = [UIColor whiteColor];
    self.highlightLabel.font = [UIFont systemFontOfSize:15];
    self.highlightLabel.textAlignment = NSTextAlignmentCenter;
    self.highlightLabel.text = @"Long Press To Update";
    [self addSubview:self.highlightLabel];
    [self addSubview:self.normalLabel];
    
}

- (void)createButton{
    
    self.pressButton = [[UIButton alloc] initWithFrame:self.bounds];

    self.pressButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.pressButton.layer.borderWidth = 1;
    [self.pressButton addTarget:self action:@selector(longPress) forControlEvents:UIControlEventTouchDown];
    [self.pressButton addTarget:self action:@selector(touchUp) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.pressButton];
}

- (void)longPress{
    
    self.showView.bounds = ((CALayer *)self.showView.layer.presentationLayer).bounds;
    self.showView.alpha  = ((CALayer *)self.showView.layer.presentationLayer).opacity;
    
    self.normalLabel.alpha    = ((CALayer *)self.normalLabel.layer.presentationLayer).opacity;
    self.highlightLabel.alpha = ((CALayer *)self.highlightLabel.layer.presentationLayer).opacity;
//
//    NSLog(@"%@", NSStringFromCGRect([self.showView.layer.presentationLayer bounds]));
    [self.showView.layer removeAllAnimations];
    
    [UIView animateWithDuration:self.animationTime <= 0 ? 5 : self.animationTime animations:^{
       
        self.highlightLabel.alpha = 1.0;
        self.normalLabel.alpha = 0.0;
        
        self.showView.bounds = CGRectMake(0, 0, self.showView.width, self.animationWidth);
        self.showView.alpha = 1.0;
    } completion:^(BOOL finished) {
        if (finished) {
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(longpressButtonDidFinish:)] ) {
                [self.delegate longpressButtonDidFinish:self];
            }
        }
    }];
}

- (void)touchUp{
    
    self.showView.bounds = ((CALayer *)self.showView.layer.presentationLayer).bounds;
    self.showView.alpha  = ((CALayer *)self.showView.layer.presentationLayer).opacity;
    
    self.normalLabel.alpha    = ((CALayer *)self.normalLabel.layer.presentationLayer).opacity;
    self.highlightLabel.alpha = ((CALayer *)self.highlightLabel.layer.presentationLayer).opacity;

    [self.showView.layer removeAllAnimations];
//
    
    [UIView animateWithDuration:self.normalTime <= 0 ? 0.5 : self.normalTime animations:^{
        
        self.normalLabel.alpha = 1.0;
        self.highlightLabel.alpha = 0.0;
        self.showView.bounds = CGRectMake(0, 0, self.showView.width, 0);
        self.showView.alpha = 0.0;
    } completion:^(BOOL finished) {
        
    }];
    
}


- (void)createShowview{
    self.showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kShowviewWidth, 0)];
    self.showView.backgroundColor = self.animationColor;
    self.showView.alpha = 0;
    [self addSubview:self.showView];
    self.showView.center = self.center;
    self.showView.userInteractionEnabled = NO;
    self.showView.transform = CGAffineTransformRotate(self.showView.transform, M_PI_4);
    
}

- (void)setText:(NSString *)text{
    self.text = text;
    self.normalLabel.text = text;
    self.highlightLabel.text = text;
}

- (NSString *)text{
   return self.normalLabel.text;
}

@synthesize font = _font;
- (void)setFont:(UIFont *)font{
    _font = font;
    self.normalLabel.font = font;
    self.highlightLabel.font = font;
    
}

- (UIFont *)font{
    return self.normalLabel.font;
}

- (void)setNormalColor:(UIColor *)normalColor{
    self.normalLabel.textColor = normalColor;
    
}

- (UIColor *)normalColor{
 
    return [self.normalLabel textColor];
}

- (void)setHighlightColor:(UIColor *)highlightColor{
    self.highlightLabel.textColor = highlightColor;
}

- (UIColor *)highlightColor{
    return self.highlightLabel.textColor;
}

- (UIColor *)animationColor{
    return self.showView.backgroundColor;
}

- (void)setAnimationColor:(UIColor *)animationColor{
    self.showView.backgroundColor = animationColor;
}

@synthesize animationTime = _animationTime;
- (CGFloat)animationTime{
    return _animationTime;
}

- (void)setAnimationTime:(CGFloat)animationTime{
    _animationTime = animationTime;
}

@synthesize normalTime = _normalTime;
- (CGFloat)normalTime{
    return _normalTime;
}

- (void)setNormalTime:(CGFloat)normalTime{
    _normalTime = normalTime;
}


@end

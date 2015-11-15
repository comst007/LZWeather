//
//  LZLabelView.m
//  LZWeather
//
//  Created by comst on 15/11/13.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZLabelView.h"

@interface LZLabelView ()

@property (nonatomic, strong) UILabel *label;

@end
@implementation LZLabelView

- (void)buildview{
    self.label.text = self.text;
    self.label.textColor = self.textColor;
    self.label.font = self.textFont;
    self.label.width = [self.text widthWithLabelFont:self.textFont];
    self.label.height = [self.text heightWithLabelFont:self.textFont withLabelWidth:self.label.width];
    self.label.viewOrigin = CGPointMake(self.left, self.top);
    self.width = self.left + self.label.width + self.right;
    self.height = self.top + self.label.height + self.bottom;
    self.backgroundColor = self.bkColor;
    
    
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
    }
    return _label;
}

+ (instancetype)labelWithText:(NSString *)text origin:(CGPoint)orgin{
    
    LZLabelView *labelView = [[LZLabelView alloc] initWithFrame:CGRectMake(orgin.x, orgin.y, 0, 0)];
    labelView.text = text;
    labelView.textColor = [UIColor whiteColor];
    labelView.bkColor = [UIColor blackColor];
    labelView.textFont = [UIFont fontWithName:LZFontNameBold size:8];
    
    labelView.left = 10;
    labelView.right = 10;
    labelView.top = 2;
    labelView.bottom = 2;
    [labelView buildview];
    
    
    return labelView;
    
    
}
@end

//
//  LZStringPathView.m
//  LZWeather
//
//  Created by comst on 15/11/16.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZStringPathView.h"
#import "UIBezierPath+TextPaths.h"
@interface LZStringPathView ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation LZStringPathView

- (void)buildView{
    
    if (self.text == nil || [self.text length] == 0) {
        return;
    }
    self.shapeLayer = [[CAShapeLayer alloc] init];
    self.shapeLayer.frame = self.bounds;
    self.shapeLayer.lineJoin = kCALineCapRound;
    self.shapeLayer.lineWidth = self.textWidth > 0 ? self.textWidth : 0.5;
    self.shapeLayer.strokeColor = self.textColor ? self.textColor.CGColor : [UIColor blackColor].CGColor;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    UIFont *font = self.textFont ? self.textFont : [UIFont systemFontOfSize:18];
    CGFloat lineWidth = self.textWidth > 0 ? self.textWidth : 0.5;
    //UIColor *textColor = self.textColor ? self.textColor : [UIColor blackColor];
    
    self.shapeLayer.path = [UIBezierPath pathForMultilineString:self.text withFont:font maxWidth:self.bounds.size.width textAlignment:NSTextAlignmentCenter].CGPath;
    self.shapeLayer.bounds = CGPathGetBoundingBox(self.shapeLayer.path);
    self.shapeLayer.geometryFlipped = YES;
    
    self.shapeLayer.strokeEnd = 0;
    
    [self.layer addSublayer:self.shapeLayer];
    
}

- (void)percentage:(CGFloat)percent animated:(BOOL)animated{
 
    if (animated) {
        if (percent <= 0 ) {
            
            self.shapeLayer.strokeEnd = 0;
            
        }else if (percent >= 1){
            
            self.shapeLayer.strokeEnd = 1;
            
        }else{
        
            self.shapeLayer.strokeEnd = percent;
        }
        
        
    }else{
        
        if (percent <= 0 ) {
            [CATransaction setDisableActions:YES];
            self.shapeLayer.strokeEnd = 0;
            [CATransaction setDisableActions:NO];
            
        }else if (percent >= 1){
            [CATransaction setDisableActions:YES];
            self.shapeLayer.strokeEnd = 1;
            [CATransaction setDisableActions:NO];
        }else{
            [CATransaction setDisableActions:YES];
            self.shapeLayer.strokeEnd = percent;
            [CATransaction setDisableActions:NO];
        }

                
    }
    
    
}
@end

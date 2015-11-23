//
//  LZNumberCount.h
//  LZWeather
//
//  Created by comst on 15/11/22.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "POP.h"
#import "NSString+RichText.h"
#import "LZCommon.h"
#import "AppColor.h"
#import "LZFont.h"

@class LZNumberCount;

@protocol LZNumberCountProtocal <NSObject>

- (void)numberCount:(LZNumberCount *)numberCount currentNumber:(NSNumber *)number;

- (void)numberCount:(LZNumberCount *)numberCount currentString:(NSAttributedString *)string;

@end

@interface LZNumberCount : NSObject

@property (nonatomic, weak) id<LZNumberCountProtocal>  delegate;

@property (nonatomic, strong) POPBasicAnimation *countAnimation;

@property (nonatomic, strong) NSNumber *fromeValue;
@property (nonatomic, strong) NSNumber *toValue;

@property (nonatomic, strong) NSNumber *duration;

- (void)startAnimation;


@end

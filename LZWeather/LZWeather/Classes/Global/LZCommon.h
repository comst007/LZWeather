//
//  LZCommon.h
//  LZWeather
//
//  Created by comst on 15/11/13.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#ifndef LZWeather_LZCommon_h
#define LZWeather_LZCommon_h

// 宽度
#define  LZWidth                             [UIScreen mainScreen].bounds.size.width

// 高度
#define  LZHeight                            [UIScreen mainScreen].bounds.size.height

// 状态栏高度
#define  LZStatusBarHeight                   20.f

// 导航栏高度
#define  LZNavigationBarHeight               44.f

// 标签栏高度
#define  LZTabbarHeight                      49.f

// 状态栏高度 + 导航栏高度
#define  LZStatusBarAndNavigationBarHeight   (20.f + 44.f)

#define  iPhone4_4s   (LZWidth == 320.f && LZHeight == 480.f ? YES : NO)
#define  iPhone5_5s   (LZWidth == 320.f && LZHeight == 568.f ? YES : NO)
#define  iPhone6      (LZWidth == 375.f && LZHeight == 667.f ? YES : NO)
#define  iPhone6_plus (LZWidth == 414.f && LZHeight == 736.f ? YES : NO)

#define  RADIAN(degrees) (M_PI * (degrees)/180.f)

#define DEGREES(radian) ((radian) * 180.f / M_PI)

#endif

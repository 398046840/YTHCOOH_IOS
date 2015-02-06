//
//  BarChartCell.h
//  YTHCOOH_IOS
//
//  Created by afable on 15/1/11.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BarChartCell : NSObject

@property (nonatomic, strong) UIImageView *barChart;
@property (nonatomic, strong) UILabel *value;
@property (nonatomic, strong) UILabel *time;

- (BarChartCell *)initBarChartCellWithPoint:(CGPoint)point inView:(UIView *)view atIndex:(int)index;

- (void)fixBarChartCorolAndFrame:(NSString *)value withSubject:(NSString *)subject;
- (void)fixBarChartValueAndTimeLabelWithValue:(NSString *)value andTime:(NSString *)time withSubject:(NSString *)subject;

@end

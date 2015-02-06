//
//  BarChart.h
//  YTHCOOH_IOS
//
//  Created by afable on 15/1/11.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BarChartCell.h"

@interface BarChart : NSObject

@property (nonatomic, strong) BarChartCell *barChartCell1;
@property (nonatomic, strong) BarChartCell *barChartCell2;
@property (nonatomic, strong) BarChartCell *barChartCell3;
@property (nonatomic, strong) BarChartCell *barChartCell4;
@property (nonatomic, strong) BarChartCell *barChartCell5;
@property (nonatomic, strong) BarChartCell *barChartCell6;
@property (nonatomic, strong) BarChartCell *barChartCell7;
@property (nonatomic, strong) BarChartCell *barChartCell8;
@property (nonatomic, strong) BarChartCell *barChartCell9;
@property (nonatomic, strong) BarChartCell *barChartCell10;
@property (nonatomic, strong) BarChartCell *barChartCell11;
@property (nonatomic, strong) BarChartCell *barChartCell12;
@property (nonatomic, strong) BarChartCell *barChartCell13;
@property (nonatomic, strong) BarChartCell *barChartCell14;
@property (nonatomic, strong) BarChartCell *barChartCell15;

- (BarChart *)initBarChartWithPoint:(CGPoint)point inView:(UIView *)view;
- (void)refreshBarChartWithData:(NSMutableArray *)array andSubject:(NSString *)subject;

@end

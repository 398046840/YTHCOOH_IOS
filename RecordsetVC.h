//
//  RecordsetVC.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-8.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarChart.h"

@interface RecordsetVC : UIViewController

@property (nonatomic, strong) UIScrollView *scrollview;

@property (nonatomic, strong) UILabel *location;
@property (nonatomic, strong) UILabel *formaldehyde;
@property (nonatomic, strong) UILabel *PM2;
@property (nonatomic, strong) UILabel *PM10;
@property (nonatomic, strong) UILabel *TVOCE;
@property (nonatomic, strong) UILabel *temperature;
@property (nonatomic, strong) UILabel *humidity;

@property (nonatomic, strong) BarChart *PM2BarChart;
@property (nonatomic, strong) BarChart *PM10BarChart;
@property (nonatomic, strong) BarChart *formaldehydeBarChart;
@property (nonatomic, strong) BarChart *TVOCBarChart;
@property (nonatomic, strong) BarChart *temperatureBarChart;
@property (nonatomic, strong) BarChart *humidityBarChart;


@property (nonatomic, strong) UIImageView *BGLine;

- (void)refreshFirstGroupData;
- (void)refreshBarChartWithLocation:(int)location andLength:(int)length;

@end

//
//  TestVC.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-14.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFChart.h"

@interface recordingsVC : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@property (strong, nonatomic) IBOutlet UIImageView *BG1;
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIImageView *line;

@property (strong, nonatomic)  UILabel *currentFormaldehyde;
@property (strong, nonatomic)  UILabel *currentPM2;
@property (strong, nonatomic)  UILabel *currentPM10;
@property (strong, nonatomic)  UILabel *currentTemperature;
@property (strong, nonatomic)  UILabel *currentHumidity;
@property (strong, nonatomic)  UILabel *currentTVOC;

@property (strong, nonatomic) IBOutlet UIButton *lastPage;
@property (strong, nonatomic) IBOutlet UIButton *nextPage;

@property (strong, nonatomic)  UILabel *titleFormaldehyde;
@property (strong, nonatomic)  UILabel *titlePM2;
@property (strong, nonatomic)  UILabel *titlePM10;
@property (strong, nonatomic)  UILabel *titleTemp;
@property (strong, nonatomic)  UILabel *titleHumidity;
@property (strong, nonatomic)  UILabel *titleTVOC;

@property (strong, nonatomic)  UIView *PM2;
@property (strong, nonatomic)  UIView *PM10;
@property (strong, nonatomic)  UIView *formaldehyde;
@property (strong, nonatomic)  UIView *TVOC;
@property (strong, nonatomic)  UIView *temperature;
@property (strong, nonatomic)  UIView *humidity;

@property (nonatomic, strong) AFChart *PM2Chart;
@property (nonatomic, strong) AFChart *PM10Chart;
@property (nonatomic, strong) AFChart *formaldehydeChart;
@property (nonatomic, strong) AFChart *TVOCChart;
@property (nonatomic, strong) AFChart *temperatureChart;
@property (nonatomic, strong) AFChart *humidityChart;

- (IBAction)lastPage:(id)sender;
- (IBAction)nextPage:(id)sender;
- (IBAction)refreshRecords:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *currentPage;

- (void)refreshRecordingsWithLocation:(int)location andLength:(int)length;

@end

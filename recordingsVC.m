//
//  TestVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-14.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "recordingsVC.h"
#import "AFChart.h"
#import "AppDelegate.h"

#define CC_DEGREES_TO_RADIANS(__ANGLE__) ((__ANGLE__) * 0.01745329252f)
#define KlineHeight 20
#define KlineWidth 30

@interface recordingsVC ()

@end

@implementation recordingsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self appDelegate].recordingsVC = self;
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"LoginButton"] forBarMetrics:UIBarMetricsDefault];
    
    [self.PM2 setHidden:YES];
    [self.PM10 setHidden:YES];
    [self.formaldehyde setHidden:YES];
    [self.TVOC setHidden:YES];
    [self.temperature setHidden:YES];
    [self.humidity setHidden:YES];
    
//    [self.BG1.layer setMasksToBounds:YES];
//    [self.BG1.layer setCornerRadius:8];
//    [self.BG1.layer setBorderWidth:0.4];
    
    self.lastPage.backgroundColor = [UIColor clearColor];
    self.nextPage.backgroundColor = [UIColor clearColor];
    
    [self.lastPage setEnabled:NO];
    [self.nextPage setEnabled:NO];
    
    self.scrollView.frame = CGRectMake(self.scrollView.frame.origin.x, self.scrollView.frame.origin.y,self.scrollView.frame.size.width, [UIScreen mainScreen].bounds.size.height - 44 - 64 - self.scrollView.frame.origin.y - 5);
    self.scrollView.contentSize = CGSizeMake(1055, 600);
    
    if (!([[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] == nil)) {
        
        [[self appDelegate].handler.connectingServer loadingDeviceRecordWithCurrentDeviceMACWithViewController:self];
    }
    
    
    self.PM2 = [self TittleWithStr:@"PM2.5" andPoint:CGPointMake(-100, 10) inView:self.scrollView];
    self.PM10 = [self TittleWithStr:@"PM10" andPoint:CGPointMake(-100, 10) inView:self.scrollView];
    self.formaldehyde = [self TittleWithStr:@"甲醛" andPoint:CGPointMake(-100, 10) inView:self.scrollView];
    self.TVOC = [self TittleWithStr:@"TVOC" andPoint:CGPointMake(-100, 10) inView:self.scrollView];
    self.temperature = [self TittleWithStr:@"温度" andPoint:CGPointMake(-100, 10) inView:self.scrollView];
    self.humidity = [self TittleWithStr:@"湿度" andPoint:CGPointMake(-100, 10) inView:self.scrollView];
    
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
    
    
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)viewWillAppear:(BOOL)animated
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] == nil) {
        
        [self.view makeToast:@"您还没选择设备,请先选择" duration:2.0 position:CSToastPositionCenter];
        [self setToNil];
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
        [self.lastPage setEnabled:NO];
        [self.nextPage setEnabled:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setToNil
{
    
    [self.currentFormaldehyde setHidden:NO];
    [self.currentPM2 setHidden:NO];
    [self.currentPM10 setHidden:NO];
    [self.currentTemperature setHidden:NO];
    [self.currentHumidity setHidden:NO];
    [self.currentTVOC setHidden:NO];
    
    [self.titleFormaldehyde setHidden:NO];
    [self.titlePM2 setHidden:NO];
    [self.titlePM10 setHidden:NO];
    [self.titleTemp setHidden:NO];
    [self.titleHumidity setHidden:NO];
    [self.titleTVOC setHidden:NO];
    
    self.location.text = @"----";
    self.location.textColor = [UIColor blackColor];
    self.currentFormaldehyde.text = @"----";
    self.currentFormaldehyde.textColor = [UIColor blackColor];
    self.currentPM2.text = @"----";
    self.currentPM2.textColor = [UIColor blackColor];
    self.currentPM10.text = @"----";
    self.currentPM10.textColor = [UIColor blackColor];
    self.currentTemperature.text =@"----";
    self.currentTemperature.textColor = [UIColor blackColor];
    self.currentHumidity.text = @"----";
    self.currentHumidity.textColor = [UIColor blackColor];
    self.currentTVOC.text = @"----";
    self.currentTVOC.textColor = [UIColor blackColor];
    
    [self.formaldehyde setHidden:YES];
    [self.PM2 setHidden:YES];
    [self.PM10 setHidden:YES];
    [self.temperature setHidden:YES];
    [self.humidity setHidden:YES];
    [self.TVOC setHidden:YES];
    
    if (self.formaldehydeChart != nil) {
        
        [self.formaldehydeChart removeFromSuperview];
    }
    
    if (self.PM2Chart != nil) {
        
        [self.PM2Chart removeFromSuperview];
    }
    
    if (self.PM10Chart != nil) {
        
        [self.PM10Chart removeFromSuperview];
    }
    
    if (self.temperatureChart != nil) {
        
        [self.temperatureChart removeFromSuperview];
    }
    
    if (self.humidityChart != nil) {
        
        [self.humidityChart removeFromSuperview];
    }
    
    if (self.TVOCChart != nil) {
        
        [self.TVOCChart removeFromSuperview];
    }
}

- (IBAction)lastPage:(id)sender {
    
    int currentPage = [[self.currentPage.text stringByReplacingOccurrencesOfString:@"/7" withString:@""] intValue];
    
    switch (currentPage) {
        case 1:
            ;
            break;
        case 2:
            [self refreshRecordingsWithLocation:0 andLength:15];
            self.currentPage.text = @"1/7";
            break;
        case 3:
            [self refreshRecordingsWithLocation:15 andLength:30];
            self.currentPage.text = @"2/7";
            break;
        case 4:
            [self refreshRecordingsWithLocation:30 andLength:45];
            self.currentPage.text = @"3/7";
            break;
        case 5:
            [self refreshRecordingsWithLocation:45 andLength:60];
            self.currentPage.text = @"4/7";
            break;
        case 6:
            [self refreshRecordingsWithLocation:60 andLength:75];
            self.currentPage.text = @"5/7";
            break;
        case 7:
            [self refreshRecordingsWithLocation:75 andLength:90];
            self.currentPage.text = @"6/7";
            break;
        default:
            break;
    }
    
}

- (IBAction)nextPage:(id)sender {
    
    int currentPage = [[self.currentPage.text stringByReplacingOccurrencesOfString:@"/7" withString:@""] intValue];
    
    switch (currentPage) {
        case 1:
            [self refreshRecordingsWithLocation:15 andLength:30];
            self.currentPage.text = @"2/7";
            break;
        case 2:
            [self refreshRecordingsWithLocation:30 andLength:45];
            self.currentPage.text = @"3/7";
            break;
        case 3:
            [self refreshRecordingsWithLocation:45 andLength:60];
            self.currentPage.text = @"4/7";
            break;
        case 4:
            [self refreshRecordingsWithLocation:60 andLength:75];
            self.currentPage.text = @"5/7";
            break;
        case 5:
            [self refreshRecordingsWithLocation:75 andLength:90];
            self.currentPage.text = @"6/7";
            break;
        case 6:
            [self refreshRecordingsWithLocation:90 andLength:99];
            self.currentPage.text = @"7/7";
            break;
        case 7:
            
            break;
        default:
            break;
    }
    
}

- (IBAction)refreshRecords:(id)sender {
    
    [[self appDelegate].handler.connectingServer loadingDeviceRecordWithCurrentDeviceMACWithViewController:self];
}

- (UIView *)TittleWithStr:(NSString *)tittle andPoint:(CGPoint)point inView:(UIView *)view
{
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 84, 30)];
    
    UIImageView *BG = [[UIImageView alloc] init];
    BG.image = [UIImage imageNamed:@"LevelColor_Green"];
    BG.frame = CGRectMake(0, 0, 84, 30);
    [tempView addSubview:BG];

    UILabel *PM2 = [[UILabel alloc] init];
    PM2.backgroundColor = [UIColor clearColor];
    PM2.text = tittle;
    PM2.textColor = [UIColor whiteColor];
    PM2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15];

    [PM2 setFrame:CGRectMake(2, 0 , 52, 30)];
    [tempView addSubview:PM2];

    UIImageView *BG2 = [[UIImageView alloc] init];
    BG2.image = [UIImage imageNamed:@"LevelColor_White"];
    BG2.frame = CGRectMake(52, 2, 30, 26);
    [tempView addSubview:BG2];

    UILabel *part1 = [[UILabel alloc] init];
    part1.text = @"最近";
    part1.textColor = [UIColor colorWithRed:138/255.0 green:215/255.0 blue:67/255.0 alpha:1.0];
    part1.backgroundColor = [UIColor clearColor];
    part1.font = [UIFont systemFontOfSize:9];

    part1.frame = CGRectMake(57, 2, 20, 12);
    [tempView addSubview:part1];

    UILabel *part2 = [[UILabel alloc] init];
    part2.text = @"记录值";
    part2.textColor = [UIColor colorWithRed:138/255.0 green:215/255.0 blue:67/255.0 alpha:1.0];
    part2.backgroundColor = [UIColor clearColor];
    part2.font = [UIFont systemFontOfSize:9];

    part2.frame = CGRectMake(54, 16, 27, 9);
    [tempView addSubview:part2];
    
    [view addSubview:tempView];
    return tempView;
}

- (void)refreshRecordingsWithLocation:(int)location andLength:(int)length
{
    if (![self.lastPage isEnabled]) {
        
        [self.lastPage setEnabled:YES];
    }
    
    if (![self.nextPage isEnabled]) {
        
        [self.nextPage setEnabled:YES];
    }
    
    
    if ([self appDelegate].handler.recordDataDic == nil) {
        
        [self.view makeToast:@"加载失败,请稍后再试" duration:1.5 position:CSToastPositionCenter];
        return;
    }
    
    if (location == 0) {
        self.currentPage.text = @"1/7";
    }
    
    //    if ([self.navigationItem.rightBarButtonItem isEnabled] == NO) {
    //
    //        [self.navigationItem.rightBarButtonItem setEnabled:YES];
    //    }
    
    self.location.text = [[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICELocation];
    
    if ([[self appDelegate].handler.recordDataDic objectForKey:kFORMALDEHYDE] != nil) {
        
        [self.currentFormaldehyde setHidden:NO];
        [self.titleFormaldehyde setHidden:NO];
        
        self.currentFormaldehyde.text = [NSString stringWithFormat:@"%@mg/m³",[[[[self appDelegate].handler.recordDataDic objectForKey:kFORMALDEHYDE] objectAtIndex:0] objectForKey:@"Value"]];
        self.currentFormaldehyde.textColor = [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[[[self appDelegate].handler.recordDataDic objectForKey:kFORMALDEHYDE] objectAtIndex:0] objectForKey:@"Value"] inType:kFORMALDEHYDE];
    } else {
        
//        self.currentFormaldehyde.text = @"----mg/m³";
//        self.currentFormaldehyde.textColor = [UIColor blackColor];
        [self.currentFormaldehyde setHidden:YES];
        [self.titleFormaldehyde setHidden:YES];
        
    }
    
    if ([[self appDelegate].handler.recordDataDic objectForKey:kPM] != nil) {
        
        [self.currentPM2 setHidden:NO];
        [self.titlePM2 setHidden:NO];
        
        self.currentPM2.text = [NSString stringWithFormat:@"%@ug/m³",[[[[self appDelegate].handler.recordDataDic objectForKey:kPM] objectAtIndex:0] objectForKey:@"Value"]];
        self.currentPM2.textColor = [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[[[self appDelegate].handler.recordDataDic objectForKey:kPM] objectAtIndex:0] objectForKey:@"Value"] inType:kPM];
    } else {
        
//        self.currentPM2.text = @"----ug/m³";
//        self.currentPM2.textColor = [UIColor blackColor];
        [self.currentPM2 setHidden:YES];
        [self.titlePM2 setHidden:YES];
        
    }
    
    if ([[self appDelegate].handler.recordDataDic objectForKey:kPM10] != nil) {
        
        [self.currentPM10 setHidden:NO];
        [self.titlePM10 setHidden:NO];
        
        self.currentPM10.text = [NSString stringWithFormat:@"%@ug/m³",[[[[self appDelegate].handler.recordDataDic objectForKey:kPM10] objectAtIndex:0] objectForKey:@"Value"]];
        self.currentPM10.textColor = [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[[[self appDelegate].handler.recordDataDic objectForKey:kPM10] objectAtIndex:0] objectForKey:@"Value"] inType:kPM10];
    } else {
        
//        self.currentPM10.text = @"----mg/m³";
//        self.currentPM10.textColor = [UIColor blackColor];
        [self.currentPM10 setHidden:YES];
        [self.titlePM10 setHidden:YES];
        
    }
    
    if ([[self appDelegate].handler.recordDataDic objectForKey:kTEMPERATURE] != nil) {
        
        [self.currentTemperature setHidden:NO];
        [self.titleTemp setHidden:NO];
        
        self.currentTemperature.text = [NSString stringWithFormat:@"%@°",[[[[self appDelegate].handler.recordDataDic objectForKey:kTEMPERATURE] objectAtIndex:0] objectForKey:@"Value"]];
        self.currentTemperature.textColor = [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[[[self appDelegate].handler.recordDataDic objectForKey:kTEMPERATURE] objectAtIndex:0] objectForKey:@"Value"] inType:kTEMPERATURE];
    } else {
        
//        self.currentTemperature.text = @"----°";
//        self.currentTemperature.textColor = [UIColor blackColor];
        [self.currentTemperature setHidden:YES];
        [self.titleTemp setHidden:YES];
        
    }
    
    
    if ([[self appDelegate].handler.recordDataDic objectForKey:kHUMIDITY] != nil) {
        
        [self.currentHumidity setHidden:NO];
        [self.titleHumidity setHidden:NO];
        
        self.currentHumidity.text = [NSString stringWithFormat:@"%@%%",[[[[self appDelegate].handler.recordDataDic objectForKey:kHUMIDITY] objectAtIndex:0] objectForKey:@"Value"]];
        self.currentHumidity.textColor = [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[[[self appDelegate].handler.recordDataDic objectForKey:kHUMIDITY] objectAtIndex:0] objectForKey:@"Value"] inType:kHUMIDITY];
    } else {
        
//        self.currentHumidity.text = @"----%";
//        self.currentHumidity.textColor = [UIColor blackColor];
        [self.currentHumidity setHidden:YES];
        [self.titleHumidity setHidden:YES];
        
    }
    
    if ([[self appDelegate].handler.recordDataDic objectForKey:KVOC] != nil) {
        
        [self.currentTVOC setHidden:NO];
        [self.titleTVOC setHidden:NO];
        
        self.currentTVOC.text = [NSString stringWithFormat:@"%@mg/m³",[[[[self appDelegate].handler.recordDataDic objectForKey:KVOC] objectAtIndex:0] objectForKey:@"Value"]];
        self.currentTVOC.textColor = [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[[[self appDelegate].handler.recordDataDic objectForKey:KVOC] objectAtIndex:0] objectForKey:@"Value"] inType:KVOC];
    } else {
        
//        self.currentTVOC.text = @"----mg/m³";
//        self.currentTVOC.textColor = [UIColor blackColor];
        [self.currentTVOC setHidden:YES];
        [self.titleTVOC setHidden:YES];
        
    }
    
    
    [self.formaldehyde setHidden:YES];
    [self.PM2 setHidden:YES];
    [self.PM10 setHidden:YES];
    [self.temperature setHidden:YES];
    [self.humidity setHidden:YES];
    [self.TVOC setHidden:YES];
    
    if ([[self appDelegate].handler.currentDeviceType isEqualToString:@"YT133"]) {
        
        NSMutableArray *tempArray;
        NSMutableArray *temp1;
        
        //设置甲醛图表
        [self.formaldehyde setHidden:NO];
        self.formaldehyde.frame = CGRectMake(5, 5, self.formaldehyde.frame.size.width, self.formaldehyde.frame.size.height);
        
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kFORMALDEHYDE]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        
        if (self.formaldehydeChart != nil) {
            
            [self.formaldehydeChart removeFromSuperview];
        }
        
        
        
        self.formaldehydeChart = [[AFChart alloc] initWithFrame:CGRectMake(0, 30, 1055, 145) andDataY:@[@"",@"0.1",@"",@"0.3",@"",@"0.5",@"",@"0.7",@"",@"0.9",@"1.0"] andPointData:temp1 andSubject:kFORMALDEHYDE];
        [self.scrollView addSubview:self.formaldehydeChart];
        
        
        
        //设置PM2图表
        [self.PM2 setHidden:NO];
        self.PM2.frame = CGRectMake(5, 180, self.PM2.frame.size.width, self.PM2.frame.size.height);
        
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kPM]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.PM2Chart != nil) {
            
            [self.PM2Chart removeFromSuperview];
        }
        self.PM2Chart = [[AFChart alloc] initWithFrame:CGRectMake(0, 205, 1055, 145) andDataY:@[@"",@"25",@"",@"75",@"",@"125",@"",@"175",@"",@"225",@"250"] andPointData:temp1 andSubject:kPM];
        [self.scrollView addSubview:self.PM2Chart];
        
        
        //设置TVOC图表
        [self.TVOC setHidden:NO];
        self.TVOC.frame = CGRectMake(5, 355, self.TVOC.frame.size.width, self.TVOC.frame.size.height);
        
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:KVOC]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.TVOCChart != nil) {
            
            [self.TVOCChart removeFromSuperview];
        }
        self.TVOCChart = [[AFChart alloc] initWithFrame:CGRectMake(0, 380, 1055, 145) andDataY:@[@"",@"0.2",@"",@"0.6",@"",@"1.0",@"",@"1.4",@"",@"1.8",@"2.0"] andPointData:temp1 andSubject:KVOC];
        [self.scrollView addSubview:self.TVOCChart];
        
        
        //设置温度图表
        [self.temperature setHidden:NO];
        self.temperature.frame = CGRectMake(5, 530, self.temperature.frame.size.width, self.temperature.frame.size.height);
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kTEMPERATURE]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.temperatureChart != nil) {
            
            [self.temperatureChart removeFromSuperview];
        }
        self.temperatureChart = [[AFChart alloc] initWithFrame:CGRectMake(0, 555, 1055, 145) andDataY:@[@"",@"5",@"",@"15",@"",@"25",@"",@"35",@"",@"45",@"50"] andPointData:temp1 andSubject:kTEMPERATURE];
        [self.scrollView addSubview:self.temperatureChart];
        
        
        //设置湿度
        [self.humidity setHidden:NO];
        self.humidity.frame = CGRectMake(5, 705, self.humidity.frame.size.width, self.humidity.frame.size.height);
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kHUMIDITY]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.humidityChart != nil) {
            
            [self.humidityChart removeFromSuperview];
        }
        self.humidityChart = [[AFChart alloc] initWithFrame:CGRectMake(0, 730, 1055, 145) andDataY:@[@"",@"10",@"",@"30",@"",@"50",@"",@"70",@"",@"90",@"100"] andPointData:temp1 andSubject:kHUMIDITY];
        [self.scrollView addSubview:self.humidityChart];
        
        if (self.PM10Chart != nil) {
            
            [self.PM10Chart removeFromSuperview];
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, 880);
        
        
    } else if ([[self appDelegate].handler.currentDeviceType isEqualToString:@"YT631"]) {
        
        NSMutableArray *tempArray;
        NSMutableArray *temp1;
        
        
        
        //设置PM2图表
        [self.PM2 setHidden:NO];
        self.PM2.frame = CGRectMake(5, 5, self.PM2.frame.size.width, self.PM2.frame.size.height);
        
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kPM]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.PM2Chart != nil) {
            
            [self.PM2Chart removeFromSuperview];
        }
        self.PM2Chart = [[AFChart alloc] initWithFrame:CGRectMake(0, 30, 1055, 145) andDataY:@[@"",@"25",@"",@"75",@"",@"125",@"",@"175",@"",@"225",@"250"] andPointData:temp1 andSubject:kPM];
        [self.scrollView addSubview:self.PM2Chart];
        
        
        //设置PM10图表
        [self.PM10 setHidden:NO];
        self.PM10.frame = CGRectMake(5, 180, self.PM10.frame.size.width, self.PM10.frame.size.height);
        
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kPM10]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.PM10Chart != nil) {
            
            [self.PM10Chart removeFromSuperview];
        }
        self.PM10Chart = [[AFChart alloc] initWithFrame:CGRectMake(0, 205, 1055, 145) andDataY:@[@"",@"25",@"",@"75",@"",@"125",@"",@"175",@"",@"225",@"250"] andPointData:temp1 andSubject:kPM10];
        [self.scrollView addSubview:self.PM10Chart];
        
        
        
        //设置温度图表
        [self.temperature setHidden:NO];
        self.temperature.frame = CGRectMake(5, 355, self.temperature.frame.size.width, self.temperature.frame.size.height);
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kTEMPERATURE]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.temperatureChart != nil) {
            
            [self.temperatureChart removeFromSuperview];
        }
        self.temperatureChart = [[AFChart alloc] initWithFrame:CGRectMake(0, 380, 1055, 145) andDataY:@[@"",@"5",@"",@"15",@"",@"25",@"",@"35",@"",@"45",@"50"] andPointData:temp1 andSubject:kTEMPERATURE];
        [self.scrollView addSubview:self.temperatureChart];
        
        
        //设置湿度
        [self.humidity setHidden:NO];
        self.humidity.frame = CGRectMake(5, 530, self.humidity.frame.size.width, self.humidity.frame.size.height);
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kHUMIDITY]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.humidityChart != nil) {
            
            [self.humidityChart removeFromSuperview];
        }
        self.humidityChart = [[AFChart alloc] initWithFrame:CGRectMake(0, 555, 1055, 145) andDataY:@[@"",@"10",@"",@"30",@"",@"50",@"",@"70",@"",@"90",@"100"] andPointData:temp1 andSubject:kHUMIDITY];
        [self.scrollView addSubview:self.humidityChart];
        
        
        //去掉甲醛与TVOCE
        if (self.TVOCChart != nil) {
            
            [self.TVOCChart removeFromSuperview];
        }
        if (self.formaldehydeChart != nil) {
            
            [self.formaldehydeChart removeFromSuperview];
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, 705);
        
    } else if ([[self appDelegate].handler.currentDeviceType isEqualToString:@"YT633"]) {
        
        NSMutableArray *tempArray;
        NSMutableArray *temp1;
        
        //设置甲醛图表
        [self.formaldehyde setHidden:NO];
        self.formaldehyde.frame = CGRectMake(5, 5, self.formaldehyde.frame.size.width, self.formaldehyde.frame.size.height);
        
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kFORMALDEHYDE]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        
        if (self.formaldehydeChart != nil) {
            
            [self.formaldehydeChart removeFromSuperview];
        }
        
        self.formaldehydeChart = [[AFChart alloc] initWithFrame:CGRectMake(0, 30, 1055, 145) andDataY:@[@"",@"0.1",@"",@"0.3",@"",@"0.5",@"",@"0.7",@"",@"0.9",@"1.0"] andPointData:temp1 andSubject:kFORMALDEHYDE];
        [self.scrollView addSubview:self.formaldehydeChart];
        
        
        
        //设置PM2图表
        [self.PM2 setHidden:NO];
        self.PM2.frame = CGRectMake(5, 180, self.PM2.frame.size.width, self.PM2.frame.size.height);
        
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kPM]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.PM2Chart != nil) {
            
            [self.PM2Chart removeFromSuperview];
        }
        self.PM2Chart = [[AFChart alloc] initWithFrame:CGRectMake(0, 205, 1055, 145) andDataY:@[@"",@"25",@"",@"75",@"",@"125",@"",@"175",@"",@"225",@"250"] andPointData:temp1 andSubject:kPM];
        [self.scrollView addSubview:self.PM2Chart];
        
        
        //设置PM10图表
        [self.PM10 setHidden:NO];
        self.PM10.frame = CGRectMake(5, 355, self.PM10.frame.size.width, self.PM10.frame.size.height);
        
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kPM10]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.PM10Chart != nil) {
            
            [self.PM10Chart removeFromSuperview];
        }
        self.PM10Chart = [[AFChart alloc] initWithFrame:CGRectMake(0, 380, 1055, 145) andDataY:@[@"",@"25",@"",@"75",@"",@"125",@"",@"175",@"",@"225",@"250"] andPointData:temp1 andSubject:kPM10];
        [self.scrollView addSubview:self.PM10Chart];
        
        
        //设置温度图表
        [self.temperature setHidden:NO];
        self.temperature.frame = CGRectMake(5, 530, self.temperature.frame.size.width, self.temperature.frame.size.height);
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kTEMPERATURE]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.temperatureChart != nil) {
            
            [self.temperatureChart removeFromSuperview];
        }
        self.temperatureChart = [[AFChart alloc] initWithFrame:CGRectMake(0, 555, 1055, 145) andDataY:@[@"",@"5",@"",@"15",@"",@"25",@"",@"35",@"",@"45",@"50"] andPointData:temp1 andSubject:kTEMPERATURE];
        [self.scrollView addSubview:self.temperatureChart];
        
        
        //设置湿度
        [self.humidity setHidden:NO];
        self.humidity.frame = CGRectMake(5, 705, self.humidity.frame.size.width, self.humidity.frame.size.height);
        tempArray = [NSMutableArray arrayWithArray:[[self appDelegate].handler.recordDataDic objectForKey:kHUMIDITY]];
        temp1 = [[NSMutableArray alloc] init];
        for (int a = location; a < length; a++) {
            [temp1 addObject:[tempArray objectAtIndex:a]];
        }
        if (self.humidityChart != nil) {
            
            [self.humidityChart removeFromSuperview];
        }
        self.humidityChart = [[AFChart alloc] initWithFrame:CGRectMake(0, 730, 1055, 145) andDataY:@[@"",@"10",@"",@"30",@"",@"50",@"",@"70",@"",@"90",@"100"] andPointData:temp1 andSubject:kHUMIDITY];
        [self.scrollView addSubview:self.humidityChart];
        
        //去掉TVOCE
        if (self.TVOCChart != nil) {
            
            [self.TVOCChart removeFromSuperview];
        }
        
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, 880);
        
    }
    
    
    [self.navigationItem.rightBarButtonItem setEnabled:YES];
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end

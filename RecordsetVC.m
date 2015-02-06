////
////  RecordsetVC.m
////  YTHCOOH_IOS
////
////  Created by 宝发 on 15-1-8.
////  Copyright (c) 2015年 AFABLE. All rights reserved.
////
//
//#import "RecordsetVC.h"
//#import "AppDelegate.h"
//
//@interface RecordsetVC ()
//
//@end
//
//@implementation RecordsetVC
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"LoginButton"] forBarMetrics:UIBarMetricsDefault];
//    
//    [self appDelegate].recordsetVC = self;
//    
//    UIImageView *BG = [[UIImageView alloc] init];
//    self.BGLine = [[UIImageView alloc] init];
//    
//    [self.view addSubview:BG];
//    [self.view addSubview:self.BGLine];
//    
//    [self setUpLabel];
//    
//    self.BGLine.image = [UIImage imageNamed:@"RecordLine"];
//    self.BGLine.frame = CGRectMake(5, self.TVOCE.frame.origin.y + self.TVOCE.frame.size.height + 5, [UIScreen mainScreen].bounds.size.width - 10, 5);
//    
//    BG.image = [UIImage imageNamed:@"MyDeviceCellBG"];
//    BG.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.BGLine.frame.origin.y);
//    
//    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0  ) {
//        
//        self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.BGLine.frame.origin.y + self.BGLine.frame.size.height , [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -  (self.BGLine.frame.origin.y + self.BGLine.frame.size.height + 64 +44 +5))];
//    
//        
//    } else {
//        
//        self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.BGLine.frame.origin.y + self.BGLine.frame.size.height , [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -  (self.BGLine.frame.origin.y + self.BGLine.frame.size.height + 5 + 44))];
//    }
//    
//
//    
//    self.scrollview.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 835);
//    [self.view addSubview:self.scrollview];
//    
//    [self setUpChart];
//    [[self appDelegate].handler.connectingServer loadingDeviceRecordWithCurrentDeviceMAC];
//    
////    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
////    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
////    [refresh addTarget:self action:@selector(refreshCurrentDeviceRecord) forControlEvents:UIControlEventValueChanged];
////    self.scrollview = refresh;
//    
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
////- (void)refreshCurrentDeviceRecord
////{
////    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"加载中..."];
////    
////    
////    [self performSelector:@selector(refreshComplete) withObject:nil afterDelay:3];
////}
////
////- (void)refreshComplete
////{
////    [self.refreshControl endRefreshing];
////    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
////}
//
//- (AppDelegate *)appDelegate
//{
//    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
//}
//
//- (void)refreshFirstGroupData
//{
//    for (int a = 0; a < [self appDelegate].recordDataDic.count; a++) {
//        
//        NSMutableArray *temp = [[NSMutableArray alloc] init];
//        
//        if (a == 0) {
//            
//            NSMutableArray *temp2 = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:kPM]];
//            
//            for (int b = 0; b < 15; b ++) {
//                [temp addObject:[temp2 objectAtIndex:b]];
//            }
//            
//            //            [self initChartWithData:temp2 withPoint:CGPointMake(15, 230) inView:self.scrollview];
//            
//        } else if (a == 1) {
//            
//            NSMutableArray *temp2 = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:kFORMALDEHYDE]];
//            
//            for (int b = 0; b < 15; b ++) {
//                [temp addObject:[temp2 objectAtIndex:b]];
//            }
//            
//            //         [self initChartWithData:temp2 withPoint:CGPointMake(15, 530) inView:self.scrollview];
//            
//        } else if (a == 2) {
//            
//            
//            NSMutableArray *temp2 = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:kTEMPERATURE]];
//            
//            for (int b = 0; b < 15; b ++) {
//                [temp addObject:[temp2 objectAtIndex:b]];
//            }
//            
//            //          [self initChartWithData:temp2 withPoint:CGPointMake(15, 830) inView:self.scrollview];
//            
//        } else if (a == 3) {
//            
//            NSMutableArray *temp2 = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:kHUMIDITY]];
//            
//            for (int b = 0; b < 15; b ++) {
//                [temp addObject:[temp2 objectAtIndex:b]];
//            }
//            
//            //        [self initChartWithData:temp2 withPoint:CGPointMake(15, 980) inView:self.scrollview];
//            
//        } else if (a ==4) {
//            
//            
//            
//            if ([[self appDelegate].currentDeviceType isEqualToString:@"YT133"]) {
//                
//                NSMutableArray *temp2 = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:KVOC]];
//                
//                for (int b = 0; b < 15; b ++) {
//                    [temp addObject:[temp2 objectAtIndex:b]];
//                }
//                
//                //           [self initChartWithData:temp2 withPoint:CGPointMake(15, 680) inView:self.scrollview];
//                
//            } else if ([[self appDelegate].currentDeviceType isEqualToString:@"YT633"]) {
//                
//                NSMutableArray *temp2 = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:KVOC]];
//                
//                for (int b = 0; b < 15; b ++) {
//                    [temp addObject:[temp2 objectAtIndex:b]];
//                }
//                
//                //          [self initChartWithData:temp2 withPoint:CGPointMake(15, 380) inView:self.scrollview];
//                
//            }
//        }
//        
//        
//    }
//}
//
//- (void)setUpLabel
//{
//    self.location = [[UILabel alloc] init];
//    self.location.font = [UIFont systemFontOfSize:13];
//    self.location.backgroundColor = [UIColor clearColor];
//    
//    
//    
////    NSMutableAttributedString *locationStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"检测位置 : %@",[[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICELocation]]];
//    
//        NSMutableAttributedString *locationStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"检测位置 : --"]];
//    
//    [locationStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(7, 2)];
//    self.location.attributedText = locationStr;
//    
//    CGSize locationSize = [locationStr.string sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20]];
//    
//    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
//    
//        [self.location setFrame:CGRectMake(5, 5, locationSize.width, locationSize.height)];
//        
//    } else {
//        
//        [self.location setFrame:CGRectMake(5, 64, locationSize.width, locationSize.height)];
//    }
//    
//    
//    [self.view addSubview:self.location];
//    
//    
//    
//    self.formaldehyde = [[UILabel alloc] init];
//    self.formaldehyde.font = [UIFont systemFontOfSize:11];
//    self.formaldehyde.backgroundColor = [UIColor clearColor];
//    
//    NSMutableAttributedString *formaldehydeStr = [[NSMutableAttributedString alloc] initWithString:@"甲醛:   ----mg/m³"];
//    
//    //    [formaldehydeStr addAttribute:NSForegroundColorAttributeName value:[self appDelegate].formaldehydeColor range:NSMakeRange(6,[self appDelegate].currentFormaldehyde.length)];
//    //    [formaldehydeStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(4,[self appDelegate].currentFormaldehyde.length)];
//    
//    [formaldehydeStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(6,9)];
//    
//    self.formaldehyde.attributedText = formaldehydeStr;
//    
//    CGSize formaldehydeSize = [formaldehydeStr.string sizeWithFont:[UIFont systemFontOfSize:11]];
//    
//    [self.formaldehyde setFrame:CGRectMake(5, self.location.frame.origin.y + self.location.frame.size.height + 10, 100, formaldehydeSize.height)];
//    [self.view addSubview:self.formaldehyde];
//    
//    
//    
//    self.PM2 = [[UILabel alloc] init];
//    self.PM2.font = [UIFont systemFontOfSize:11];
//    self.PM2.backgroundColor = [UIColor clearColor];
//    
//    NSMutableAttributedString *PM2Str = [[NSMutableAttributedString alloc] initWithString:@"PM2.5: ----ug/m³"];
//    
//    [PM2Str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(7,9)];
//    self.PM2.attributedText = PM2Str;
//    
//    CGSize PM2Size = [PM2Str.string sizeWithFont:[UIFont systemFontOfSize:11]];
//    
//    [self.PM2 setFrame:CGRectMake(105, self.formaldehyde.frame.origin.y, 100, PM2Size.height)];
//    [self.view addSubview:self.PM2];
//    
//    
//    
//    self.PM10 = [[UILabel alloc] init];
//    self.PM10.font = [UIFont systemFontOfSize:11];
//    self.PM10.backgroundColor = [UIColor clearColor];
//    
//    NSMutableAttributedString *PM10Str = [[NSMutableAttributedString alloc] initWithString:@"PM10: ----ug/m³"];
//    
//    [PM10Str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(6,9)];
//    self.PM10.attributedText = PM10Str;
//    
//    CGSize PM10Size = [PM10Str.string sizeWithFont:[UIFont systemFontOfSize:11]];
//    
//    [self.PM10 setFrame:CGRectMake(215, self.formaldehyde.frame.origin.y, 100, PM10Size.height)];
//    [self.view addSubview:self.PM10];
//    
//    
//    self.TVOCE = [[UILabel alloc] init];
//    self.TVOCE.font = [UIFont systemFontOfSize:11];
//    self.TVOCE.backgroundColor = [UIColor clearColor];
//    
//    NSMutableAttributedString *TVOCStr = [[NSMutableAttributedString alloc] initWithString:@"TVOC: ----ug/m³"];
//    
//    [TVOCStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(6,9)];
//    self.TVOCE.attributedText = TVOCStr;
//    
//    CGSize TVOCSize = [TVOCStr.string sizeWithFont:[UIFont systemFontOfSize:11]];
//    
//    [self.TVOCE setFrame:CGRectMake(5, self.formaldehyde.frame.origin.y + self.formaldehyde.frame.size.height + 10, 100, TVOCSize.height)];
//    [self.view addSubview:self.TVOCE];
//    
//    
//    
//    self.temperature = [[UILabel alloc] init];
//    self.temperature.font = [UIFont systemFontOfSize:11];
//    self.temperature.backgroundColor = [UIColor clearColor];
//    
//    NSMutableAttributedString *temperatureStr = [[NSMutableAttributedString alloc] initWithString:@"温度:     ----℃"];
//    
//    [temperatureStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(8,5)];
//    self.temperature.attributedText = temperatureStr;
//    
//    CGSize temperatureSize = [TVOCStr.string sizeWithFont:[UIFont systemFontOfSize:11]];
//    
//    [self.temperature setFrame:CGRectMake(105, self.TVOCE.frame.origin.y, 100,temperatureSize.height)];
//    [self.view addSubview:self.temperature];
//    
//    
//    
//    self.humidity = [[UILabel alloc] init];
//    self.humidity.font = [UIFont systemFontOfSize:11];
//    self.humidity.backgroundColor = [UIColor clearColor];
//    
//    NSMutableAttributedString *humidityStr = [[NSMutableAttributedString alloc] initWithString:@"湿度:    ----%"];
//    
//    [humidityStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(7,5)];
//    self.humidity.attributedText = humidityStr;
//    
//    CGSize humiditySize = [humidityStr.string sizeWithFont:[UIFont systemFontOfSize:11]];
//    
//    [self.humidity setFrame:CGRectMake(215, self.TVOCE.frame.origin.y, 100,humiditySize.height)];
//    [self.view addSubview:self.humidity];
//}
//
//- (void)setUpChart
//{
//    
//    [self initTittleWithStr:@"PM2.5" andPoint:CGPointMake(5, 0) inView:self.scrollview];
//    [self initTittleWithStr:@"PM10" andPoint:CGPointMake(5, 140) inView:self.scrollview];
//    [self initTittleWithStr:@"甲醛" andPoint:CGPointMake(5, 280) inView:self.scrollview];
//    [self initTittleWithStr:@"TVOC" andPoint:CGPointMake(5, 420) inView:self.scrollview];
//    [self initTittleWithStr:@"温度" andPoint:CGPointMake(5, 560) inView:self.scrollview];
//    [self initTittleWithStr:@"湿度" andPoint:CGPointMake(5, 700) inView:self.scrollview];
//    
//    self.PM2BarChart = [[BarChart alloc] initBarChartWithPoint:CGPointMake(20, 125) inView:self.scrollview];
//    self.PM10BarChart = [[BarChart alloc] initBarChartWithPoint:CGPointMake(20, 265) inView:self.scrollview];
//    self.formaldehydeBarChart = [[BarChart alloc] initBarChartWithPoint:CGPointMake(20, 405) inView:self.scrollview];
//    self.TVOCBarChart = [[BarChart alloc] initBarChartWithPoint:CGPointMake(20, 545) inView:self.scrollview];
//    self.temperatureBarChart = [[BarChart alloc] initBarChartWithPoint:CGPointMake(20, 685) inView:self.scrollview];
//    self.humidityBarChart = [[BarChart alloc] initBarChartWithPoint:CGPointMake(20, 825) inView:self.scrollview];
//}
//
//- (void)initTittleWithStr:(NSString *)tittle andPoint:(CGPoint)point inView:(UIView *)view
//{
//    UIImageView *BG = [[UIImageView alloc] init];
//    BG.image = [UIImage imageNamed:@"RecordTitleBG"];
//    BG.frame = CGRectMake(point.x, point.y, 130, 40);
//    [view addSubview:BG];
//    
//    UILabel *PM2 = [[UILabel alloc] init];
//    PM2.backgroundColor = [UIColor clearColor];
//    PM2.text = tittle;
//    PM2.textColor = [UIColor whiteColor];
//    PM2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24];
//    CGSize PM2Size = [PM2.text sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:24]];
//    [PM2 setFrame:CGRectMake(BG.frame.origin.x + 5, BG.frame.origin.y + 5 , PM2Size.width, PM2Size.height)];
//    [view addSubview:PM2];
//    
//    UIImageView *BG2 = [[UIImageView alloc] init];
//    BG2.image = [UIImage imageNamed:@"RecordTitleBG2"];
//    BG2.frame = CGRectMake(87, BG.frame.origin.y + 2, 46, 36);
//    [view addSubview:BG2];
//    
//    UILabel *part1 = [[UILabel alloc] init];
//    part1.text = @"最近";
//    part1.textColor = [UIColor greenColor];
//    part1.backgroundColor = [UIColor clearColor];
//    part1.font = [UIFont systemFontOfSize:13];
//    CGSize part1Size = [part1.text sizeWithFont:[UIFont systemFontOfSize:13]];
//    part1.frame = CGRectMake(10, 2, part1Size.width, part1Size.height);
//    [BG2 addSubview:part1];
//    
//    UILabel *part2 = [[UILabel alloc] init];
//    part2.text = @"记录值";
//    part2.textColor = [UIColor greenColor];
//    part2.backgroundColor = [UIColor clearColor];
//    part2.font = [UIFont systemFontOfSize:13];
//    CGSize part2Size = [part2.text sizeWithFont:[UIFont systemFontOfSize:13]];
//    part2.frame = CGRectMake(4, part1.frame.origin.y + part1.frame.size.height + 1, part2Size.width, part2Size.height);
//    [BG2 addSubview:part2];
//}
//
//- (void)refreshBarChartWithLocation:(int)location andLength:(int)length
//{
//    
//    NSMutableAttributedString *locationStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"检测位置 : %@",[[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICELocation]]];
//    
//    [locationStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(7, 2)];
//    self.location.attributedText = locationStr;
//    
//    CGSize locationSize = [locationStr.string sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20]];
//    
//    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
//        
//        [self.location setFrame:CGRectMake(5, 5, locationSize.width, locationSize.height)];
//        
//    } else {
//        
//        [self.location setFrame:CGRectMake(5, 64, locationSize.width, locationSize.height)];
//    }
//    
//    
//    NSMutableArray *tempFormaldehyde = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:kFORMALDEHYDE]];
//    NSMutableArray *temp1 = [[NSMutableArray alloc] init];
//    
//    
//    
//    NSMutableAttributedString *formaldehydeStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"甲醛:   %@mg/m³",[[tempFormaldehyde objectAtIndex:0] objectForKey:@"Value"]]];
//    
//    
//    [formaldehydeStr addAttribute:NSForegroundColorAttributeName value:[[self appDelegate] whatTextColorWithValue:[[tempFormaldehyde objectAtIndex:0] objectForKey:@"Value"] inType:kFORMALDEHYDE] range:NSMakeRange(6,[[[tempFormaldehyde objectAtIndex:0] objectForKey:@"Value"] length] + 5)];
//    [formaldehydeStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(6,[[[tempFormaldehyde objectAtIndex:0] objectForKey:@"Value"] length] + 5)];
//    self.formaldehyde.attributedText = formaldehydeStr;
//    CGSize formaldehydeSize = [formaldehydeStr.string sizeWithFont:[UIFont systemFontOfSize:11]];
//    [self.formaldehyde setFrame:CGRectMake(5, self.location.frame.origin.y + self.location.frame.size.height + 10, 100, formaldehydeSize.height)];
//    
//    
//
//    for (int a = location; a < length; a++) {
//        [temp1 addObject:[tempFormaldehyde objectAtIndex:a]];
//    }
//    [self.formaldehydeBarChart refreshBarChartWithData:temp1 andSubject:kFORMALDEHYDE];
//    
//    
//    NSMutableArray *tempPM2 = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:kPM]];
//    NSMutableArray *temp2 = [[NSMutableArray alloc] init];
//    
//    NSMutableAttributedString *PM2Str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"PM2.5: %@ug/m³",[[tempPM2 objectAtIndex:0] objectForKey:@"Value"]]];
//    [PM2Str addAttribute:NSForegroundColorAttributeName value:[[self appDelegate] whatTextColorWithValue:[[tempPM2 objectAtIndex:0] objectForKey:@"Value"] inType:kPM] range:NSMakeRange(7,[[[tempPM2 objectAtIndex:0] objectForKey:@"Value"] length] + 5)];
//    [PM2Str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(7,[[[tempPM2 objectAtIndex:0] objectForKey:@"Value"] length] + 5)];
//    self.PM2.attributedText = PM2Str;
//    CGSize PM2Size = [PM2Str.string sizeWithFont:[UIFont systemFontOfSize:11]];
//    [self.PM2 setFrame:CGRectMake(105, self.formaldehyde.frame.origin.y, 100, PM2Size.height)];
//    
//    
//    for (int a = location; a < length; a++) {
//        [temp2 addObject:[tempPM2 objectAtIndex:a]];
//    }
//    [self.PM2BarChart refreshBarChartWithData:temp2 andSubject:kPM];
//    
//    
//    
//    NSMutableArray *tempTemperature = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:kTEMPERATURE]];
//    NSMutableArray *temp3 = [[NSMutableArray alloc] init];
//    
//    NSMutableAttributedString *temperatureStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"温度:     %@℃",[[tempTemperature objectAtIndex:0] objectForKey:@"Value"]]];
//    [temperatureStr addAttribute:NSForegroundColorAttributeName value:[[self appDelegate] whatTextColorWithValue:[[tempTemperature objectAtIndex:0] objectForKey:@"Value"] inType:kTEMPERATURE] range:NSMakeRange(8,[[[tempTemperature objectAtIndex:0] objectForKey:@"Value"] length] + 1)];
//    [temperatureStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(8,[[[tempTemperature objectAtIndex:0] objectForKey:@"Value"] length] + 1)];
//    self.temperature.attributedText = temperatureStr;
//    CGSize temperatureSize = [temperatureStr.string sizeWithFont:[UIFont systemFontOfSize:11]];
//    [self.temperature setFrame:CGRectMake(105, self.TVOCE.frame.origin.y, 100,temperatureSize.height)];
//    
//    for (int a = location; a < length; a++) {
//        [temp3 addObject:[tempTemperature objectAtIndex:a]];
//    }
//    [self.temperatureBarChart refreshBarChartWithData:temp3 andSubject:kTEMPERATURE];
//    
//    
//    
//    NSMutableArray *tempHumidity = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:kHUMIDITY]];
//    NSMutableArray *temp4 = [[NSMutableArray alloc] init];
//    
//    NSMutableAttributedString *humidityStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"湿度:    %@%%",[[tempTemperature objectAtIndex:0] objectForKey:@"Value"]]];
//    [humidityStr addAttribute:NSForegroundColorAttributeName value:[[self appDelegate] whatTextColorWithValue:[[tempHumidity objectAtIndex:0] objectForKey:@"Value"] inType:kHUMIDITY] range:NSMakeRange(7,[[[tempHumidity objectAtIndex:0] objectForKey:@"Value"] length] + 1)];
//    [humidityStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(7,[[[tempHumidity objectAtIndex:0] objectForKey:@"Value"] length] + 1)];
//    self.humidity.attributedText = humidityStr;
//    CGSize humiditySize = [humidityStr.string sizeWithFont:[UIFont systemFontOfSize:11]];
//    [self.humidity setFrame:CGRectMake(215, self.TVOCE.frame.origin.y, 100,humiditySize.height)];
//    
//    for (int a = location; a < length; a++) {
//        [temp4 addObject:[tempHumidity objectAtIndex:a]];
//    }
//    [self.humidityBarChart refreshBarChartWithData:temp4 andSubject:kHUMIDITY];
//    
//    
//    NSMutableArray *tempTVOC;
//    NSMutableArray *tempPM10;
//    
//    if ([[[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICETYPE] isEqualToString:@"YT133"]) {
//        
//        tempTVOC = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:KVOC]];
//        NSMutableArray *temp5 = [[NSMutableArray alloc] init];
//        
//        NSMutableAttributedString *TVOCStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"TVOC: %@ug/m³",[[tempTVOC objectAtIndex:0] objectForKey:@"Value"]]];
//        [TVOCStr addAttribute:NSForegroundColorAttributeName value:[[self appDelegate] whatTextColorWithValue:[[tempTVOC objectAtIndex:0] objectForKey:@"Value"] inType:KVOC] range:NSMakeRange(6,[[[tempTVOC objectAtIndex:0] objectForKey:@"Value"] length] + 5)];
//        [TVOCStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(6,[[[tempTVOC objectAtIndex:0] objectForKey:@"Value"] length] + 5)];
//        self.TVOCE.attributedText = TVOCStr;
//        CGSize TVOCSize = [TVOCStr.string sizeWithFont:[UIFont systemFontOfSize:11]];
//        [self.TVOCE setFrame:CGRectMake(5, self.formaldehyde.frame.origin.y + self.formaldehyde.frame.size.height + 10, 100, TVOCSize.height)];
//        
//        
//        NSMutableAttributedString *PM10Str = [[NSMutableAttributedString alloc] initWithString:@"PM10: ----ug/m³"];
//        [PM10Str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(6,9)];
//        self.PM10.attributedText = PM10Str;
//        CGSize PM10Size = [PM10Str.string sizeWithFont:[UIFont systemFontOfSize:11]];
//        [self.PM10 setFrame:CGRectMake(215, self.formaldehyde.frame.origin.y, 100, PM10Size.height)];
//        
//        
//        for (int a = location; a < length; a++) {
//            [temp5 addObject:[tempTVOC objectAtIndex:a]];
//        }
//        [self.TVOCBarChart refreshBarChartWithData:temp5 andSubject:KVOC];
//        
//        [self.PM10BarChart refreshBarChartWithData:nil andSubject:kPM10];
//        
//    } else if ([[[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICETYPE] isEqualToString:@"YT633"]) {
//        
//        tempPM10 = [NSMutableArray arrayWithArray:[[self appDelegate].recordDataDic objectForKey:KVOC]];
//        NSMutableArray *temp6 = [[NSMutableArray alloc] init];
//        
//        NSMutableAttributedString *PM10Str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"PM10: %@ug/m³",[[tempPM10 objectAtIndex:0] objectForKey:@"Value"]]];
//        [PM10Str addAttribute:NSForegroundColorAttributeName value:[[self appDelegate] whatTextColorWithValue:[[tempPM10 objectAtIndex:0] objectForKey:@"Value"] inType:kPM10] range:NSMakeRange(6,[[[tempPM10 objectAtIndex:0] objectForKey:@"Value"] length] + 5)];
//        [PM10Str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(6,[[[tempPM10 objectAtIndex:0] objectForKey:@"Value"] length] + 5)];
//        self.PM10.attributedText = PM10Str;
//        CGSize PM10Size = [PM10Str.string sizeWithFont:[UIFont systemFontOfSize:11]];
//        [self.PM10 setFrame:CGRectMake(215, self.formaldehyde.frame.origin.y, 100, PM10Size.height)];
//        
//        
//        NSMutableAttributedString *TVOCStr = [[NSMutableAttributedString alloc] initWithString:@"TVOC: ----ug/m³"];
//        [TVOCStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:NSMakeRange(6,9)];
//        self.TVOCE.attributedText = TVOCStr;
//        CGSize TVOCSize = [TVOCStr.string sizeWithFont:[UIFont systemFontOfSize:11]];
//        [self.TVOCE setFrame:CGRectMake(5, self.formaldehyde.frame.origin.y + self.formaldehyde.frame.size.height + 10, 100, TVOCSize.height)];
//        
//        for (int a = location; a < length; a++) {
//            [temp6 addObject:[tempPM10 objectAtIndex:a]];
//        }
//        [self.PM10BarChart refreshBarChartWithData:temp6 andSubject:kPM10];
//        
//        [self.TVOCBarChart refreshBarChartWithData:nil andSubject:KVOC];
//    }
//    
//    
//    
//    
//}
//
//@end

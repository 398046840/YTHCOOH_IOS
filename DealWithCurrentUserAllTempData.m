//
//  CurrentUserAllTempData.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-17.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "DealWithCurrentUserAllTempData.h"
#import "AppDelegate.h"

@implementation DealWithCurrentUserAllTempData

- (id)init
{
    self = [super init];
    if (self) {
        
        self.currentDeviceMac = [[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC];
        self.currentDeviceLocation = [[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICELocation];
        self.currentDeviceType = [[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICETYPE];
        
        self.connectingServer = [[ConnectingServer alloc] init];
        
    }
    return self;
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)refreshMyDevicesDataWithDic:(NSMutableArray *)dic
{
    if (dic != nil) {
        
        self.allMyDevices = dic;
  //      [self refreshCurrentDeviceHomeDataAndRecord];
        [[self appDelegate].allMyDevicwVC.allMyDevice reloadData];
        
    } else {
        
        self.allMyDevices = dic;
        
   //     [self.homeVC setHomeDataToNil];
     //   [self.homeVC.tableView reloadData];
        
        [[self appDelegate].allMyDevicwVC.allMyDevice reloadData];
    }
}

- (void)refreshHomeDataWithCurrentDeviceMac
{
    [self.connectingServer loadingDeviceNewDetailWithDeviceMAC:[[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] andDeviceType:[[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICETYPE]];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(refreshHomeData) userInfo:nil repeats:YES];
}

- (void)refreshHomeData
{
    if (self.allMyDevices.count != 0) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] != nil) {
            
            [self.connectingServer loadingDeviceNewDetailWithDeviceMAC:[[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] andDeviceType:[[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICETYPE]];
        }
    } else {
        
        [self.timer invalidate];
        self.timer = nil;
    }
    
    
}

- (void)refreshHomeView
{
    [[self appDelegate].homeVC.tableView reloadData];
    [[self appDelegate].homeVC refreshPM10Monitor];
}

- (void)setHomeDataToNil
{
    self.homeData = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *location = [[NSMutableDictionary alloc] init];
    [location setObject:@"您当前还没选择设备,请点击选择或添加设备" forKey:@"Location"];
    [self.homeData addObject:location];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"PM2.5:" forKey:@"Project"];
    [dic setObject:@"----ug/m³" forKey:@"Value"];
    [dic setObject:@"------" forKey:@"Level"];
    [dic setObject:@"LevelColor_Green" forKey:@"Color"];
    [self.homeData addObject:dic];
    
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setObject:@"甲醛:" forKey:@"Project"];
    [dic2 setObject:@"----mg/m³" forKey:@"Value"];
    [dic2 setObject:@"------" forKey:@"Level"];
    [dic2 setObject:@"LevelColor_Green" forKey:@"Color"];
    [self.homeData addObject:dic2];
    
    NSMutableDictionary *dic3 = [[NSMutableDictionary alloc] init];
    [dic3 setObject:@"TVOC:" forKey:@"Project"];
    [dic3 setObject:@"----mg/m³" forKey:@"Value"];
    [dic3 setObject:@"------" forKey:@"Level"];
    [dic3 setObject:@"LevelColor_Green" forKey:@"Color"];
    [self.homeData addObject:dic3];
    
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc] init];
    [dic1 setObject:@"PM10:" forKey:@"Project"];
    [dic1 setObject:@"----ug/m³" forKey:@"Value"];
    [dic1 setObject:@"------" forKey:@"Level"];
    [dic1 setObject:@"LevelColor_Green" forKey:@"Color"];
    [self.homeData addObject:dic1];
    
    NSMutableDictionary *dic4 = [[NSMutableDictionary alloc] init];
    [dic4 setObject:@"温度:" forKey:@"Project"];
    [dic4 setObject:@"----℃" forKey:@"Value"];
    [dic4 setObject:@"------" forKey:@"Level"];
    [dic4 setObject:@"LevelColor_Green" forKey:@"Color"];
    [self.homeData addObject:dic4];
    
    NSMutableDictionary *dic5 = [[NSMutableDictionary alloc] init];
    [dic5 setObject:@"湿度:" forKey:@"Project"];
    [dic5 setObject:@"----%" forKey:@"Value"];
    [dic5 setObject:@"------" forKey:@"Level"];
    [dic5 setObject:@"LevelColor_Green" forKey:@"Color"];
    [self.homeData addObject:dic5];
    
    [self refreshHomeView];
}

//
//- (void)refreshCurrentDeviceHomeDataAndRecord
//{
//    NSString *currentDevice = [[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC];
//    self.currentDeviceMac = currentDevice;
//    
//    for (NSMutableDictionary *dic in self.allMyDevices) {
//        
//        if ([[dic objectForKey:kDEVICEMAC] isEqualToString:currentDevice]) {
//            
//            NSMutableArray *newData = [[NSMutableArray alloc] init];
//            
//            NSMutableDictionary *location = [[NSMutableDictionary alloc] init];
//            [location setObject:[NSString stringWithFormat:@"温馨提示: 您当前位置为%@",[dic objectForKey:KDEVICELOCATION]] forKey:@"Location"];
//            [newData addObject:location];
//            
//            NSMutableDictionary *PM = [[NSMutableDictionary alloc] init];
//            [PM setObject:@"PM2.5:" forKey:@"Project"];
//            [PM setObject:[NSString stringWithFormat:@"%@ug/m³",[dic objectForKey:kPM]] forKey:@"Value"];
//            [PM setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[dic objectForKey:kPM] inType:kPM]] forKey:@"Level"];
//            [PM setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[dic objectForKey:kPM] inType:kPM]] forKey:@"Color"];
//            [PM setObject:[self whatTextColorWithValue:[dic objectForKey:kPM] inType:kPM] forKey:@"TextColor"];
//            [newData addObject:PM];
//            
//            NSMutableDictionary *PM10 = [[NSMutableDictionary alloc] init];
//            NSMutableDictionary *TVOC = [[NSMutableDictionary alloc] init];
//            
//            
//            if ([[dic objectForKey:kDEVICETYPE] isEqualToString:@"YT133"]) {
//                
//                
//                [PM10 setObject:@"PM10:" forKey:@"Project"];
//                [PM10 setObject:@"----ug/m³" forKey:@"Value"];
//                [PM10 setObject:@"------" forKey:@"Level"];
//                [PM10 setObject:@"LevelColor_Green" forKey:@"Color"];
//                [PM10 setObject:[UIColor blackColor] forKey:@"TextColor"];
//                
//                [TVOC setObject:@"TOVC:" forKey:@"Project"];
//                [TVOC setObject:[NSString stringWithFormat:@"%@ug/m³",[dic objectForKey:KVOC]] forKey:@"Value"];
//                [TVOC setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[dic objectForKey:KVOC] inType:KVOC]] forKey:@"Level"];
//                [TVOC setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[dic objectForKey:KVOC] inType:KVOC]] forKey:@"Color"];
//                [TVOC setObject:[self whatTextColorWithValue:[dic objectForKey:KVOC] inType:KVOC] forKey:@"TextColor"];
//                
//                
//                
//            } else {
//                
//                
//                [PM10 setObject:@"PM10:" forKey:@"Project"];
//                [PM10 setObject:[NSString stringWithFormat:@"%@ug/m³",[dic objectForKey:KVOC]] forKey:@"Value"];
//                [PM10 setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[dic objectForKey:KVOC] inType:kPM10]] forKey:@"Level"];
//                [PM10 setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[dic objectForKey:KVOC] inType:kPM10]] forKey:@"Color"];
//                [PM10 setObject:[self whatTextColorWithValue:[dic objectForKey:KVOC] inType:kPM10] forKey:@"TextColor"];
//                
//                
//                [TVOC setObject:@"TOVC:" forKey:@"Project"];
//                [TVOC setObject:@"----ug/m³" forKey:@"Value"];
//                [TVOC setObject:@"------" forKey:@"Level"];
//                [TVOC setObject:@"LevelColor_Green" forKey:@"Color"];
//                [TVOC setObject:[UIColor blackColor] forKey:@"TextColor"];
//                
//            }
//            
//            NSMutableDictionary *formaldehyde = [[NSMutableDictionary alloc] init];
//            [formaldehyde setObject:@"甲醛:" forKey:@"Project"];
//            [formaldehyde setObject:[NSString stringWithFormat:@"%@mg/m³",[dic objectForKey:kFORMALDEHYDE]] forKey:@"Value"];
//            [formaldehyde setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[dic objectForKey:kFORMALDEHYDE] inType:kFORMALDEHYDE]] forKey:@"Level"];
//            [formaldehyde setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[dic objectForKey:kFORMALDEHYDE] inType:kFORMALDEHYDE]] forKey:@"Color"];
//            [formaldehyde setObject:[self whatTextColorWithValue:[dic objectForKey:kFORMALDEHYDE] inType:kFORMALDEHYDE] forKey:@"TextColor"];
//            
//            [newData addObject:PM10];
//            
//            [newData addObject:formaldehyde];
//            
//            [newData addObject:TVOC];
//            
//            NSMutableDictionary *temperature = [[NSMutableDictionary alloc] init];
//            [temperature setObject:@"温度:" forKey:@"Project"];
//            [temperature setObject:[NSString stringWithFormat:@"%@℃",[dic objectForKey:kTEMPERATURE]] forKey:@"Value"];
//            [temperature setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[dic objectForKey:kTEMPERATURE] inType:kTEMPERATURE]] forKey:@"Level"];
//            [temperature setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[dic objectForKey:kTEMPERATURE] inType:kTEMPERATURE]] forKey:@"Color"];
//            [temperature setObject:[self whatTextColorWithValue:[dic objectForKey:kTEMPERATURE] inType:kTEMPERATURE] forKey:@"TextColor"];
//            [newData addObject:temperature];
//            
//            NSMutableDictionary *humidity = [[NSMutableDictionary alloc] init];
//            [humidity setObject:@"湿度:" forKey:@"Project"];
//            [humidity setObject:[NSString stringWithFormat:@"%@%%",[dic objectForKey:kHUMIDITY]] forKey:@"Value"];
//            [humidity setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[dic objectForKey:kHUMIDITY] inType:kHUMIDITY]] forKey:@"Level"];
//            [humidity setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[dic objectForKey:kHUMIDITY] inType:kHUMIDITY]] forKey:@"Color"];
//            [humidity setObject:[self whatTextColorWithValue:[dic objectForKey:kHUMIDITY] inType:kHUMIDITY] forKey:@"TextColor"];
//            [newData addObject:humidity];
//            
//            self.homeVC.homeData = newData;
//            [self.homeVC.tableView reloadData];
//            
//        }
//        
//    }
//    
//    [self.connectingServer loadingDeviceRecordWithCurrentDeviceMAC];
//}
//
//- (BOOL)allInfomationPreparedWithUserID:(NSString *)userID andUserPassword:(NSString *)userPassword
//{
//    
//    if (![self checkTel:userID]) {
//        
//        return NO;
//        
//    }
//    
//    if (userPassword.length < 6 || userPassword.length > 16) {
//        
//        [self.window  makeToast:@"密码为6-16位数字或字母" duration:1.5 position:CSToastPositionTop];
//        return NO;
//    }
//    
//    return YES;
//    
//}
//
//- (BOOL)checkTel:(NSString *)str
//
//{
//    
//    if ([str length] == 0) {
//        
//        [self.window  makeToast:@"账号不能为空!" duration:1.5 position:CSToastPositionTop];
//        return NO;
//    }
//    
//    //1[0-9]{10}
//    
//    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
//    
//    //    NSString *regex = @"[0-9]{11}";
//    
//    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
//    
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//    
//    BOOL isMatch = [pred evaluateWithObject:str];
//    
//    if (!isMatch) {
//        
//        [self.window  makeToast:@"手机号为国内手机号码" duration:1.5 position:CSToastPositionTop];
//        
//        return NO;
//        
//    }
//    
//    return YES;
//    
//}
//
- (NSString *)whatLevelWithValue:(NSString *)value inType:(NSString *)type
{
    
    if ([type isEqualToString:kFORMALDEHYDE]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 0.1) {
            
            return @"合    格";
            
        } else if ([value floatValue] > 0.1 && [value floatValue] <= 0.3) {
            
            return @"超    标";
            
        } else if ([value floatValue] > 0.3) {
            
            return @"严重超标";
            
        }
        
        
    } else if ([type isEqualToString:kPM]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return @"优";
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return @"良";
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return @"轻度污染";
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return @"中度污染";
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return @"重度污染";
            
        } else if ([value floatValue] > 250) {
            
            return @"严重污染";
            
        }
        
    } else if ([type isEqualToString:kTEMPERATURE]) {
        
        NSDate *nowDta = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM"];
        
        NSString *nowMonth = [dateFormatter stringFromDate:nowDta];
        
        if ([nowMonth floatValue] >= 3 && [nowMonth floatValue] <= 8) {
            
            if ([value floatValue] < 22 ) {
                
                return @"寒    冷";
                
            } else if ([value floatValue] >= 22 && [value floatValue] <= 28) {
                
                return @"温度适宜";
                
            } else if ([value floatValue] > 28) {
                
                return @"炎    热";
                
            }
            
        }else {
            
            if ([value floatValue] < 16) {
                
                return @"寒    冷";
                
            } else if ([value floatValue] >= 16 && [value floatValue] <= 24) {
                
                return @"温度适宜";
                
            } else if ([value floatValue] > 24) {
                
                return @"炎    热";
                
            }
        }
        
        
        
    } else if ([type isEqualToString:kHUMIDITY]) {
        
        NSDate *nowDta = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM"];
        
        NSString *nowMonth = [dateFormatter stringFromDate:nowDta];
        
        if ([nowMonth floatValue] >= 3 && [nowMonth floatValue] <= 8) {
            
            if ([value floatValue] < 40) {
                
                return @"干    燥";
                
            } else if ([value floatValue] >= 40 && [value floatValue] <= 80) {
                
                return @"湿度适宜";
                
            } else if ([value floatValue] > 80) {
                
                return @"潮    湿";
                
            }
        } else {
            
            if ([value floatValue] < 30) {
                
                return @"干    燥";
                
            } else if ([value floatValue] >= 30 && [value floatValue] <= 60) {
                
                return @"温度适宜";
                
            } else if ([value floatValue] > 60) {
                
                return @"潮    湿";
                
            }
            
        }
        
    } else if ([type isEqualToString:KVOC]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 0.6) {
            
            return @"合    格";
            
        } else if ([value floatValue] > 0.6 && [value floatValue] <= 1.7) {
            
            return @"超    标";
            
        } else if ([value floatValue] > 1.7) {
            
            return @"严重超标";
            
        }
        
        
    } else if ([type isEqualToString:kPM10]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return @"优";
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return @"良";
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return @"轻度污染";
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return @"中度污染";
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return @"重度污染";
            
        } else if ([value floatValue] > 250) {
            
            return @"严重污染";
            
        }
        
    }
    
    return nil;
    
}

- (UIColor *)whatTextColorWithValue:(NSString *)value inType:(NSString *)type
{
    
    if ([type isEqualToString:kFORMALDEHYDE]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 0.1) {
            
            return [UIColor greenColor];
            
        } else if ([value floatValue] > 0.1 && [value floatValue] <= 0.3) {
            
            return [UIColor yellowColor];
            
        } else if ([value floatValue] > 0.3) {
            
            return [UIColor redColor];
            
        }
        
        
    } else if ([type isEqualToString:kPM]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return [UIColor greenColor];
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return [UIColor yellowColor];
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return [UIColor orangeColor];
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return [UIColor redColor];
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return [UIColor magentaColor];
            
        } else if ([value floatValue] > 250) {
            
            return [UIColor purpleColor];
            
        }
        
    } else if ([type isEqualToString:kTEMPERATURE]) {
        
        NSDate *nowDta = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM"];
        
        NSString *nowMonth = [dateFormatter stringFromDate:nowDta];
        
        if ([nowMonth floatValue] >= 3 && [nowMonth floatValue] <= 8) {
            
            if ([value floatValue] < 22 ) {
                
                return [UIColor grayColor];
                
            } else if ([value floatValue] >= 22 && [value floatValue] <= 28) {
                
                return [UIColor greenColor];
                
            } else if ([value floatValue] > 28) {
                
                return [UIColor redColor];
                
            }
            
        }else {
            
            if ([value floatValue] < 16) {
                
                return [UIColor grayColor];
                
            } else if ([value floatValue] >= 16 && [value floatValue] <= 24) {
                
                return [UIColor greenColor];
                
            } else if ([value floatValue] > 24) {
                
                return [UIColor redColor];
                
            }
        }
        
        
        
    } else if ([type isEqualToString:kHUMIDITY]) {
        
        NSDate *nowDta = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM"];
        
        NSString *nowMonth = [dateFormatter stringFromDate:nowDta];
        
        if ([nowMonth floatValue] >= 3 && [nowMonth floatValue] <= 8) {
            
            if ([value floatValue] < 40) {
                
                return [UIColor grayColor];
                
            } else if ([value floatValue] >= 40 && [value floatValue] <= 80) {
                
                return [UIColor greenColor];
                
            } else if ([value floatValue] > 80) {
                
                return [UIColor redColor];
                
            }
        } else {
            
            if ([value floatValue] < 30) {
                
                return [UIColor grayColor];
                
            } else if ([value floatValue] >= 30 && [value floatValue] <= 60) {
                
                return [UIColor greenColor];
                
            } else if ([value floatValue] > 60) {
                
                return [UIColor redColor];
                
            }
            
        }
        
    } else if ([type isEqualToString:KVOC]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 0.6) {
            
            return [UIColor greenColor];
            
        } else if ([value floatValue] > 0.6 && [value floatValue] <= 1.7) {
            
            return [UIColor yellowColor];
            
        } else if ([value floatValue] > 1.7) {
            
            return [UIColor redColor];
            
        }
        
        
    } else if ([type isEqualToString:kPM10]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return [UIColor greenColor];
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return [UIColor yellowColor];
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return [UIColor orangeColor];
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return [UIColor redColor];
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return [UIColor magentaColor];
            
        } else if ([value floatValue] > 250) {
            
            return [UIColor purpleColor];
            
        }
        
    }
    
    return nil;
    
}

- (NSString *)whatColorWithValue:(NSString *)value inType:(NSString *)type
{
    
    if ([type isEqualToString:kFORMALDEHYDE]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 0.1) {
            
            return @"LevelColor_Green";
            
        } else if ([value floatValue] > 0.1 && [value floatValue] <= 0.3) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] > 0.3) {
            
            return @"LevelColor_Red";
            
        }
        
        
    } else if ([type isEqualToString:kPM]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return @"LevelColor_Green";
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return @"LevelColor_Or";
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return @"LevelColor_Red";
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return @"LevelColor_Pink";
            
        } else if ([value floatValue] > 250) {
            
            return @"LevelColor_Purple";
            
        }
        
    } else if ([type isEqualToString:kTEMPERATURE]) {
        
        NSDate *nowDta = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM"];
        
        NSString *nowMonth = [dateFormatter stringFromDate:nowDta];
        
        if ([nowMonth floatValue] >= 3 && [nowMonth floatValue] <= 8) {
            
            if ([value floatValue] < 22 ) {
                
                return @"LevelColor_Gray";
                
            } else if ([value floatValue] >= 22 && [value floatValue] <= 28) {
                
                return @"LevelColor_Green";
                
            } else if ([value floatValue] > 28) {
                
                return @"LevelColor_Red";
                
            }
            
            
        }else {
            
            if ([value floatValue] < 16) {
                
                return @"LevelColor_Gray";
                
            } else if ([value floatValue] >= 16 && [value floatValue] <= 24) {
                
                return @"LevelColor_Green";
                
            } else if ([value floatValue] > 24) {
                
                return @"LevelColor_Red";
                
            }
        }
        
        
        
        
    } else if ([type isEqualToString:kHUMIDITY]) {
        
        NSDate *nowDta = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM"];
        
        NSString *nowMonth = [dateFormatter stringFromDate:nowDta];
        
        if ([nowMonth floatValue] >= 3 && [nowMonth floatValue] <= 8) {
            
            if ([value floatValue] < 40) {
                
                return @"LevelColor_Gray";
                
            } else if ([value floatValue] >= 40 && [value floatValue] <= 80) {
                
                return @"LevelColor_Green";
                
            } else if ([value floatValue] > 80) {
                
                return @"LevelColor_Red";
                
            }
        } else {
            
            if ([value floatValue] < 30) {
                
                return @"LevelColor_Gray";
                
            } else if ([value floatValue] >= 30 && [value floatValue] <= 60) {
                
                return @"LevelColor_Green";
                
            } else if ([value floatValue] > 60) {
                
                return @"LevelColor_Red";
                
            }
            
        }
        
    } else if ([type isEqualToString:KVOC]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 0.6) {
            
            return @"LevelColor_Green";
            
        } else if ([value floatValue] > 0.6 && [value floatValue] <= 1.7) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] > 1.7) {
            
            return @"LevelColor_Red";
            
        }
        
        
    } else if ([type isEqualToString:kPM10]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return @"LevelColor_Green";
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return @"LevelColor_Or";
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return @"LevelColor_Red";
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return @"LevelColor_Pink";
            
        } else if ([value floatValue] > 250) {
            
            return @"LevelColor_Purple";
            
        }
        
    }
    
    return nil;
    
}

@end

//
//  ConnectingServer.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-8.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "ConnectingServer.h"
#import "AppDelegate.h"
#import "MKNetworkKit.h"
#import "LoginVC.h"
#import "RetrievePasswordVC.h"
#import "AddRegisteredDeviceVC.h"
#import "RegisterNewID.h"
#import "AirConditionRemoteVC.h"
#import "AirCleanerRemoteVC.h"
#import "TVRemoteVC.h"
#import "StudyRemoteTypeAirCondition.h"
#import "AirConditionRemoteVC.h"
#import "LocationSettingVC.h"
#import "PwdSettingVC.h"

@implementation ConnectingServer

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)registerWithUserID:(NSString *)userID andUserPassword:(NSString *)userPassword andViewController:(RegisterNewID *)viewController
{
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidregister.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:userID forKey:@"param1"];
    [param setValue:userPassword forKey:@"param2"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kREGISTERSERVERPATH params:param httpMethod:@"POST"];
    
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        
        NSLog(@"%@",operation.responseString);
        
        if ([operation.responseString rangeOfString:@"success"].location != NSNotFound ) {
            
            [viewController registerSuccess];
            
        } else {
            
            [viewController registerFail];
        }
        
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [viewController registerFail];
        
    }];
    
    [engine enqueueOperation:op];
    
}


- (void)loginWithUserID:(NSString *)userID andUserPassword:(NSString *)userPassword andViewController:(LoginVC *)viewController
{
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidlogin.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[NSString stringWithFormat:@"%@",userID] forKey:@"param1"];
    [param setValue:[NSString stringWithFormat:@"%@",userPassword] forKey:@"param2"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kLOGINSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"成功登陆: %@",operation.responseString);
        
        if ([operation.responseString rangeOfString:@"success"].location != NSNotFound ) {
            
            [viewController loginSuccess];
            
        } else {
            
            [viewController loginFail];
        }
        
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [viewController loginFail];
        
    }];
    
    [engine enqueueOperation:op];
}

- (void)retrievePasswordWithUserID:(NSString *)userID andDeviceMAC:(NSString *)deviceMAC andViewController:(RetrievePasswordVC *)viewController
{
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidverifypwd.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:userID forKey:@"param1"];
    [param setValue:deviceMAC forKey:@"param2"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kRETRIEVESEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"%@",operation.responseString);
        
        if ([operation.responseString rangeOfString:@"fail"].location == NSNotFound ) {
            
            [viewController verifySuccess];
            
        } else {
            
            [viewController verifyFail];
        }
        
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [viewController verifyFail];
        
    }];
    
    [engine enqueueOperation:op];
    
}

- (void)changeLocationWithDeviceMac:(NSString *)deviceMac andNewLocation:(NSString *)newLocation  andViewController:(LocationSettingVC *)viewController
{
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidchangge_equipment_location.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:deviceMac forKey:@"param1"];
    [param setValue:newLocation forKey:@"param2"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    MKNetworkOperation *operation = [engine operationWithPath:kCHANGELOCATIONSEVERPATH params:param httpMethod:@"POST"];
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSLog(@"%@", completedOperation.responseString);
        
        if ([completedOperation.responseString rangeOfString:@"fail"].location == NSNotFound) {
            [viewController changeSuccess];
        }else{
            [viewController changeFail];
        }
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        [viewController changeFail];
    }];
    
    [engine enqueueOperation:operation];
    
}

- (void)changePwdWithUserID:(NSString *)userID andNewPwd:(NSString *)newPwd andViewController:(PwdSettingVC *)viewController
{
 //   NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidchangpwd.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:userID forKey:@"param1"];
    [param setValue:newPwd forKey:@"param2"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:kCHANGEPASSWORDSEVERPATH params:param httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if ([completedOperation.responseString rangeOfString:@"fail"].location == NSNotFound) {
            [viewController changeSuccess];
        }else{
            [viewController changeFail];
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        [viewController changeFail];
    }];
    [engine enqueueOperation:op];
    
}

- (void)resetPasswordWithUserID:(NSString *)userID andNewPassword:(NSString *)newPassword andViewController:(ResetPasswordVC *)viewController
{
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidchangforgetpwd.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:userID forKey:@"param1"];
    [param setValue:newPassword forKey:@"param2"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kRESETPASSWORDSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"%@",operation.responseString);
        
        if ([operation.responseString rangeOfString:@"fail"].location == NSNotFound ) {
            
            [viewController resetSuccess];
            
        } else {
            
            [viewController resetFail];
        }
        
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [viewController resetFail];
        
    }];
    
    [engine enqueueOperation:op];
}

- (void)loadingAllMyDeviceWithCurrentUserIDAndViewController:(UIViewController *)viewController
{
    if (self.isLoadingAllDevice) {
        return;
    }
    
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidreadmyeqlist.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentUserID forKey:@"param1"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kLOADINGALLDEVICESEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"读取所有设备: %@",operation.responseString);
        
        if ([operation.responseString rangeOfString:@"no]content"].location == NSNotFound) {
            
            NSString *responseStr = [operation responseString];
            NSString *newStr = [responseStr stringByReplacingOccurrencesOfString:@"\r\n\r\n\r\n\r\n   " withString:@""];
            NSString *newStr2 = [newStr stringByReplacingOccurrencesOfString:@"\r\n\r\n\  \r\n" withString:@""];
            
            NSArray *responseArray = [newStr2 componentsSeparatedByString:@"]"];
            
            NSMutableArray *finalArray = [[NSMutableArray alloc] init];
            
            for (int a = 0; a < responseArray.count - 1; a++) {
                
                NSString *deviceStr = [responseArray objectAtIndex:a];
                NSArray *deviceArray = [deviceStr componentsSeparatedByString:@"|"];
                
                NSMutableDictionary *deviceData = [[NSMutableDictionary alloc] init];
                
                for (int b = 0; b < deviceArray.count; b++) {
                    
                    switch (b) {
                        case 0:
                            [deviceData setObject:[deviceArray objectAtIndex:b] forKey:kDEVICEMAC];
                            break;
                            
                        case 1:
                            [deviceData setObject:[deviceArray objectAtIndex:b] forKey:KDEVICELOCATION];
                            break;
                            
                        case 2:
                            [deviceData setObject:[deviceArray objectAtIndex:b] forKey:kFORMALDEHYDE];
                            break;
                            
                        case 3:
                            [deviceData setObject:[deviceArray objectAtIndex:b] forKey:kTEMPERATURE];
                            break;
                            
                        case 4:
                            [deviceData setObject:[deviceArray objectAtIndex:b] forKey:kHUMIDITY];
                            break;
                            
                        case 5:
                            [deviceData setObject:[deviceArray objectAtIndex:b] forKey:kPM];
                            break;
                            
                        case 6:
                            [deviceData setObject:[deviceArray objectAtIndex:b] forKey:KVOC];
                            break;
                            
                        case 7:
                            [deviceData setObject:[deviceArray objectAtIndex:b] forKey:kDEVICETYPE];
                            break;
                            
                        default:
                            break;
                    }
                    
                }
                
                [finalArray addObject:deviceData];
                
                
            }
            
            [[self appDelegate].handler refreshMyDevicesDataWithDic:finalArray];
            
            
        } else {
            
            
            [[self appDelegate].handler refreshMyDevicesDataWithDic:nil];
            [[self appDelegate].handler setHomeDataToNil];
            [viewController.view makeToast:@"您还没添加设备,请先添加" duration:1.5 position:CSToastPositionCenter];
        }
        
        if (viewController != nil) {
            [viewController.view hideToastActivity];
        }
        
        self.isLoadingAllDevice = NO;
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        if (viewController != nil) {
            [viewController.view hideToastActivity];
            [viewController.view makeToast:@"加载失败,请稍后再试" duration:1.5 position:CSToastPositionCenter];
        }
        
        self.isLoadingAllDevice = NO;
        
    }];
    
    [engine enqueueOperation:op];
    
    self.isLoadingAllDevice = YES;
    
    
    if (viewController != nil) {
        [viewController.view makeToastActivity];
    }
}

- (void)loadingDeviceRecordWithCurrentDeviceMACWithViewController:(UIViewController *)viewController
{
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidEnvironmentTrend.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentDeviceMac forKey:@"param1"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kLOADINGDEVICERECORDSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"%@",[self appDelegate].handler.currentDeviceMac);
        
        if ([operation.responseString rangeOfString:@"success"].location != NSNotFound) {
            
            NSString *responseStr = [operation responseString];
            NSString *newStr = [responseStr stringByReplacingOccurrencesOfString:@"\r\n\r\n\r\n\r\n\r\n   " withString:@""];
            NSArray *responseArray = [newStr componentsSeparatedByString:@"]"];
            
            NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] init];
            
            if (responseArray == nil) {
                
                if (viewController != nil) {
                    [viewController.view hideToastActivity];
                    [viewController.view makeToast:@"加载失败,请稍后再试" duration:1.5 position:CSToastPositionCenter];
                    
                    [viewController.navigationItem.rightBarButtonItem setEnabled:YES];
                }
                return ;
                
            }
            
            for (int a = 1; a < responseArray.count; a++) {
                
                NSArray *secondArray = [[responseArray objectAtIndex:a] componentsSeparatedByString:@"|"];
                NSMutableArray *tempArray = [[NSMutableArray alloc] init];
                
                for (int b = 0; b < secondArray.count; b++) {
                    
                    NSArray *thirdArray = [[secondArray objectAtIndex:b] componentsSeparatedByString:@"*"];
                    NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] init];
                    
                    for (int c = 0; c < thirdArray.count; c++) {
                        
                        if (c == 0) {
                            [tempDic setObject:[thirdArray objectAtIndex:c] forKey:@"Time"];
                        }else {
                            [tempDic setObject:[thirdArray objectAtIndex:c] forKey:@"Value"];
                            [tempArray addObject:tempDic];
                        }
                        
                    }
                    
                }
                
                if ([[self appDelegate].handler.currentDeviceType isEqualToString:@"YT133"]) {
                    
                    switch (a) {
                        case 1:
                            [dataDic setObject:tempArray forKey:kFORMALDEHYDE];
                            break;
                        case 2:
                            [dataDic setObject:tempArray forKey:kTEMPERATURE];
                            break;
                        case 3:
                            [dataDic setObject:tempArray forKey:kHUMIDITY];
                            break;
                        case 4:
                            [dataDic setObject:tempArray forKey:kPM];
                            break;
                        case 5:
                            [dataDic setObject:tempArray forKey:KVOC];
                            break;
                            
                        default:
                            break;
                    }
                    
                } else if ([[self appDelegate].handler.currentDeviceType isEqualToString:@"YT633"]) {
                    
                    switch (a) {
                        case 1:
                            [dataDic setObject:tempArray forKey:kFORMALDEHYDE];
                            break;
                        case 2:
                            [dataDic setObject:tempArray forKey:kTEMPERATURE];
                            break;
                        case 3:
                            [dataDic setObject:tempArray forKey:kHUMIDITY];
                            break;
                        case 4:
                            [dataDic setObject:tempArray forKey:kPM];
                            break;
                        case 5:
                            [dataDic setObject:tempArray forKey:kPM10];
                            break;
                            
                        default:
                            break;
                    }
                    
                } else if ([[self appDelegate].handler.currentDeviceType isEqualToString:@"YT631"]) {
                    
                    switch (a) {
                        case 1:
                            ;
                            break;
                        case 2:
                            [dataDic setObject:tempArray forKey:kTEMPERATURE];
                            break;
                        case 3:
                            [dataDic setObject:tempArray forKey:kHUMIDITY];
                            break;
                        case 4:
                            [dataDic setObject:tempArray forKey:kPM];
                            break;
                        case 5:
                            [dataDic setObject:tempArray forKey:kPM10];
                            break;
                            
                        default:
                            break;
                    }
                    
                }
                
                
                
                
                
            }
            [self appDelegate].handler.recordDataDic = dataDic;
            [[self appDelegate] refreshRecordView];
            
            
            
            
        } else {
            
            if (viewController != nil) {
                
                [viewController.view makeToast:@"加载失败,请稍后再试" duration:1.5 position:CSToastPositionCenter];
                
            }
            
        }
        
        
        if (viewController != nil) {
            [viewController.view hideToastActivity];
            [viewController.navigationItem.rightBarButtonItem setEnabled:YES];
            
        }
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        
        if (viewController != nil) {
            [viewController.view hideToastActivity];
            [viewController.view makeToast:@"加载失败,请稍后再试" duration:1.5 position:CSToastPositionCenter];
            [viewController.navigationItem.rightBarButtonItem setEnabled:YES];
        }
        
        
    }];
    
    [engine enqueueOperation:op];
    
    if (viewController != nil) {
        [viewController.view makeToastActivity];
        [viewController.navigationItem.rightBarButtonItem setEnabled:NO];
        
        
    }
    
    
}

- (void)loadingDeviceNewDetailWithDeviceMAC:(NSString *)deviceMac andDeviceType:(NSString *)type
{
    if (self.isRefreshHomeData) {
        return;
    }
    
 //   NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidrealtime_data_on_menuactivity.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:deviceMac forKey:@"param1"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kLOADINGDEVICENEWDETAILSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"获得当前设备详细: %@",operation.responseString);
        
        if ([operation.responseString rangeOfString:@"success"].location != NSNotFound) {
            
            NSString *responseStr = [operation responseString];
            NSString *newStr = [responseStr stringByReplacingOccurrencesOfString:@"\r\n\r\n\r\n\r\n\r\n\r\n   " withString:@""];
            NSString *newStr2 = [newStr stringByReplacingOccurrencesOfString:@"\r\n\r\n  \r\n" withString:@""];
            NSArray *responseArray = [newStr2 componentsSeparatedByString:@"|"];
            
            NSMutableDictionary *tempDic;
            NSMutableArray *finalArray = [[NSMutableArray alloc] init];
            
            
            
            if ([type isEqualToString:@"YT133"]) {
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:[NSString stringWithFormat:@"温馨提示: 您当前位置为%@",[responseArray objectAtIndex:1]] forKey:@"Location"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"甲醛:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@mg/m³",[responseArray objectAtIndex:2]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:2] inType:kFORMALDEHYDE]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:2] inType:kFORMALDEHYDE]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:2] inType:kFORMALDEHYDE] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"PM2.5:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@ug/m³",[responseArray objectAtIndex:5]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:5] inType:kPM]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:5] inType:kPM]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:5] inType:kPM] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"TVOC:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@mg/m³",[responseArray objectAtIndex:6]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:6] inType:KVOC]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:6] inType:KVOC]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:6] inType:KVOC] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"温度:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@℃",[responseArray objectAtIndex:3]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:3] inType:kTEMPERATURE]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:3] inType:kTEMPERATURE]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:3] inType:kTEMPERATURE] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"湿度:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@%%",[responseArray objectAtIndex:4]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:4] inType:kHUMIDITY]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:4] inType:kHUMIDITY]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:4] inType:kHUMIDITY] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                
                
            } else if ([type isEqualToString:@"YT631"]) {
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:[NSString stringWithFormat:@"温馨提示: 您当前位置为%@",[responseArray objectAtIndex:1]] forKey:@"Location"];
                [finalArray addObject:tempDic];
                
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"PM2.5:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@ug/m³",[responseArray objectAtIndex:5]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:5] inType:kPM]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:5] inType:kPM]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:5] inType:kPM] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"PM10:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@ug/m³",[responseArray objectAtIndex:6]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:6] inType:kPM10]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:6] inType:kPM10]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:6] inType:kPM10] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"温度:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@℃",[responseArray objectAtIndex:3]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:3] inType:kTEMPERATURE]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:3] inType:kTEMPERATURE]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:3] inType:kTEMPERATURE] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"湿度:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@%%",[responseArray objectAtIndex:4]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:4] inType:kHUMIDITY]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:4] inType:kHUMIDITY]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:4] inType:kHUMIDITY] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
            } else if ([type isEqualToString:@"YT633"]) {
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:[NSString stringWithFormat:@"温馨提示: 您当前位置为%@",[responseArray objectAtIndex:1]] forKey:@"Location"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"甲醛:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@mg/m³",[responseArray objectAtIndex:2]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:2] inType:kFORMALDEHYDE]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:2] inType:kFORMALDEHYDE]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:2] inType:kFORMALDEHYDE] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"PM2.5:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@ug/m³",[responseArray objectAtIndex:5]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:5] inType:kPM]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:5] inType:kPM]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:5] inType:kPM] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"PM10:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@ug/m³",[responseArray objectAtIndex:6]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:6] inType:kPM10]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:6] inType:kPM10]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:6] inType:kPM10] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"温度:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@℃",[responseArray objectAtIndex:3]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:3] inType:kTEMPERATURE]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:3] inType:kTEMPERATURE]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:3] inType:kTEMPERATURE] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                tempDic = [[NSMutableDictionary alloc] init];
                [tempDic setObject:@"湿度:" forKey:@"Project"];
                [tempDic setObject:[NSString stringWithFormat:@"%@%%",[responseArray objectAtIndex:4]] forKey:@"Value"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatLevelWithValue:[responseArray objectAtIndex:4] inType:kHUMIDITY]] forKey:@"Level"];
                [tempDic setObject:[NSString stringWithFormat:@"%@",[self whatColorWithValue:[responseArray objectAtIndex:4] inType:kHUMIDITY]] forKey:@"Color"];
                [tempDic setObject:[self whatTextColorWithValue:[responseArray objectAtIndex:4] inType:kHUMIDITY] forKey:@"TextColor"];
                [finalArray addObject:tempDic];
                
                
            }
            
            if ([operation.responseString rangeOfString:@"s"].location != NSNotFound) {
                
                [self appDelegate].homeVC.PM10Monitor = NO;
            } else if (([operation.responseString rangeOfString:@"d"].location != NSNotFound) || ([operation.responseString rangeOfString:@"a"].location != NSNotFound)) {
                
                [self appDelegate].homeVC.PM10Monitor = YES;
            }
            
            [self appDelegate].handler.homeData = finalArray;
            [[self appDelegate].handler refreshHomeView];
            
        } else {
            
            
        }
        
        self.isRefreshHomeData = NO;
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        self.isRefreshHomeData = NO;
        
    }];
    
    [engine enqueueOperation:op];
    self.isRefreshHomeData = YES;
}

- (void)deleteMyDeviceWithDeviceMAC:(NSString *)deviceMac inView:(AllMyDeviceVC *)view
{
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androiddelequipment.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentUserID forKey:@"param1"];
    [param setValue:deviceMac forKey:@"param2"];
    
    NSLog(@"%@,%@",[self appDelegate].handler.currentUserID,deviceMac);
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kDELETEMYDEVICESEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"%@",operation.responseString);
        
        if ([operation.responseString rangeOfString:@"success"].location != NSNotFound ) {
            
            if ([[[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] isEqualToString:deviceMac]) {
                [[NSUserDefaults standardUserDefaults] setObject:nil  forKey:kCURRENTDEVICEMAC];
                [[NSUserDefaults standardUserDefaults] setObject:nil  forKey:kCURRENTDEVICETYPE];
                [[NSUserDefaults standardUserDefaults] setObject:nil  forKey:kCURRENTDEVICELocation];
                [self appDelegate].handler.currentDeviceLocation = nil ;
                [self appDelegate].handler.currentDeviceMac = nil ;
                [self appDelegate].handler.currentDeviceType = nil ;
            }
            [view deleteDeviceSuccess];
            [[self appDelegate].handler.connectingServer loadingAllMyDeviceWithCurrentUserIDAndViewController:nil];
            [[self appDelegate].handler.connectingServer loadingDeviceRecordWithCurrentDeviceMACWithViewController:nil];
            
        } else if ([operation.responseString rangeOfString:@"fail"].location != NSNotFound) {
            
            [view deleteDeviceFail];
            
        }
        
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [view deleteDeviceFail];
        
    }];
    
    [engine enqueueOperation:op];
}

- (void)addRegisteredDeviceWithCurrentUserIDAndPassword:(NSString *)passWord andDeviceMac:(NSString *)deviceMac inView:(AddRegisteredDeviceVC *)view
{
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidaddequipment.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentUserID forKey:@"param1"];
    [param setValue:passWord forKey:@"param2"];
    [param setValue:deviceMac forKey:@"param3"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kADDREGISTEREDDEVICESERVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"%@",operation.responseString);
        
        if ([operation.responseString rangeOfString:@"success"].location != NSNotFound ) {
            
            
            [[self appDelegate].allMyDevicwVC refreshViewWithCurrentUserID];
            [view addRegisteredDeviceSuccess];
            
        } else  {
            
            [view addRegisteredDeviceFail];
            
        }
        
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [view addRegisteredDeviceFail];
        
    }];
    
    [engine enqueueOperation:op];
}

- (void)ControlPM10MonitorWithFlag:(BOOL)flag andViewController:(HomeVC *)viewController
{
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidstart_pm_listenner.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    if (flag) {
        
        [param setValue:@"s" forKey:@"param1"];
    } else {
        [param setValue:@"d" forKey:@"param1"];
    }
    
    

    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kCONTROLPM10MONITORSERVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSLog(@"%@",operation.responseString);
        
        if ([operation.responseString rangeOfString:@"s"].location != NSNotFound ) {
            
            [viewController launchPM10Success];
           
        
            
        } else  if ([operation.responseString rangeOfString:@"d"].location != NSNotFound  ){
            
          
            [viewController shutDownPM10Success];
        }
        
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        if (flag) {
            
            [viewController launchPM10Fail];
        } else {
            [viewController shutDownPM10Fail];
        }
        
    }];
    
    [engine enqueueOperation:op];
}


- (void)getAirconditionAllStudyFlagWithCurrentDeviceMacInView:(AirConditionRemoteVC *)view
{
    if ([self appDelegate].handler.currentDeviceMac == nil) {
        return;
    }
    
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidAllStudyFlag.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentDeviceMac forKey:@"param1"];

    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kGETAIRCONDITIONALLSTUDYFLAGSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSString *tempStr = [operation.responseString stringByReplacingOccurrencesOfString:@"\r\n\r\n" withString:@""];
        
        
        view.studyFlag = tempStr;

        [view fixWithStudyFlag];
        [view checkFlagSuccess];
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [view checkFlagFail];
        
    }];
    
    [engine enqueueOperation:op];
}

- (void)AirconditionStudyWithSubject:(int)subject inView:(StudyRemoteTypeAirCondition *)view
{
    NSString *subjectStr;
    
    switch (subject) {
        case 0:
            subjectStr = @"a";
            break;
        case 1:
            subjectStr = @"b";
            break;
        case 2:
            subjectStr = @"c";
            break;
        case 3:
            subjectStr = @"d";
            break;
        case 4:
            subjectStr = @"e";
            break;
        case 5:
            subjectStr = @"f";
            break;
        case 6:
            subjectStr = @"g";
            break;
        case 7:
            subjectStr = @"h";
            break;
            
            
        default:
            break;
    }
    
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidStudy.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentDeviceMac forKey:@"param1"];
    [param setValue:subjectStr forKey:@"param2"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kAIRCONDITIONSTUDYSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
     //   NSString *tempStr = operation.responseString;
        
        [view studySuccess];
        
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [view studyFail];
    }];
    
    [engine enqueueOperation:op];
}

- (void)AirconditionControlWithSubject:(int)subject inView:(AirConditionRemoteVC *)view
{
    NSString *subjectStr;
    
    switch (subject) {
        case 0:
            subjectStr = @"a";
            break;
        case 1:
            subjectStr = @"b";
            break;
        case 2:
            subjectStr = @"c";
            break;
        case 3:
            subjectStr = @"d";
            break;
        case 4:
            subjectStr = @"e";
            break;
        case 5:
            subjectStr = @"f";
            break;
        case 6:
            subjectStr = @"g";
            break;
        case 7:
            subjectStr = @"h";
            break;
            
            
        default:
            break;
    }
    
 //   NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidTeleControl.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentDeviceMac forKey:@"param2"];
    [param setValue:subjectStr forKey:@"param1"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kAIRCONDITIONCONTROLSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        //   NSString *tempStr = operation.responseString;
        
        view.isRequesting = NO;
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        view.isRequesting = NO;
        
    }];
    
    [engine enqueueOperation:op];
    view.isRequesting = YES;
}

- (void)getAirClearnerAllStudyFlagWithCurrentDeviceMacInView:(AirCleanerRemoteVC *)view
{
    if ([self appDelegate].handler.currentDeviceMac == nil) {
        return;
    }
    
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidairfindallstudy.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentDeviceMac forKey:@"param1"];
    
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kGETAIRCLEARNERALLSTUDYFLAGSERVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSString *tempStr = [operation.responseString stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
        
        view.studyFlag = tempStr;
        
        [view fixWithStudyFlag];
        [view checkFlagSuccess];
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [view checkFlagFail];
        
    }];
    
    [engine enqueueOperation:op];
}

- (void)AirCleanerStudyWithSubject:(int)subject inView:(StudyRemoteTypeAirCondition *)view
{
    NSString *subjectStr;
    
    switch (subject) {
        case 0:
            subjectStr = @"a";
            break;
        case 1:
            subjectStr = @"b";
            break;
        case 2:
            subjectStr = @"c";
            break;
        case 3:
            subjectStr = @"d";
            break;
        case 4:
            subjectStr = @"e";
            break;
        case 5:
            subjectStr = @"f";
            break;
        case 6:
            subjectStr = @"g";
            break;
        case 7:
            subjectStr = @"h";
            break;
            
            
        default:
            break;
    }
    
//   NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidAirStudy.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentDeviceMac forKey:@"param1"];
    [param setValue:subjectStr forKey:@"param2"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kAIRCLEANERSTUDYSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        
        
        [view studySuccess];
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [view studyFail];
    }];
    
    [engine enqueueOperation:op];
}

- (void)AirCleanerControlWithSubject:(int)subject inView:(AirCleanerRemoteVC *)view
{
    NSString *subjectStr;
    
    switch (subject) {
        case 0:
            subjectStr = @"a";
            break;
        case 1:
            subjectStr = @"b";
            break;
        case 2:
            subjectStr = @"c";
            break;
        case 3:
            subjectStr = @"d";
            break;
        case 4:
            subjectStr = @"e";
            break;
        case 5:
            subjectStr = @"f";
            break;
        case 6:
            subjectStr = @"g";
            break;
        case 7:
            subjectStr = @"h";
            break;
            
            
        default:
            break;
    }
    
 //   NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidTeleAirControl.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentDeviceMac forKey:@"param2"];
    [param setValue:subjectStr forKey:@"param1"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kAIRCLEANERCONTROLSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        //   NSString *tempStr = operation.responseString;
        
        view.isRequesting = NO;
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        view.isRequesting = NO;
        
    }];
    
    [engine enqueueOperation:op];
    view.isRequesting = YES;
}

- (void)getTVAllStudyFlagWithCurrentDeviceMacInView:(TVRemoteVC *)view
{
    if ([self appDelegate].handler.currentDeviceMac == nil) {
        return;
    }
    
 //   NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidtvfindallstudy.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentDeviceMac forKey:@"param1"];
    
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kGETTVALLSTUDYFLAGSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        
       
        NSString *tempStr = [operation.responseString stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
        
        
        
       view.studyFlag = tempStr;
        
        [view fixWithStudyFlag];
        [view checkFlagSuccess];
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [view checkFlagFail];
        
    }];
    
    [engine enqueueOperation:op];
}

- (void)TVStudyWithSubject:(int)subject inView:(StudyRemoteTypeAirCondition *)view
{
    NSString *subjectStr;
    
    switch (subject) {
        case 0:
            subjectStr = @"a";
            break;
        case 1:
            subjectStr = @"b";
            break;
        case 2:
            subjectStr = @"c";
            break;
        case 3:
            subjectStr = @"d";
            break;
        case 4:
            subjectStr = @"e";
            break;
        case 5:
            subjectStr = @"f";
            break;
        case 6:
            subjectStr = @"g";
            break;
        
            
        default:
            break;
    }
    
//    NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidTVStudy.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentDeviceMac forKey:@"param1"];
    [param setValue:subjectStr forKey:@"param2"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kTVSTUDYSERVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        
        
        [view studySuccess];
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        [view studyFail];
    }];
    
    [engine enqueueOperation:op];
}

- (void)TVControlWithSubject:(int)subject inView:(TVRemoteVC *)view
{
    NSString *subjectStr;
    
    switch (subject) {
        case 0:
            subjectStr = @"a";
            break;
        case 1:
            subjectStr = @"b";
            break;
        case 2:
            subjectStr = @"c";
            break;
        case 3:
            subjectStr = @"d";
            break;
        case 4:
            subjectStr = @"e";
            break;
        case 5:
            subjectStr = @"f";
            break;
        case 6:
            subjectStr = @"g";
            break;
            
            
        default:
            break;
    }
    
 //   NSString *urlStr = [[NSString alloc] initWithFormat:@"/quan/androidTeleTVControl.jsp"];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:[self appDelegate].handler.currentDeviceMac forKey:@"param2"];
    [param setValue:subjectStr forKey:@"param1"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:kSERVERHOSTNAME customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:kTVCONTROLSEVERPATH params:param httpMethod:@"POST"];
    
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        //   NSString *tempStr = operation.responseString;
        
        view.isRequesting = NO;
        
        
    } errorHandler:^(MKNetworkOperation *errorOP, NSError *err) {
        
        view.isRequesting = NO;
        
    }];
    
    [engine enqueueOperation:op];
    view.isRequesting = YES;
}

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
            
        } else if ([value floatValue] > 0.6 && [value floatValue] < 1.8) {
            
            return @"超    标";
            
        } else if ([value floatValue] >= 1.8) {
            
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
            
        } else if ([value floatValue] > 0.6 && [value floatValue] < 1.8) {
            
            return [UIColor yellowColor];
            
        } else if ([value floatValue] >= 1.8) {
            
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
            
        } else if ([value floatValue] > 0.6 && [value floatValue] < 1.8) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] >= 1.8) {
            
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

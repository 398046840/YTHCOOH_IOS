//
//  AppDelegate.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-5.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//  This product includes the MDRadialProgress software component developed by Marco Dinacci.

#import <UIKit/UIKit.h>
#import "UIView+Toast.h"
#import "ResetPasswordVC.h"
#import "MMProgressHUD.h"
#import "HomeVC.h"
#import "IQKeyboardManager.h"
#import "ConnectingServer.h"
#import "AllMyDeviceVC.h"
#import "RecordsetVC.h"
#import "TempData.h"
#import "recordingsVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (nonatomic, copy) NSString *currentUserID;
//@property (nonatomic, copy) NSString *currentDeviceMac;
//@property (nonatomic, copy) NSString *currentDeviceLocation;
//@property (nonatomic, copy) NSString *currentDeviceType;



@property (nonatomic, strong) UITabBarController *tabBar;
@property (nonatomic, strong) AllMyDeviceVC *allMyDevicwVC;
@property (nonatomic, strong) HomeVC *homeVC;
@property (nonatomic ,strong) recordingsVC *recordingsVC;

@property (nonatomic, strong) TempData *handler;

@property (nonatomic, strong) NSMutableArray *allMyDevices;
@property (nonatomic, strong) NSMutableDictionary *recordDataDic;

- (BOOL)checkTel:(NSString *)str;

- (void)showAlertView:(NSString *)message;
- (BOOL)allInfomationPreparedWithOriginalPwd:(NSString *)originalPwd andNewPwd:(NSString *)newPwd andSurePwd:(NSString *)surePwd;
- (BOOL)allInfomationPreparedWithUserID:(NSString *)userID andUserPassword:(NSString *)userPassword;
- (void)logOut;

//- (void)refreshMyDevicesDataWithDic:(NSMutableArray *)dic;
//- (void)refreshHomeDataWithDeviceMac:(NSString *)deviceMac;
- (void)refreshRecordView;


- (CGSize)stringSizeWithString:(NSString *)string andWidthLimit:(float)widthLimit andFontSize:(float)fontSize;


@end


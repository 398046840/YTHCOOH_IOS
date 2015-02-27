//
//  ConnectingServer.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-8.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectingServer : NSObject

@property (nonatomic, assign) BOOL isRefreshHomeData;
@property (nonatomic, assign) BOOL isLoadingAllDevice;










//注册
- (void)registerWithUserID:(NSString *)userID andUserPassword:(NSString *)userPassword andViewController:(UIViewController *)viewController;
//登录
- (void)loginWithUserID:(NSString *)userID andUserPassword:(NSString *)userPassword andViewController:(UIViewController *)viewController;
//修改密码前验证
- (void)retrievePasswordWithUserID:(NSString *)userID andDeviceMAC:(NSString *)deviceMAC andViewController:(UIViewController *)viewController;
//忘记密码，再修改密码
- (void)resetPasswordWithUserID:(NSString *)userID andNewPassword:(NSString *)newPassword andViewController:(UIViewController *)viewController;
//修改密码
- (void)changePwdWithUserID:(NSString *)userID andNewPwd:(NSString *)newPwd andViewController:(UIViewController *)viewController;
//修改当前设备位置
- (void)changeLocationWithDeviceMac:(NSString *)deviceMac andNewLocation:(NSString *)newLocation  andViewController:(UIViewController *)viewController;
//获得当前账号所有设备
- (void)loadingAllMyDeviceWithCurrentUserIDAndViewController:(UIViewController *)viewController;
//获得当前选择设备的最近记录
- (void)loadingDeviceRecordWithCurrentDeviceMACWithViewController:(UIViewController *)viewController;
//获得当前设备实时数据
- (void)loadingDeviceNewDetailWithDeviceMAC:(NSString *)deviceMac andDeviceType:(NSString *)type;
//删除设备
- (void)deleteMyDeviceWithDeviceMAC:(NSString *)deviceMac inView:(UIViewController *)view;
//添加已初始化设备
- (void)addRegisteredDeviceWithCurrentUserIDAndPassword:(NSString *)passWord andDeviceMac:(NSString *)deviceMac inView:(UIViewController *)view;
//PM10监听
- (void)ControlPM10MonitorWithFlag:(BOOL)flag andViewController:(UIViewController *)viewController;

- (UIColor *)whatTextColorWithValue:(NSString *)value inType:(NSString *)type;


//获得空调遥控器学习标记
- (void)getAirconditionAllStudyFlagWithCurrentDeviceMacInView:(UIViewController *)view;
//第一次学习
- (void)AirconditionStudyWithSubject:(int)subject inView:(UIViewController *)view;
//空调控制
- (void)AirconditionControlWithSubject:(int)subject inView:(UIViewController *)view;

//获得空气净化器学习标记
- (void)getAirClearnerAllStudyFlagWithCurrentDeviceMacInView:(UIViewController *)view;
//第一次学习
- (void)AirCleanerStudyWithSubject:(int)subject inView:(UIViewController *)view;
//空调控制
- (void)AirCleanerControlWithSubject:(int)subject inView:(UIViewController *)view;

//获得TV学习标记
- (void)getTVAllStudyFlagWithCurrentDeviceMacInView:(UIViewController *)view;
//第一次学习
- (void)TVStudyWithSubject:(int)subject inView:(UIViewController *)view;
//空调控制
- (void)TVControlWithSubject:(int)subject inView:(UIViewController *)view;

@end

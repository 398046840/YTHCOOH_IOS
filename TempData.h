//
//  CurrentUserAllTempData.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-17.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectingServer.h"

@interface TempData : NSObject

@property (nonatomic, copy) NSString *currentUserID;
@property (nonatomic, copy) NSString *currentDeviceMac;
@property (nonatomic, copy) NSString *currentDeviceLocation;
@property (nonatomic, copy) NSString *currentDeviceType;

@property (nonatomic, strong) NSMutableArray *allMyDevices;
@property (nonatomic, strong) NSMutableDictionary *recordDataDic;
@property (nonatomic, strong) NSMutableArray *homeData;


@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) ConnectingServer *connectingServer;


- (void)refreshMyDevicesDataWithDic:(NSMutableArray *)dic;

- (void)refreshHomeDataWithCurrentDeviceMac;
- (void)refreshHomeView;
- (void)setHomeDataToNil;

@end

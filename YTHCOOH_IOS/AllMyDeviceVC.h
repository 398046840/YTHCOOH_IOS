//
//  AddDeviceVC.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-7.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllMyDeviceVC : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) IBOutlet UITableView *allMyDevice;

@property (nonatomic, strong) NSMutableArray *allMyDevices;




- (void)deleteDeviceSuccess;
- (void)deleteDeviceFail;

- (void)refreshViewWithCurrentUserID;
@end

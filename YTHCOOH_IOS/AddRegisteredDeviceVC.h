//
//  AddRegisteredDeviceVC.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-13.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRegisteredDeviceVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *deviceMAC;
@property (strong, nonatomic) IBOutlet UITextField *currentUserIDPassword;

- (IBAction)addRegisteredDevice:(id)sender;
- (IBAction)nextTextField:(id)sender;

- (void)addRegisteredDeviceSuccess;
- (void)addRegisteredDeviceFail;
@end

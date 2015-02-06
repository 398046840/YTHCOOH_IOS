//
//  LocationSettingVC.h
//  YTHCOOH_IOS
//
//  Created by 123 on 15-2-4.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationSettingVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *originalLocation;

@property (strong, nonatomic) IBOutlet UITextField *freshLocation;

- (IBAction)changeLocationWithDeviceMacAndNewLocation:(id)sender;

- (void)changeSuccess;
- (void)changeFail;

@end

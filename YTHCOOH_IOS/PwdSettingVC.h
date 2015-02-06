//
//  PwdSettingVC.h
//  YTHCOOH_IOS
//
//  Created by 123 on 15-2-4.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PwdSettingVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *originalPwd;

@property (strong, nonatomic) IBOutlet UITextField *freshPwd;

@property (strong, nonatomic) IBOutlet UITextField *surePwd;

- (IBAction)changePwdWithNewPwd:(id)sender;

- (void)changeSuccess;
- (void)changeFail;

@end

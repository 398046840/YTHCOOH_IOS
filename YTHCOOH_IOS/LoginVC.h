//
//  LoginVC.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-5.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *userID;
@property (strong, nonatomic) IBOutlet UITextField *userPassword;
@property (strong, nonatomic) IBOutlet UISwitch *savePassword;
@property (strong, nonatomic) IBOutlet UISwitch *autoLogin;

@property (strong, nonatomic) IBOutlet UIButton *forgotPasswordButton;
@property (strong, nonatomic) IBOutlet UIButton *registerButton;


- (IBAction)autoLogin:(id)sender;
- (IBAction)savePassword:(id)sender;

- (IBAction)nextField:(id)sender;

- (IBAction)Login:(id)sender;
- (void)loginSuccess;
- (void)loginFail;
@end

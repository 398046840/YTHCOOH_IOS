//
//  ResetPasswordVC.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-12.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPasswordVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *Password;
@property (strong, nonatomic) IBOutlet UITextField *verifyPassword;

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *oldPassword;

- (IBAction)nextField:(id)sender;

- (IBAction)changePassword:(id)sender;

- (void)resetSuccess;
- (void)resetFail;

@end

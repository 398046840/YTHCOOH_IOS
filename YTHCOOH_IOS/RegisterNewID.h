//
//  RegisterNewID.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-12.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterNewID : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *UserID;
@property (strong, nonatomic) IBOutlet UITextField *Password;
@property (strong, nonatomic) IBOutlet UISwitch *agreeWithProtocol;


- (IBAction)registerWithUserIDAndPassword:(id)sender;

- (void)registerSuccess;
- (void)registerFail;

@end

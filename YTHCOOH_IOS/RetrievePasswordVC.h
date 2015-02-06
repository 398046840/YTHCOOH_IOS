//
//  RetrievePassword.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-12.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RetrievePasswordVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *userID;
@property (strong, nonatomic) IBOutlet UITextField *deviceMAC;

- (IBAction)nextField:(id)sender;

- (IBAction)retrievePassword:(id)sender;

- (void)verifySuccess;

- (void)verifyFail;

@end

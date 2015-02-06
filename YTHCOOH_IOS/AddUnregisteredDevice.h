//
//  AddUnregisteredDevice.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-13.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddUnregisteredDevice : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *WIFIAccounts;
@property (strong, nonatomic) IBOutlet UITextField *WIFIPassword;

- (IBAction)initDevice:(id)sender;
@end

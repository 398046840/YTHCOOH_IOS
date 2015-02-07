//
//  LocationSettingVC.m
//  YTHCOOH_IOS
//
//  Created by 123 on 15-2-4.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "LocationSettingVC.h"
#import "AppDelegate.h"

@implementation LocationSettingVC

- (void)viewDidLoad{
    [super viewDidLoad];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *originalLocation = [userDefaults objectForKey:kCURRENTDEVICELocation];
    
    [self originalLocation].text = originalLocation;
    
}


- (IBAction)changeLocationWithDeviceMacAndNewLocation:(id)sender {
    NSString *freshLocation = [self freshLocation].text;
    
    if (freshLocation == nil || 0 == freshLocation.length) {
        [[self appDelegate].window makeToast:@"位置不能为空" duration:1.5 position:CSToastPositionCenter];
        return;
    }else{
        [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleNone];
        [MMProgressHUD showWithTitle:@"更改中..."];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *deviceMac = [userDefaults objectForKey:kCURRENTDEVICEMAC];
        [[self appDelegate].handler.connectingServer changeLocationWithDeviceMac:deviceMac andNewLocation:freshLocation andViewController:self];
        
    }
    
}

- (void)changeSuccess{
    [MMProgressHUD dismissWithSuccess:@"更改成功"];
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.freshLocation.text forKey:kCURRENTDEVICELocation];
    [self appDelegate].handler.currentDeviceLocation = self.freshLocation.text;
    
    [[self appDelegate].handler.connectingServer loadingDeviceRecordWithCurrentDeviceMACWithViewController:([self appDelegate].recordingsVC != nil)? [self appDelegate].recordingsVC : nil];
}

- (void)changeFail{
    [MMProgressHUD dismissWithError:@"更改失败"];
}

- (AppDelegate *) appDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

@end

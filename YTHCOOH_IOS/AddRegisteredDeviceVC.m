//
//  AddRegisteredDeviceVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-13.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "AddRegisteredDeviceVC.h"
#import "AppDelegate.h"

@interface AddRegisteredDeviceVC ()

@end

@implementation AddRegisteredDeviceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addRegisteredDevice:(id)sender {
    
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleNone];
    [MMProgressHUD showWithTitle:@"添加中..."];
    
    [[self appDelegate].handler.connectingServer addRegisteredDeviceWithCurrentUserIDAndPassword:self.currentUserIDPassword.text andDeviceMac:self.deviceMAC.text inView:self];
}

- (IBAction)nextTextField:(id)sender {
    
    [self.deviceMAC resignFirstResponder];
    [self.currentUserIDPassword becomeFirstResponder];
}

- (void)addRegisteredDeviceSuccess
{
    [MMProgressHUD dismissWithSuccess:@"添加成功!"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addRegisteredDeviceFail
{
    [MMProgressHUD dismissWithError:@"添加失败!请稍后再试"];
}

@end

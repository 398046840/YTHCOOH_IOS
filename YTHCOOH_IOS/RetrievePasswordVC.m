//
//  RetrievePassword.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-12.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "RetrievePasswordVC.h"
#import "AppDelegate.h"

@interface RetrievePasswordVC ()

@end

@implementation RetrievePasswordVC

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


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ResetPasswordVC *viewController = segue.destinationViewController;
    viewController.userID = self.userID.text;
    
}


- (IBAction)nextField:(id)sender {
    
    [self.userID resignFirstResponder];
    [self.deviceMAC becomeFirstResponder];
}

- (IBAction)retrievePassword:(id)sender {
    
    if ([[self appDelegate] checkTel:self.userID.text]) {
        
        [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleNone];
        [MMProgressHUD showWithTitle:@"验证中..."];
        [[self appDelegate].handler.connectingServer retrievePasswordWithUserID:self.userID.text andDeviceMAC:self.deviceMAC.text andViewController:self];
        
    }
}

- (void)verifySuccess
{
    [MMProgressHUD dismissWithSuccess:@"验证成功!"];
    
    [self performSegueWithIdentifier:@"ResetPassword" sender:nil];
}

- (void)verifyFail
{
    [MMProgressHUD dismissWithError:@"手机号与设备号不匹配!"];
}

@end

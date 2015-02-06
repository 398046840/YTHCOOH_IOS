//
//  ResetPasswordVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-12.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "ResetPasswordVC.h"
#import "AppDelegate.h"

@interface ResetPasswordVC ()

@end

@implementation ResetPasswordVC

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

- (IBAction)nextField:(id)sender {
    
    [self.Password resignFirstResponder];
    [self.verifyPassword becomeFirstResponder];
    
}

- (IBAction)changePassword:(id)sender {
    
    if ([self verifyPasswordSame]) {
        
        [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleNone];
        [MMProgressHUD showWithTitle:@"修改中..."];
        [[self appDelegate].handler.connectingServer resetPasswordWithUserID:self.userID andNewPassword:self.Password.text andViewController:self];
        
    }
}

- (BOOL)verifyPasswordSame
{
    if (self.Password.text.length < 6 || self.Password.text.length > 16) {
        
        [[self appDelegate].window makeToast:@"密码为6-16位数字或字母" duration:1.5 position:CSToastPositionTop];
        return NO;
    }
    
    if (![self.Password.text isEqualToString:self.verifyPassword.text]) {
        
        [[self appDelegate].window makeToast:@"密码不一致!" duration:1.5 position:CSToastPositionTop];
        return NO;
    }
    
    return YES;
}

- (void)resetSuccess
{
    [MMProgressHUD dismissWithSuccess:@"修改成功!"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)resetFail
{
    [MMProgressHUD dismissWithError:@"修改失败!请稍后再试"];
}

@end

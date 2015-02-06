//
//  RegisterNewID.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-12.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "RegisterNewID.h"
#import "AppDelegate.h"

@interface RegisterNewID ()

@end

@implementation RegisterNewID

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

- (IBAction)registerWithUserIDAndPassword:(id)sender {
    
    if (!self.agreeWithProtocol.on) {
        
        [[self appDelegate].window makeToast:@"请阅读并同意《空气检测系统移动应用使用协议》" duration:1.5 position:CSToastPositionCenter];
        return;
    }
    
    
    if ([[self appDelegate] allInfomationPreparedWithUserID:self.UserID.text andUserPassword:self.Password.text]) {
        
        [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleNone];
        [MMProgressHUD showWithTitle:@"注册中..."];
        [[self appDelegate].handler.connectingServer registerWithUserID:self.UserID.text andUserPassword:self.Password.text andViewController:self];
        
    }
    
    
}

- (void)registerSuccess
{
    [MMProgressHUD dismissWithSuccess:@"注册成功!"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)registerFail
{
    [MMProgressHUD dismissWithError:@"注册失败!请稍后再试"];
}

@end

//
//  PwdSettingVC.m
//  YTHCOOH_IOS
//
//  Created by 123 on 15-2-4.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "PwdSettingVC.h"
#import "AppDelegate.h"

@implementation PwdSettingVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
}

- (IBAction)changePwdWithNewPwd:(id)sender {
    NSString *originalPwd = [self originalPwd].text;
    NSString *freshPwd = [self freshPwd].text;
    NSString *surePwd = [self surePwd].text;
    
    if (![[self appDelegate] allInfomationPreparedWithOriginalPwd:originalPwd andNewPwd:freshPwd andSurePwd:surePwd]) {
        
        return;
    }else{
        NSString *userID = [self appDelegate].handler.currentUserID;
        [MMProgressHUD setPresentationStyle:(MMProgressHUDPresentationStyleNone)];
        [MMProgressHUD showWithTitle:@"更改中..."];
        [[self appDelegate].handler.connectingServer changePwdWithUserID:userID andNewPwd:freshPwd andViewController:self];
        
    }
    
    
}

- (AppDelegate *)appDelegate{
    return [[UIApplication sharedApplication] delegate];
}

- (void)changeSuccess{
    [MMProgressHUD dismissWithSuccess:@"更改成功"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changeFail{
    [MMProgressHUD dismissWithError:@"更改失败"];
}

@end

//
//  LoginVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-5.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "LoginVC.h"
#import "AppDelegate.h"


@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.forgotPasswordButton.layer setMasksToBounds:YES];
    [self.forgotPasswordButton.layer setCornerRadius:0]; //设置矩形四个圆角半径
    [self.forgotPasswordButton.layer setBorderWidth:0]; //边框宽度
    
    [self.registerButton.layer setMasksToBounds:YES];
    [self.registerButton.layer setCornerRadius:0]; //设置矩形四个圆角半径
    [self.registerButton.layer setBorderWidth:0]; //边框宽度
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"SavePassword"] integerValue]) {
        self.userID.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"];
        self.userPassword.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserPassword"];
        self.savePassword.on = YES;
    } else {
        self.userID.text = @"";
        self.userPassword.text = @"";
        self.savePassword.on = NO;
    }
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"AutoLogin"] integerValue]) {
        self.autoLogin.on = YES;
    } else {
        self.autoLogin.on = NO;
    }
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"AutoLogin"] integerValue]) {
        [self Login:nil];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"SavePassword"] integerValue]) {
        self.userID.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"];
        self.userPassword.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserPassword"];
        self.savePassword.on = YES;
    } else {
        self.userID.text = @"";
        self.userPassword.text = @"";
        self.savePassword.on = NO;
    }
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"AutoLogin"] integerValue]) {
        self.autoLogin.on = YES;
    } else {
        self.autoLogin.on = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
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
    
    self.navigationController.navigationBarHidden = NO;
}



- (IBAction)autoLogin:(id)sender {
    
    if (self.autoLogin.on == YES) {
        
        [self.savePassword setOn:YES animated:YES];
    }
    
    [self saveUserSetting];
}

- (IBAction)savePassword:(id)sender {
    
    if (self.savePassword.on == NO) {
        
        [self.autoLogin setOn:NO animated:YES];
    }
    
    [self saveUserSetting];
}

- (IBAction)nextField:(id)sender {
    
    [self.userID resignFirstResponder];
    [self.userPassword becomeFirstResponder];
    
}

- (IBAction)Login:(id)sender {
    
    [self saveUserSetting];
    
    if (![[self appDelegate] allInfomationPreparedWithUserID:self.userID.text andUserPassword:self.userPassword.text]) {
        
        return;
        
    }
    
    [[self appDelegate].handler.connectingServer loginWithUserID:self.userID.text andUserPassword:self.userPassword.text andViewController:self];
    
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleNone];
    [MMProgressHUD showWithTitle:@"登录中..."];
    
//    [self loginSuccess];
    
}

- (void)saveUserSetting
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",self.savePassword.on == YES ? 1 : 0] forKey:@"SavePassword"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",self.autoLogin.on == YES ? 1 : 0] forKey:@"AutoLogin"];
    
  //  if (self.savePassword.on == YES) {
        [[NSUserDefaults standardUserDefaults] setObject:self.userID.text forKey:@"UserID"];
        [[NSUserDefaults standardUserDefaults] setObject:self.userPassword.text forKey:@"UserPassword"];
  //  } else {
//        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"UserID"];
//        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"UserPassword"];
 //   }
}

- (void)loginSuccess
{
    [MMProgressHUD dismissWithSuccess:@"登录成功!"];
    
    [self appDelegate].handler.currentUserID = self.userID.text;
    

    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"logined"];
    
    viewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:viewController animated:YES completion:nil];
    
 //   [[self appDelegate].handler refreshHomeDataWithCurrentDeviceMac];
}

- (void)loginFail
{
    [MMProgressHUD dismissWithError:@"登录失败!请检查您的账号密码"];
}

@end

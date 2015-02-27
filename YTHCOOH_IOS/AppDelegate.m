//
//  AppDelegate.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-5.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    self.handler = [[TempData alloc] init];
    self.allMyDevices = [[NSMutableArray alloc] init];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



-(void)showAlertView:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:message delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alertView show];
}

-(void)logOut
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"确定注销?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.tag = 99;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 99 && buttonIndex == 1) {
        
        [self presentLoginView];
    }
    
    if (alertView.tag == 99 && buttonIndex == 0) {
        
       
    }
}

- (BOOL)allInfomationPreparedWithOriginalPwd:(NSString *)originalPwd andNewPwd:(NSString *)newPwd andSurePwd:(NSString *)surePwd
{
    if (originalPwd.length == 0 || newPwd.length == 0 || surePwd.length == 0) {
        [self.window makeToast:@"不能有空" duration:1.5 position:CSToastPositionCenter];
        return NO;
    }
    if(![self checkPwdLength:newPwd]){
        
        return NO;
    }
    if (![self isEqualNewPwd:newPwd andSurePwd:surePwd]) {
        return NO;
    }
    if (![self isEqualToOriginalPwd:originalPwd]) {
        return NO;
    }
    
    return YES;
}

- (BOOL)allInfomationPreparedWithUserID:(NSString *)userID andUserPassword:(NSString *)userPassword
{
    
    if (![self checkTel:userID]) {
        
        return NO;
        
    }
    
    if(![self checkPwdLength:userPassword]){
        
        return NO;
    }
    
    return YES;
    
}

- (BOOL)isEqualNewPwd:(NSString *)newPwd andSurePwd:(NSString *)surePwd{
    if(![newPwd isEqualToString:surePwd]){
        [self.window  makeToast:@"密码不一致" duration:1.5 position:CSToastPositionCenter];
        return NO;
    }
    return YES;
}

- (BOOL)isEqualToOriginalPwd:(NSString *)originalPwd{
    //取得本地保存的用户密码
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *pwd = [userDefaults objectForKey:@"UserPassword"];
    if(![pwd isEqualToString:originalPwd]){
        [self.window  makeToast:@"原始密码不正确" duration:1.5 position:CSToastPositionCenter];
        return NO;
    }
    return YES;
}

- (BOOL)checkPwdLength:(NSString *)str{
    if (str.length < 6 || str.length > 16) {
        
        [self.window  makeToast:@"密码为6-16位数字或字母" duration:1.5 position:CSToastPositionCenter];
        return NO;
    }
    return YES;
}

- (BOOL)checkTel:(NSString *)str

{
    
    if ([str length] == 0) {
        
        [self.window  makeToast:@"账号不能为空!" duration:1.5 position:CSToastPositionTop];
        return NO;
    }
    
    //1[0-9]{10}
    
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    
    //    NSString *regex = @"[0-9]{11}";
    
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (!isMatch) {
        
        [self.window  makeToast:@"手机号为国内手机号码" duration:1.5 position:CSToastPositionTop];
        
        return NO;
        
    }
    
    return YES;
    
}

- (CGSize)stringSizeWithString:(NSString *)string andWidthLimit:(float)widthLimit andFontSize:(float)fontSize
{
    CGSize labelSize;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 6.9) {
    
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
        labelSize = [string boundingRectWithSize:CGSizeMake(widthLimit, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attribute context:nil].size;
    
    } else {
    
        labelSize = [string sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(widthLimit, CGFLOAT_MAX) lineBreakMode:UILineBreakModeCharacterWrap];
    }

    return labelSize;
}

- (void)presentLoginView
{
    [self.homeVC dismissViewControllerAnimated:YES completion:nil];
}

- (void)refreshRecordView
{
    [self.recordingsVC refreshRecordingsWithLocation:0 andLength:15];
}



@end

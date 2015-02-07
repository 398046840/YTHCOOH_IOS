//
//  AddUnregisteredDevice.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-13.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "AddUnregisteredDevice.h"
#import "GCDAsyncSocket.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import "AppDelegate.h"

@interface AddUnregisteredDevice ()

@end

@implementation AddUnregisteredDevice

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.WIFIAccounts.text = [self currentWifiSSID];
    
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"help"] isEqualToString:@"YES"]) {
        
        [self performSegueWithIdentifier:@"help" sender:nil];
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"help"];
    }
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

- (IBAction)initDevice:(id)sender {
    
    GCDAsyncSocket  *socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    
    NSError *err ;
    [socket connectToHost:kSOCKETHOST onPort:KSOCKETPORT error:&err];
    
    
    NSString *dataStr = [NSString stringWithFormat:@"#$&60i1%@|%@|%@|~~~~~~~~~~^`",self.WIFIAccounts,self.WIFIPassword,[self appDelegate].handler.currentUserID];
    
    for (int i = (int)[dataStr length]; i < 61; i++ ) {
        
        [dataStr stringByReplacingOccurrencesOfString:@"^`" withString:@"~^`"];
    }
    
    NSData* aData= [dataStr dataUsingEncoding: NSUTF8StringEncoding];
    
     [socket writeData:aData withTimeout:-1 tag:0];
    [socket readDataWithTimeout:-1 tag:0];
    
    
}

- (NSString *)currentWifiSSID {
    // Does not work on the simulator.
    NSString *ssid = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info[@"SSID"]) {
            ssid = info[@"SSID"];
        }
    }
    return ssid;
}

#pragma GCDSocketDelegate
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    [sock readDataWithTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSString* aStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"===%@",aStr);
    [[self appDelegate] showAlertView:aStr];
     [sock readDataWithTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    
}
@end

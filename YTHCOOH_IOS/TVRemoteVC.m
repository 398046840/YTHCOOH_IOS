//
//  TVRemoteVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-29.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "TVRemoteVC.h"
#import "AppDelegate.h"
#import "StudyRemoteTypeAirCondition.h"

@interface TVRemoteVC ()

@end

@implementation TVRemoteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.studyButton.layer setMasksToBounds:YES];
    [self.studyButton.layer setCornerRadius:8]; //设置矩形四个圆角半径
    [self.studyButton.layer setBorderWidth:3]; //边框宽度
    [self.studyButton.layer setBorderColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor];
    
    [self checkStudyFlag];
    
    self.isRequesting = NO;
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
    
    if ([segue.identifier isEqualToString:@"StudyTV"]) {
        
        StudyRemoteTypeAirCondition *viewController = segue.destinationViewController;
        viewController.type = @"TV";
    }
}


- (void)checkStudyFlag
{
    [self.view makeToastActivity];
    [[self appDelegate].handler.connectingServer getTVAllStudyFlagWithCurrentDeviceMacInView:self];
}

- (IBAction)clickLaunch:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer TVControlWithSubject:0 inView:self];
}

- (IBAction)clickShutDown:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer TVControlWithSubject:1 inView:self];
}

- (IBAction)clickOK:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer TVControlWithSubject:2 inView:self];
}

- (IBAction)clickUp:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer TVControlWithSubject:3 inView:self];
}

- (IBAction)clickDown:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer TVControlWithSubject:4 inView:self];
}

- (IBAction)clickRight:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer TVControlWithSubject:5 inView:self];
}

- (IBAction)clickLeft:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer TVControlWithSubject:6 inView:self];
}

- (IBAction)startStudy:(id)sender {
    
    [self performSegueWithIdentifier:@"StudyTV" sender:nil];
}

- (void)fixWithStudyFlag
{
    NSArray *tempArray = [self.studyFlag componentsSeparatedByString:@"."];
    
    for (int i = 0; i < tempArray.count; i++) {
        
        switch (i) {
            case 0:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.launch setEnabled:NO];
                    [self.launch setImage:[UIImage imageNamed:@"television_launch_no"] forState:UIControlStateNormal];
                    
                } else {
                    
                    [self.launch setEnabled:YES];
                    [self.launch setImage:[UIImage imageNamed:@"television_launch_no"] forState:UIControlStateNormal];
                    
                }
                break;
            case 1:
                
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.shoutDown setEnabled:NO];
                    [self.shoutDown setImage:[UIImage imageNamed:@"television_shoutDown_no"] forState:UIControlStateNormal];
                    
                } else {
                    [self.shoutDown setEnabled:YES];
                    [self.shoutDown setImage:[UIImage imageNamed:@"television_shoutDown_no"] forState:UIControlStateNormal];
                }
                
                break;
            case 2:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.OK setEnabled:NO];
                    [self.OK setImage:[UIImage imageNamed:@"television_menu_ok"] forState:UIControlStateNormal];
                    
                } else {
                    [self.OK setEnabled:YES];
                    [self.OK setImage:[UIImage imageNamed:@"television_menu_ok"] forState:UIControlStateNormal];
                }
                
                
                break;
            case 3:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.up setEnabled:NO];
                    [self.up setImage:[UIImage imageNamed:@"television_chanle_up"] forState:UIControlStateNormal];
                    
                } else {
                    [self.up setEnabled:YES];
                    [self.up setImage:[UIImage imageNamed:@"television_chanle_up"] forState:UIControlStateNormal];
                }
                
                break;
            case 4:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.down setEnabled:NO];
                    [self.down setImage:[UIImage imageNamed:@"television_chanle_down"] forState:UIControlStateNormal];
                    
                } else {
                    [self.down setEnabled:YES];
                    [self.down setImage:[UIImage imageNamed:@"television_chanle_down"] forState:UIControlStateNormal];
                }
                
                break;
            case 5:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.right setEnabled:NO];
                    [self.right setImage:[UIImage imageNamed:@"television_vol_up"] forState:UIControlStateNormal];
                    
                } else {
                    [self.right setEnabled:YES];
                    [self.right setImage:[UIImage imageNamed:@"television_vol_up"] forState:UIControlStateNormal];
                }
                
                break;
            case 6:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.left setEnabled:NO];
                    [self.left setImage:[UIImage imageNamed:@"television_vol_down"] forState:UIControlStateNormal];
                } else {
                    [self.left setEnabled:YES];
                    [self.left setImage:[UIImage imageNamed:@"television_vol_down"] forState:UIControlStateNormal];
                }
                
                break;
            
                
                
                
                
            default:
                break;
        }
        
    }
}

- (void)checkFlagSuccess
{
    [self.view hideToastActivity];
}

- (void)checkFlagFail
{
    [self.view hideToastActivity];
    self.studyFlag = @"OFF.OFF.OFF.OFF.OFF.OFF.OFF";
}

@end

//
//  AirCleanerRemoteVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-29.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "AirCleanerRemoteVC.h"
#import "AppDelegate.h"
#import "StudyRemoteTypeAirCondition.h"

@interface AirCleanerRemoteVC ()

@end

@implementation AirCleanerRemoteVC

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
 if ([segue.identifier isEqualToString:@"StudyAirCleaner"]) {
 
     StudyRemoteTypeAirCondition *viewController = segue.destinationViewController;
     viewController.type = @"AirCleaner";
 }
}


- (void)checkStudyFlag
{
    [self.view makeToastActivity];
    [[self appDelegate].handler.connectingServer getAirClearnerAllStudyFlagWithCurrentDeviceMacInView:self];
}

- (IBAction)clickLaunch:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirCleanerControlWithSubject:0 inView:self];
}

- (IBAction)clickShutDown:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirCleanerControlWithSubject:1 inView:self];
}

- (IBAction)clickAnion:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirCleanerControlWithSubject:2 inView:self];
}

- (IBAction)clickWind:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirCleanerControlWithSubject:3 inView:self];
}

- (IBAction)clickTime:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirCleanerControlWithSubject:4 inView:self];
}

- (IBAction)clickKill:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirCleanerControlWithSubject:5 inView:self];
}

- (IBAction)clickAutomate:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirCleanerControlWithSubject:6 inView:self];
}

- (IBAction)clickAir:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirCleanerControlWithSubject:7 inView:self];
}

- (IBAction)startStudy:(id)sender {
    
    [self performSegueWithIdentifier:@"StudyAirCleaner" sender:nil];
}

- (void)fixWithStudyFlag
{
    NSArray *tempArray = [self.studyFlag componentsSeparatedByString:@"."];
    
    for (int i = 0; i < tempArray.count; i++) {
        
        switch (i) {
            case 0:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.launch setEnabled:NO];
                    [self.launch setImage:[UIImage imageNamed:@"air_condition_launch_un"] forState:UIControlStateNormal];
                    
                } else {
                    
                    [self.launch setEnabled:YES];
                    [self.launch setImage:[UIImage imageNamed:@"air_condition_launch_st"] forState:UIControlStateNormal];
                    
                }
                break;
            case 1:
                
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.shoutDown setEnabled:NO];
                    [self.shoutDown setImage:[UIImage imageNamed:@"air_condition_shoutDown_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.shoutDown setEnabled:YES];
                    [self.shoutDown setImage:[UIImage imageNamed:@"air_condition_shoutDown_st"] forState:UIControlStateNormal];
                }
                
                break;
            case 2:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.anion setEnabled:NO];
                    [self.anion setImage:[UIImage imageNamed:@"air_condition_warm_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.anion setEnabled:YES];
                    [self.anion setImage:[UIImage imageNamed:@"air_condition_warm_st"] forState:UIControlStateNormal];
                }
                
                
                break;
            case 3:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.wind setEnabled:NO];
                    [self.wind setImage:[UIImage imageNamed:@"air_condition_arefaction_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.wind setEnabled:YES];
                    [self.wind setImage:[UIImage imageNamed:@"air_condition_arefaction_st"] forState:UIControlStateNormal];
                }
                
                break;
            case 4:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.time setEnabled:NO];
                    [self.time setImage:[UIImage imageNamed:@"air_condition_ temperature+_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.time setEnabled:YES];
                    [self.time setImage:[UIImage imageNamed:@"air_condition_ temperature+_stu"] forState:UIControlStateNormal];
                }
                
                break;
            case 5:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.kill setEnabled:NO];
                    [self.kill setImage:[UIImage imageNamed:@"air_condition_ temperature-_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.kill setEnabled:YES];
                    [self.kill setImage:[UIImage imageNamed:@"air_condition_ temperature-_st"] forState:UIControlStateNormal];
                }
                
                break;
            case 6:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.automate setEnabled:NO];
                    [self.automate setImage:[UIImage imageNamed:@"air_condition_cool_un"] forState:UIControlStateNormal];
                } else {
                    [self.automate setEnabled:YES];
                    [self.automate setImage:[UIImage imageNamed:@"air_condition_cool_st"] forState:UIControlStateNormal];
                }
                
                break;
            case 7:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.air setEnabled:NO];
                    [self.air setImage:[UIImage imageNamed:@"air_condition_wind_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.air setEnabled:YES];
                    [self.air setImage:[UIImage imageNamed:@"air_condition_wind_st"] forState:UIControlStateNormal];
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
    self.studyFlag = @"OFF.OFF.OFF.OFF.OFF.OFF.OFF.OFF";
}

@end

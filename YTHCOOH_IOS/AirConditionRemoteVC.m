//
//  AirConditionRemoteVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-29.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "AirConditionRemoteVC.h"
#import "AppDelegate.h"
#import "StudyRemoteTypeAirCondition.h"

@interface AirConditionRemoteVC ()

@end

@implementation AirConditionRemoteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.studyButton.layer setMasksToBounds:YES];
    [self.studyButton.layer setCornerRadius:8]; //设置矩形四个圆角半径
    [self.studyButton.layer setBorderWidth:3]; //边框宽度
    [self.studyButton.layer setBorderColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor];
    
    
    
    self.isRequesting = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self checkStudyFlag];
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"StudyAircondition"]) {
        
        StudyRemoteTypeAirCondition *viewController = segue.destinationViewController;
        viewController.type = @"Aircondition";
    }
}

- (IBAction)clickLaunch:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirconditionControlWithSubject:0 inView:self];
}

- (IBAction)clickShutDown:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirconditionControlWithSubject:1 inView:self];
}

- (IBAction)clickWarm:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirconditionControlWithSubject:2 inView:self];
}

- (IBAction)clickArefaction:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirconditionControlWithSubject:3 inView:self];
}

- (IBAction)clickTempUp:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirconditionControlWithSubject:4 inView:self];
}

- (IBAction)clickTempDown:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirconditionControlWithSubject:5 inView:self];
}

- (IBAction)clickCool:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirconditionControlWithSubject:6 inView:self];
}

- (IBAction)clickWind:(id)sender {
    
    if (self.isRequesting) {
        return;
    }
    [[self appDelegate].handler.connectingServer AirconditionControlWithSubject:7 inView:self];
}

- (IBAction)startStudy:(id)sender {
    
    [self performSegueWithIdentifier:@"StudyAircondition" sender:nil];
}

- (void)checkStudyFlag
{
    [self.view makeToastActivity];
    [[self appDelegate].handler.connectingServer getAirconditionAllStudyFlagWithCurrentDeviceMacInView:self];
}

- (void)fixWithStudyFlag
{
    NSArray *tempArray = [self.studyFlag componentsSeparatedByString:@"."];
    
    for (int i = 0; i < tempArray.count; i++) {
        
        switch (i) {
            case 0:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.launchButton setEnabled:NO];
                    [self.launchButton setImage:[UIImage imageNamed:@"air_condition_launch_un"] forState:UIControlStateNormal];
                    
                } else {
                    
                    [self.launchButton setEnabled:YES];
                    [self.launchButton setImage:[UIImage imageNamed:@"air_condition_launch_st"] forState:UIControlStateNormal];
                    
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
                    
                    [self.warm setEnabled:NO];
                    [self.warm setImage:[UIImage imageNamed:@"air_condition_warm_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.warm setEnabled:YES];
                    [self.warm setImage:[UIImage imageNamed:@"air_condition_warm_st"] forState:UIControlStateNormal];
                }
                
                
                break;
            case 3:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.cool setEnabled:NO];
                    [self.cool setImage:[UIImage imageNamed:@"air_condition_cool_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.cool setEnabled:YES];
                    [self.cool setImage:[UIImage imageNamed:@"air_condition_cool_st"] forState:UIControlStateNormal];
                }
                
                break;
            case 4:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.arefaction setEnabled:NO];
                    [self.arefaction setImage:[UIImage imageNamed:@"air_condition_arefaction_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.arefaction setEnabled:YES];
                    [self.arefaction setImage:[UIImage imageNamed:@"air_condition_arefaction_st"] forState:UIControlStateNormal];
                }
                
                break;
            case 5:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.wind setEnabled:NO];
                    [self.wind setImage:[UIImage imageNamed:@"air_condition_wind_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.wind setEnabled:YES];
                    [self.wind setImage:[UIImage imageNamed:@"air_condition_wind_st"] forState:UIControlStateNormal];
                }
                
                break;
            case 6:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.tempDown setEnabled:NO];
                    [self.tempDown setImage:[UIImage imageNamed:@"air_condition_ temperature-_un"] forState:UIControlStateNormal];
                } else {
                    [self.tempDown setEnabled:YES];
                    [self.tempDown setImage:[UIImage imageNamed:@"air_condition_ temperature-_st"] forState:UIControlStateNormal];
                }
                
                break;
            case 7:
                if ([[tempArray objectAtIndex:i] isEqualToString:@"OFF"]) {
                    
                    [self.tempUp setEnabled:NO];
                    [self.tempUp setImage:[UIImage imageNamed:@"air_condition_ temperature+_un"] forState:UIControlStateNormal];
                    
                } else {
                    [self.tempUp setEnabled:YES];
                    [self.tempUp setImage:[UIImage imageNamed:@"air_condition_ temperature+_stu"] forState:UIControlStateNormal];
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

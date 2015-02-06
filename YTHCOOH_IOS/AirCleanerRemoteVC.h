//
//  AirCleanerRemoteVC.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-29.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AirCleanerRemoteVC : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *studyButton;

@property (strong, nonatomic) IBOutlet UIButton *launch;
@property (strong, nonatomic) IBOutlet UIButton *time;
@property (strong, nonatomic) IBOutlet UIButton *shoutDown;
@property (strong, nonatomic) IBOutlet UIButton *kill;
@property (strong, nonatomic) IBOutlet UIButton *anion;
@property (strong, nonatomic) IBOutlet UIButton *automate;
@property (strong, nonatomic) IBOutlet UIButton *wind;
@property (strong, nonatomic) IBOutlet UIButton *air;

//判断是否已经在请求
@property (nonatomic,assign) BOOL isRequesting;

@property (nonatomic, strong) NSString *studyFlag;
- (IBAction)clickLaunch:(id)sender;
- (IBAction)clickShutDown:(id)sender;
- (IBAction)clickAnion:(id)sender;
- (IBAction)clickWind:(id)sender;
- (IBAction)clickTime:(id)sender;
- (IBAction)clickKill:(id)sender;
- (IBAction)clickAutomate:(id)sender;
- (IBAction)clickAir:(id)sender;


- (IBAction)startStudy:(id)sender;
- (void)fixWithStudyFlag;

- (void)checkFlagSuccess;
- (void)checkFlagFail;

@end

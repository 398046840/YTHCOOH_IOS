//
//  AirConditionRemoteVC.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-29.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AirConditionRemoteVC : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *studyButton;
@property (nonatomic, strong) NSString *studyFlag;
@property (strong, nonatomic) IBOutlet UIButton *launchButton;
@property (strong, nonatomic) IBOutlet UIButton *tempUp;
@property (strong, nonatomic) IBOutlet UIButton *shoutDown;
@property (strong, nonatomic) IBOutlet UIButton *tempDown;
@property (strong, nonatomic) IBOutlet UIButton *warm;
@property (strong, nonatomic) IBOutlet UIButton *cool;
@property (strong, nonatomic) IBOutlet UIButton *arefaction;
@property (strong, nonatomic) IBOutlet UIButton *wind;
//判断是否已经在请求
@property (nonatomic,assign) BOOL isRequesting;

- (IBAction)clickLaunch:(id)sender;
- (IBAction)clickShutDown:(id)sender;
- (IBAction)clickWarm:(id)sender;
- (IBAction)clickArefaction:(id)sender;
- (IBAction)clickTempUp:(id)sender;
- (IBAction)clickTempDown:(id)sender;
- (IBAction)clickCool:(id)sender;
- (IBAction)clickWind:(id)sender;

- (IBAction)startStudy:(id)sender;

- (void)fixWithStudyFlag;

- (void)checkFlagSuccess;
- (void)checkFlagFail;

@end

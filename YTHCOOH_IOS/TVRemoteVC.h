//
//  TVRemoteVC.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-29.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVRemoteVC : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *studyButton;
@property (strong, nonatomic) IBOutlet UIButton *launch;
@property (strong, nonatomic) IBOutlet UIButton *shoutDown;
@property (strong, nonatomic) IBOutlet UIButton *OK;
@property (strong, nonatomic) IBOutlet UIButton *up;
@property (strong, nonatomic) IBOutlet UIButton *down;
@property (strong, nonatomic) IBOutlet UIButton *left;
@property (strong, nonatomic) IBOutlet UIButton *right;

//判断是否已经在请求
@property (nonatomic,assign) BOOL isRequesting;
@property (nonatomic, strong) NSString *studyFlag;
- (IBAction)clickLaunch:(id)sender;
- (IBAction)clickShutDown:(id)sender;
- (IBAction)clickOK:(id)sender;
- (IBAction)clickUp:(id)sender;
- (IBAction)clickDown:(id)sender;
- (IBAction)clickRight:(id)sender;
- (IBAction)clickLeft:(id)sender;

- (IBAction)startStudy:(id)sender;
- (void)fixWithStudyFlag;

- (void)checkFlagSuccess;
- (void)checkFlagFail;
@end

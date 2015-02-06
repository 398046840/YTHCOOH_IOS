//
//  HomeDetailTypePMVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-20.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "HomeDetailTypePMVC.h"
#import "AppDelegate.h"

@interface HomeDetailTypePMVC ()

@end

@implementation HomeDetailTypePMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.suggest = [[UILabel alloc] init];
    self.suggest.font = [UIFont systemFontOfSize:13];
    self.suggest.backgroundColor = [UIColor clearColor];
    self.suggest.numberOfLines = 0;
    
    self.pointer = [CALayer layer];
    [self.pointer setBounds:CGRectMake(0, 0, 17, 71)];
    [self.pointer setContents:(id)[UIImage imageNamed:@"pm2"].CGImage];
    
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
        
        [self.pointer setPosition:CGPointMake(self.view.center.x, self.watch.frame.origin.y + self.watch.frame.size.height / 2 - 64 + 5)];
    } else {
        [self.pointer setPosition:CGPointMake(self.view.center.x, self.watch.frame.origin.y + self.watch.frame.size.height / 2 + 5)];
    }
    
    
    
    
    [self.pointer setAnchorPoint:CGPointMake(0.5, 0.91)];
    [self.view.layer addSublayer:self.pointer];
    
    [self.pointer setTransform:CATransform3DMakeRotation(degreeTOradians(-140), 0,0, 1)];
    
    [self setUp];
    
    
    //self.pointer.transform = CGAffineTransformMakeRotation(degreeTOradians(90));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    if (self.transformAngle > 280.0) {
        self.transformAngle = 280;
    }
    
    if ( !(self.transformAngle > 140)) {
        
        [UIView animateWithDuration:0.26 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
         {
             self.pointer.transform = CATransform3DMakeRotation(degreeTOradians(-140 + self.transformAngle), 0,0, 1);
         }completion:nil];
        
        
        
        
    }
    else {
        NSLog(@"%f",self.transformAngle);
        
        
        [UIView animateWithDuration:0.13 delay:0 options:UIViewAnimationOptionCurveLinear animations:^
         {
             self.pointer.transform = CATransform3DMakeRotation(degreeTOradians(0), 0,0, 1);
         }completion:^(BOOL finish) {
             
             [NSTimer scheduledTimerWithTimeInterval:0.13 target:self selector:@selector(partTwoTransform) userInfo:nil repeats:NO];
             
         }];
        
    }
    
    
}

- (void)partTwoTransform
{
    NSLog(@"%f",self.transformAngle);
    self.pointer.transform = CATransform3DMakeRotation( degreeTOradians(self.transformAngle - 140), 0,0, 1);
}

- (void)setUp
{
    self.BG.image = [UIImage imageNamed:[self.dataDic objectForKey:@"Color"]];
    self.BG2.image = [UIImage imageNamed:[self.dataDic objectForKey:@"Color"]];
    
    
    [self.BG2.layer setMasksToBounds:YES];
    [self.BG2.layer setCornerRadius:4]; //设置矩形四个圆角半径
    [self.BG2.layer setBorderWidth:0.1]; //边框宽度
    [self.BGWhite.layer setMasksToBounds:YES];
    [self.BGWhite.layer setCornerRadius:4]; //设置矩形四个圆角半径
    [self.BGWhite.layer setBorderWidth:0.1]; //边框宽度
    
    self.level.text = [self.dataDic objectForKey:@"Level"];
    self.value.text = [NSString stringWithFormat:@"%@ 单位(微克每立方米)",[[self.dataDic objectForKey:@"Value"] stringByReplacingOccurrencesOfString:@"ug/m³" withString:@""]];
    self.navigationItem.title = [NSString stringWithFormat:@"%@浓度",[[self.dataDic objectForKey:@"Project"] stringByReplacingOccurrencesOfString:@":" withString:@""]];
    self.subject.text = [[self.dataDic objectForKey:@"Project"] stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSString *valueStr = [[self.dataDic objectForKey:@"Value"] stringByReplacingOccurrencesOfString:@"ug/m³" withString:@""];
    self.transformAngle = (280.0 / 250.0) * valueStr.floatValue;
    [self suggestWithLevel];
}

- (void)suggestWithLevel
{
    if ([[self.dataDic objectForKey:@"Level"] isEqualToString:@"优"]) {
        
        self.suggest.text = @"各类人群可正常活动。";
        
    } else if ([[self.dataDic objectForKey:@"Level"] isEqualToString:@"良"]) {
        
        self.suggest.text = @"各类人群可正常活动。";
        
    } else if ([[self.dataDic objectForKey:@"Level"] isEqualToString:@"轻度污染"]) {
        
        self.suggest.text = @"儿童、老人、心脏病和呼吸系统疾病患者应减少长时间、高强度的户外锻炼。家有空净设备的亲，可开启空净设备。";
        
    } else if ([[self.dataDic objectForKey:@"Level"] isEqualToString:@"中度污染"]) {
        
        self.suggest.text = @"儿童、老年人及心脏病、呼吸系统疾病患者应避免长时间、高强度的户外锻炼，一般人群减少户外运动,出门可戴口罩。家有空净设备的亲，建议开启空气设备。";
        
    } else if ([[self.dataDic objectForKey:@"Level"] isEqualToString:@"重度污染"]) {
        
        self.suggest.text = @"儿童、老年人和心脏病患者应停留在室内，停止户外活动，一般人群减少户外活动，出门戴口罩。家有空净设备的亲，开启空净设备。";
        
    } else if ([[self.dataDic objectForKey:@"Level"] isEqualToString:@"严重污染"]) {
        
        self.suggest.text = @"儿童、老年人和心脏病患者应停留在室内，停止户外活动，一般人群减少户外活动。出门戴口罩。家有空净设备的亲，开启空净设备。";
        
    }
    
    
    CGSize labelSize = [[self appDelegate] stringSizeWithString:self.suggest.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 70 andFontSize:13.0];
    
    
    
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
        
        self.suggest.frame = CGRectMake(35, self.value.frame.origin.y + 80 - 64, labelSize.width, labelSize.height);
    } else {
        self.suggest.frame = CGRectMake(35, self.value.frame.origin.y + 80, labelSize.width, labelSize.height);
    }
    
    [self.view addSubview:self.suggest];
}

@end

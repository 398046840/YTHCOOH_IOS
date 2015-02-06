//
//  StudyRemoteTypeAirConditionView.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-29.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "StudyRemoteTypeAirConditionView.h"
#import "AppDelegate.h"

@implementation StudyRemoteTypeAirConditionView

- (id)initWithFrame:(CGRect)frame andTittle:(int)title
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        UIImageView *BG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StudyBG"]];
        [BG setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 75, 190, 150, 100)];
        [BG.layer setMasksToBounds:YES];
        [BG.layer setCornerRadius:4];
        [BG.layer setBorderWidth:1];
        
        UIImageView *BG1 = [[UIImageView alloc] init];
        [BG1 setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 75, 10, 150, 100)];
        [BG1.layer setMasksToBounds:YES];
        [BG1.layer setCornerRadius:8];
        [BG1.layer setBorderWidth:1];
        
        UILabel *firstStep = [[UILabel alloc] init];
        firstStep.numberOfLines = 0;
        [firstStep setTextColor:[UIColor whiteColor]];
        [firstStep setFont:[UIFont systemFontOfSize:15]];
        [firstStep setBackgroundColor:[UIColor clearColor]];
        
        UILabel *secondStep = [[UILabel alloc] init];
        secondStep.numberOfLines = 0;
        [secondStep setTextColor:[UIColor whiteColor]];
        [secondStep setFont:[UIFont systemFontOfSize:15]];
        [secondStep setBackgroundColor:[UIColor clearColor]];
        
        
        CGSize labelSize;
        
        switch (title) {
            case 0:
                
                BG1.image = [UIImage imageNamed:@"StudyLaunch"];
                
                firstStep.text = @"1.学习开机,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空调遥控器对准空气检测系统,并按下开机按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 1:
                BG1.image = [UIImage imageNamed:@"StudyShutDown"];
                
                firstStep.text = @"1.学习关机,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空调遥控器对准空气检测系统,并按下关机按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 2:
                BG1.image = [UIImage imageNamed:@"Study+"];
                
                firstStep.text = @"1.学习温度+,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空调遥控器对准空气检测系统,并按下温度+按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 3:
                BG1.image = [UIImage imageNamed:@"Study-"];
                
                firstStep.text = @"1.学习温度-,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空调遥控器对准空气检测系统,并按下温度-按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 4:
                BG1.image = [UIImage imageNamed:@"StudyWarm"];
                
                firstStep.text = @"1.学习制热,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空调遥控器对准空气检测系统,并按下制热按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 5:
                BG1.image = [UIImage imageNamed:@"StudyCool"];
                
                firstStep.text = @"1.学习制冷,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空调遥控器对准空气检测系统,并按下制冷按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 6:
                BG1.image = [UIImage imageNamed:@"StudyArefaction"];
                
                firstStep.text = @"1.学习除湿,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空调遥控器对准空气检测系统,并按下除湿按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 7:
                BG1.image = [UIImage imageNamed:@"StudyWind"];
                
                firstStep.text = @"1.学习送风,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空调遥控器对准空气检测系统,并按下送风按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 8:
                BG1.image = [UIImage imageNamed:@"StudyLaunch"];
                
                firstStep.text = @"1.学习开机,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空气净化器遥控器对准空气检测系统,并按下开机按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 9:
                BG1.image = [UIImage imageNamed:@"StudyShutDown"];
                
                firstStep.text = @"1.学习关机,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空气净化器遥控器对准空气检测系统,并按下关机按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 10:
                BG1.image = [UIImage imageNamed:@"StudyAnion"];
                
                firstStep.text = @"1.学习负离子,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空气净化器遥控器对准空气检测系统,并按下负离子按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 11:
                BG1.image = [UIImage imageNamed:@"StudyWindLevel"];
                
                firstStep.text = @"1.学习风速,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空气净化器遥控器对准空气检测系统,并按下风速按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 12:
                BG1.image = [UIImage imageNamed:@"StudyTime"];
                
                firstStep.text = @"1.学习定时,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空气净化器遥控器对准空气检测系统,并按下定时按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 13:
                BG1.image = [UIImage imageNamed:@"StudyKill"];
                
                firstStep.text = @"1.学习杀菌,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空气净化器遥控器对准空气检测系统,并按下杀菌按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 14:
                BG1.image = [UIImage imageNamed:@"StudyAutomate"];
                
                firstStep.text = @"1.学习自动,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空气净化器遥控器对准空气检测系统,并按下自动按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 15:
                BG1.image = [UIImage imageNamed:@"StudyAir"];
                
                firstStep.text = @"1.学习空气感应,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将空气净化器遥控器对准空气检测系统,并按下空气感应按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 16:
                BG1.image = [UIImage imageNamed:@"Study_TV_launch"];
                
                firstStep.text = @"1.学习开机,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将电视遥控器对准空气检测系统,并按下开机按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 17:
                BG1.image = [UIImage imageNamed:@"Study_TV_shutDown"];
                
                firstStep.text = @"1.学习关机,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将电视遥控器对准空气检测系统,并按下关机按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 18:
                BG1.image = [UIImage imageNamed:@"menu_ok_study"];
                
                firstStep.text = @"1.学习菜单,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将电视遥控器对准空气检测系统,并按下菜单按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 19:
                BG1.image = [UIImage imageNamed:@"chanle_up_study"];
                
                firstStep.text = @"1.学习频道+,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将电视遥控器对准空气检测系统,并按下频道+按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 20:
                BG1.image = [UIImage imageNamed:@"chanle_down_study"];
                
                firstStep.text = @"1.学习频道-,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将电视遥控器对准空气检测系统,并按下频道-按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 21:
                BG1.image = [UIImage imageNamed:@"vol_up_study"];
                
                firstStep.text = @"1.学习音量+,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将电视遥控器对准空气检测系统,并按下音量+按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
            case 22:
                BG1.image = [UIImage imageNamed:@"vol_down_study"];
                
                firstStep.text = @"1.学习音量-,请点击开始学习";
                labelSize = [[self appDelegate] stringSizeWithString:firstStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                firstStep.frame = CGRectMake(30, BG1.frame.origin.y + BG1.frame.size.height + 20, labelSize.width, labelSize.height);
                
                secondStep.text = @"2.将电视遥控器对准空气检测系统,并按下音量-按钮";
                labelSize = [[self appDelegate] stringSizeWithString:secondStep.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 60 andFontSize:15.0];
                secondStep.frame = CGRectMake(30, BG.frame.origin.y + BG.frame.size.height + 20, labelSize.width, labelSize.height);
                break;
                
            default:
                break;
        }
        
        [self addSubview:BG];
        [self addSubview:BG1];
        [self addSubview:firstStep];
        [self addSubview:secondStep];
        
    }
    
    return self;
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

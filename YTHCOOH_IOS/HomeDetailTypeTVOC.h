//
//  HomeDetailTypeTVOC.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-20.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDetailTypeTVOC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *BGWhite;
@property (strong, nonatomic) IBOutlet UIImageView *BG2;

@property (strong, nonatomic) IBOutlet UIImageView *BG;
@property (strong, nonatomic) IBOutlet UIImageView *watch;
@property (strong, nonatomic) IBOutlet UILabel *subject;
@property (strong, nonatomic) UILabel *suggest;
@property (strong, nonatomic) IBOutlet UILabel *value;
@property (strong, nonatomic) IBOutlet UILabel *level;

@property (nonatomic, strong) CALayer *pointer;
@property (nonatomic, strong) NSDictionary *dataDic;
@property (nonatomic) float transformAngle;

@end

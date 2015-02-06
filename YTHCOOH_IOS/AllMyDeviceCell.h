//
//  AllMyDeviceCell.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-7.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllMyDeviceCell : UITableViewCell

@property (nonatomic, strong) UILabel *DEVICEMAC;
@property (nonatomic, strong) UILabel *DEVICELOCATION;
@property (nonatomic ,strong) UILabel *DEVICETYPE;

@property (nonatomic, strong) UILabel *deviceMAC;
@property (nonatomic, strong) UILabel *deviceLocation;
@property (nonatomic, strong) UILabel *deviceType;

@property (nonatomic, strong) UIImageView *bg;
@property (nonatomic, strong) UIImageView *deviceImage;
@property (nonatomic, strong) UILabel *DeviceNumber;

- (AllMyDeviceCell *)initAllMyDeviceCell;
@end

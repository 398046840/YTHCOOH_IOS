//
//  AllMyDeviceCell.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-7.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "AllMyDeviceCell.h"

@implementation AllMyDeviceCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (AllMyDeviceCell *)initAllMyDeviceCell
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
        
        self.bg = [[UIImageView alloc] init];
        self.bg.image = [UIImage imageNamed:@"MyDeviceCellBG"];
        self.bg.frame = CGRectMake(20, 10, [UIScreen mainScreen].bounds.size.width - 40, 120);
        
        self.deviceImage = [[UIImageView alloc] init];
        self.deviceImage.image = [UIImage imageNamed:@"MyDeviceCellImage"];
        self.deviceImage.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 40 - 75, 30, 75, 63);
        
        self.DeviceNumber = [[UILabel alloc] init];
        self.DeviceNumber.font = [UIFont systemFontOfSize:19];
        self.DeviceNumber.backgroundColor = [UIColor clearColor];
        
        self.deviceMAC = [[UILabel alloc] init];
        self.deviceMAC.font = [UIFont systemFontOfSize:(13)];
        self.deviceMAC.backgroundColor = [UIColor clearColor];
        
        self.deviceLocation = [[UILabel alloc] init];
        self.deviceLocation.font = [UIFont systemFontOfSize:(13)];
        self.deviceLocation.backgroundColor = [UIColor clearColor];
        
        self.deviceType = [[UILabel alloc] init];
        self.deviceType.backgroundColor = [UIColor clearColor];
        self.deviceType.font = [UIFont systemFontOfSize:(13)];
        
    
        self.DEVICEMAC = [[UILabel alloc] init];
        self.DEVICEMAC.text = @"设备编号 :";
        self.DEVICEMAC.backgroundColor = [UIColor clearColor];
        self.DEVICEMAC.font = [UIFont systemFontOfSize:(12)];
        CGSize sizeMAC = [self.DEVICEMAC.text sizeWithFont:[UIFont systemFontOfSize:12]];
        self.DEVICEMAC.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2, 40, sizeMAC.width, sizeMAC.height);
        
        self.DEVICELOCATION = [[UILabel alloc] init];
        self.DEVICELOCATION.text = @"设备位置 :";
        self.DEVICELOCATION.backgroundColor = [UIColor clearColor];
        self.DEVICELOCATION.font = [UIFont systemFontOfSize:(12)];
        CGSize sizeLocation = [self.DEVICELOCATION.text sizeWithFont:[UIFont systemFontOfSize:12]];
        self.DEVICELOCATION.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2, 60, sizeLocation.width, sizeLocation.height);
        
        self.DEVICETYPE = [[UILabel alloc] init];
        self.DEVICETYPE.text = @"设备型号 :";
        self.DEVICETYPE.backgroundColor = [UIColor clearColor];
        self.DEVICETYPE.font = [UIFont systemFontOfSize:(12)];
        CGSize sizeType = [self.DEVICETYPE.text sizeWithFont:[UIFont systemFontOfSize:12]];
        self.DEVICETYPE.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2, 80, sizeType.width, sizeType.height);
        
        
        [self addSubview:self.bg];
        [self addSubview:self.deviceImage];
        [self addSubview:self.DeviceNumber];
        [self addSubview:self.deviceMAC];
        [self addSubview:self.deviceLocation];
        [self addSubview:self.deviceType];
        [self addSubview:self.DEVICEMAC];
        [self addSubview:self.DEVICELOCATION];
        [self addSubview:self.DEVICETYPE];
       
    }
    return self;

    
}

@end

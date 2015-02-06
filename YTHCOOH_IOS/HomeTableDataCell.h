//
//  HomeTableDataCell.h
//  YTHCOOH_IOS
//
//  Created by afable on 15/1/7.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableDataCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *project;
@property (weak, nonatomic) IBOutlet UILabel *value;


@property (nonatomic, strong) UIImageView *levelColor;
@property (nonatomic, strong) UILabel *level;
@end

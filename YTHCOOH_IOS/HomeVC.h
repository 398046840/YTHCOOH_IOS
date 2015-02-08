//
//  HomeVC.h
//  YTHCOOH_IOS
//
//  Created by afable on 15/1/7.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeVC : UITableViewController

@property (nonatomic, strong) NSMutableArray *homeData;
@property (nonatomic,assign) BOOL PM10Monitor;


- (void)refreshPM10Monitor;
- (void)launchPM10Success;
- (void)launchPM10Fail;
- (void)shutDownPM10Success;
- (void)shutDownPM10Fail;
@end

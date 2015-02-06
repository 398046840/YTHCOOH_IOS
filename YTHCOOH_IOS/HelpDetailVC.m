//
//  HelpDetailVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-15.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "HelpDetailVC.h"
#import "AppDelegate.h"

@interface HelpDetailVC ()

@end

@implementation HelpDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [self.dataDic objectForKey:@"Content"];
    label.font = [UIFont systemFontOfSize:13];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    
    
    

    CGSize labelSize = [[self appDelegate] stringSizeWithString:label.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 32 andFontSize:13.0];
    
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
        
        label.frame = CGRectMake(16, 10, labelSize.width, labelSize.height);
    } else {
        label.frame = CGRectMake(16, 10 + 64, labelSize.width, labelSize.height);
    }
    
    
    
    [self.view addSubview:label];
    
    self.title = [self.dataDic objectForKey:@"Subject"];
    
   
    
    
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

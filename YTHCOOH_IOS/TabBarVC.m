//
//  TabBarVC.m
//  YTHCOOH_IOS
//
//  Created by afable on 15/1/7.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "TabBarVC.h"
#import "AppDelegate.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self appDelegate].tabBar = self;
    self.selectedIndex = 0;
    

//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"LoginButton"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

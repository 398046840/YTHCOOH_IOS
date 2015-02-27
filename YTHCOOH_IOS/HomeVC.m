//
//  HomeVC.m
//  YTHCOOH_IOS
//
//  Created by afable on 15/1/7.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "HomeVC.h"
#import "AppDelegate.h"
#import "HomeTableDataCell.h"
#import "HomeTablePrompt.h"
#import "HomeDetailTypePMVC.h"
#import "HomeDetailTypeTVOC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self appDelegate].homeVC = self;
    
    
    if ([self appDelegate].handler.homeData == nil) {
        [[self appDelegate].handler setHomeDataToNil];
    }
    
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] != nil) {
        [[self appDelegate].handler refreshHomeDataWithCurrentDeviceMac];
    } else {
        [[self appDelegate].handler setHomeDataToNil];
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] == nil) {
        
        return;
    }
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICETYPE] isEqualToString:@"YT133"]) {
        
        self.navigationItem.rightBarButtonItem = nil;
        
        
    } else {
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"启动" style:UIBarButtonItemStyleDone target:self action:@selector(launchPM10)];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


- (void)launchPM10
{
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"启动"]) {
        
        [MMProgressHUD showWithTitle:@"正在开启PM10监听..."];
        [[self appDelegate].handler.connectingServer ControlPM10MonitorWithFlag:YES andViewController:self];
    } else if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"关闭"]) {
        [MMProgressHUD showWithTitle:@"正在关闭PM10监听..."];
        [[self appDelegate].handler.connectingServer ControlPM10MonitorWithFlag:NO andViewController:self];
    }
}

- (void)refreshPM10Monitor
{
    if (self.PM10Monitor) {
        
        self.navigationItem.rightBarButtonItem.title = @"关闭";
        
    } else  {
        
        self.navigationItem.rightBarButtonItem.title = @"启动";
    }
    
}

- (void)launchPM10Success
{
    [MMProgressHUD dismissWithSuccess:@"成功开启PM10监听"];
}
- (void)launchPM10Fail
{
    [MMProgressHUD dismissWithSuccess:@"开启PM10监听失败"];
}
- (void)shutDownPM10Success
{
    [MMProgressHUD dismissWithSuccess:@"成功关闭PM10监听"];
}
- (void)shutDownPM10Fail
{
    [MMProgressHUD dismissWithSuccess:@"关闭PM10监听失败"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self appDelegate].handler.homeData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (indexPath.row == 0) {
        
        HomeTablePrompt *cell = [tableView dequeueReusableCellWithIdentifier:@"CellTypePrompt" forIndexPath:indexPath];
        
        if ([[[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"Location"] rangeOfString:@"添加"].location != NSNotFound) {
            
            NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:[[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"Location"]];
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(10,10)];
            [att addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15] range:NSMakeRange(10,10)];
            cell.prompt.attributedText = att;
            
        } else {
            
            NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:[[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"Location"]];
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(12,[[[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"Location"] length] - 12)];
            [att addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(12,[[[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"Location"] length] - 12)];
            cell.prompt.attributedText = att;
            
        }
        
        return cell;
    } else {
        
        HomeTableDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellTypeData" forIndexPath:indexPath];
        cell.project.text = [[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"Project"];
        
        cell.value.text = [[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"Value"];
        cell.value.textColor = [[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"TextColor"];
        
        
        
        if (cell.levelColor == nil) {
            cell.levelColor = [[UIImageView alloc] init];
            [cell.levelColor.layer setMasksToBounds:YES];
            [cell.levelColor.layer setCornerRadius:8];
            [cell.levelColor.layer setBorderWidth:0.4];
            [cell addSubview:cell.levelColor];
            
        }
        
        if (cell.level == nil) {
            cell.level = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
            cell.level.textColor = [UIColor whiteColor];
            cell.level.backgroundColor = [UIColor clearColor];
            [cell addSubview:cell.level];
        }
        
        if (indexPath.row >= ([self appDelegate].handler.homeData.count - 2)) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.level removeFromSuperview];
            [cell.levelColor removeFromSuperview];
            cell.levelColor = nil;
            cell.level = nil;
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            
            
        } else {
            
            if ([[[[self appDelegate].handler.homeData objectAtIndex:(indexPath.row )] objectForKey:@"Project"] isEqualToString:@"PM10:" ]) {
                
                [cell.level removeFromSuperview];
                [cell.levelColor removeFromSuperview];
                cell.levelColor = nil;
                cell.level = nil;
                
                
            } else {
                
                cell.levelColor.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 30 - 80, 7.5, 80, 40);
                cell.level.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 35 - 70, 17.5, 70, 20);
                [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
                
                cell.levelColor.image = [UIImage imageNamed:[[[self appDelegate].handler.homeData objectAtIndex:(indexPath.row )] objectForKey:@"Color"]];
                cell.level.text = [[[self appDelegate].handler.homeData objectAtIndex:(indexPath.row )] objectForKey:@"Level"];
                CGSize levelSize = [cell.level.text sizeWithFont:[UIFont systemFontOfSize:17]];
                cell.level.frame = CGRectMake(cell.levelColor.frame.origin.x + cell.levelColor.frame.size.width / 2 - levelSize.width / 2 , 17, levelSize.width, levelSize.height);
            }
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        
        return cell;
        
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height;
    
    if (indexPath.row == 0) {
        height = 44;
    } else {
        height = 55;
    }
    
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ( indexPath.row == 0) {
        
        [self performSegueWithIdentifier:@"AllMyDevice" sender:nil];
    } else if ([[[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"Project"] rangeOfString:@"PM"].location != NSNotFound) {
        
        [self performSegueWithIdentifier:@"ShowPM" sender:[[self appDelegate].handler.homeData objectAtIndex:indexPath.row]];
    } else if ([[[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"Project"] isEqualToString:@"甲醛:"] || [[[[self appDelegate].handler.homeData objectAtIndex:indexPath.row] objectForKey:@"Project"] isEqualToString:@"TVOC:"]) {
        
        [self performSegueWithIdentifier:@"ShowTVOC" sender:[[self appDelegate].handler.homeData objectAtIndex:indexPath.row]];
        
    }
}

- (IBAction)clickLaunchPM10:(id)sender {
}



#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UIViewController *viewController = segue.destinationViewController;
    [viewController setHidesBottomBarWhenPushed:YES];
    
    if ([segue.identifier isEqualToString:@"ShowPM"]) {
        HomeDetailTypePMVC *viewController = segue.destinationViewController;
        [viewController setHidesBottomBarWhenPushed:YES];
        viewController.dataDic = sender;
    } else if ([segue.identifier isEqualToString:@"ShowTVOC"]) {
        HomeDetailTypeTVOC *viewController = segue.destinationViewController;
        [viewController setHidesBottomBarWhenPushed:YES];
        viewController.dataDic = sender;
    }
    
    
    
}


@end

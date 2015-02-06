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
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"LoginButton"] forBarMetrics:UIBarMetricsDefault];
//    
//    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
//        [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:115.0/255.0 green:219.0/255.0 blue:17.0/255.0 alpha:1.0]];
//    }
    
    if ([self appDelegate].handler.homeData == nil) {
        [[self appDelegate].handler setHomeDataToNil];
    }

    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] != nil) {
        [[self appDelegate].handler refreshHomeDataWithCurrentDeviceMac];
    } else {
        [[self appDelegate].handler setHomeDataToNil];
    }
    
    
//    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
//    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
//    [refresh addTarget:self action:@selector(refreshCurrentDeviceDetail) forControlEvents:UIControlEventValueChanged];
//    self.refreshControl = refresh;
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"启动" style:UIBarButtonItemStyleDone target:self action:@selector(launchPM10)];
//    [self.navigationController.navigationBar.]
    
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

//- (void)refreshCurrentDeviceDetail
//{
//    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"加载中..."];
//    
//    
//    [self performSelector:@selector(refreshComplete) withObject:nil afterDelay:3];
//}

//- (void)refreshComplete
//{
//    [self.refreshControl endRefreshing];
//    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
//}

- (void)launchPM10
{
    
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

//- (void)setHomeDataToNil
//{
//    self.homeData = [[NSMutableArray alloc] init];
//    
//    NSMutableDictionary *location = [[NSMutableDictionary alloc] init];
//    [location setObject:@"您当前还没选择设备,请点击选择或添加设备" forKey:@"Location"];
//    [self.homeData addObject:location];
//    
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [dic setObject:@"PM2.5:" forKey:@"Project"];
//    [dic setObject:@"----ug/m³" forKey:@"Value"];
//    [dic setObject:@"------" forKey:@"Level"];
//    [dic setObject:@"LevelColor_Green" forKey:@"Color"];
//    [self.homeData addObject:dic];
//    
//    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc] init];
//    [dic1 setObject:@"PM10:" forKey:@"Project"];
//    [dic1 setObject:@"----ug/m³" forKey:@"Value"];
//    [dic1 setObject:@"------" forKey:@"Level"];
//    [dic1 setObject:@"LevelColor_Green" forKey:@"Color"];
//    [self.homeData addObject:dic1];
//    
//    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
//    [dic2 setObject:@"甲醛:" forKey:@"Project"];
//    [dic2 setObject:@"----mg/m³" forKey:@"Value"];
//    [dic2 setObject:@"------" forKey:@"Level"];
//    [dic2 setObject:@"LevelColor_Green" forKey:@"Color"];
//    [self.homeData addObject:dic2];
//    
//    NSMutableDictionary *dic3 = [[NSMutableDictionary alloc] init];
//    [dic3 setObject:@"TOVC:" forKey:@"Project"];
//    [dic3 setObject:@"----ug/m³" forKey:@"Value"];
//    [dic3 setObject:@"------" forKey:@"Level"];
//    [dic3 setObject:@"LevelColor_Green" forKey:@"Color"];
//    [self.homeData addObject:dic3];
//    
//    NSMutableDictionary *dic4 = [[NSMutableDictionary alloc] init];
//    [dic4 setObject:@"温度:" forKey:@"Project"];
//    [dic4 setObject:@"----℃" forKey:@"Value"];
//    [dic4 setObject:@"------" forKey:@"Level"];
//    [dic4 setObject:@"LevelColor_Green" forKey:@"Color"];
//    [self.homeData addObject:dic4];
//    
//    NSMutableDictionary *dic5 = [[NSMutableDictionary alloc] init];
//    [dic5 setObject:@"湿度:" forKey:@"Project"];
//    [dic5 setObject:@"----%" forKey:@"Value"];
//    [dic5 setObject:@"------" forKey:@"Level"];
//    [dic5 setObject:@"LevelColor_Green" forKey:@"Color"];
//    [self.homeData addObject:dic5];
//}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


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

//
//  MoreVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-7.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "MoreVC.h"
#import "AppDelegate.h"

@interface MoreVC ()

@end

@implementation MoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"LoginButton"] forBarMetrics:UIBarMetricsDefault];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    switch (indexPath.section) {
        case 0:
            
            if ([[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] == nil) {
                
                [self.view makeToast:@"您还没选择设备,请先选择" duration:2.0 position:CSToastPositionCenter];
            } else {
                [self performSegueWithIdentifier:@"Remote" sender:nil];
            }
            break;
        case 1:
            [self performSegueWithIdentifier:@"Help" sender:nil];
            break;
        case 2:
            
            if ([[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] == nil) {
                
                [self.view makeToast:@"您还没选择设备,请先选择" duration:2.0 position:CSToastPositionCenter];
            } else {
               [self performSegueWithIdentifier:@"Setting" sender:nil];
            }
    
            break;
        case 3:
            
            if ([[NSUserDefaults standardUserDefaults] objectForKey:kCURRENTDEVICEMAC] == nil) {
                
                [self.view makeToast:@"您还没选择设备,请先选择" duration:2.0 position:CSToastPositionCenter];
            } else {
                [self performSegueWithIdentifier:@"Warning" sender:nil];
            }
            break;
        case 4:
            [[self appDelegate] logOut];
            break;
        case 5:
            ;
            break;
        case 6:
            [self performSegueWithIdentifier:@"AboutUs" sender:nil];
            break;
            
        default:
            break;
    }
    
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
}

@end

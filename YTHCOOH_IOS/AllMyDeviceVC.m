//
//  AddDeviceVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-7.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "AllMyDeviceVC.h"
#import "AppDelegate.h"
#import "AllMyDeviceCell.h"
#import "ConnectingServer.h"

@interface AllMyDeviceVC ()

@end

@implementation AllMyDeviceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self appDelegate].allMyDevicwVC = self;
    
    self.editButtonItem.title = @"删除";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.allMyDevice.delegate = self;
    self.allMyDevice.dataSource = self;
    [self.allMyDevice setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    [[self appDelegate].handler.connectingServer loadingAllMyDeviceWithCurrentUserIDAndViewController:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[self appDelegate].handler.allMyDevices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    AllMyDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[AllMyDeviceCell alloc] initAllMyDeviceCell];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.DeviceNumber.text = [NSString stringWithFormat:@"尘醛译%d",(int)indexPath.row + 1];
    CGSize deviceNumberSize = [cell.DeviceNumber.text sizeWithFont:[UIFont systemFontOfSize:19]];
    cell.DeviceNumber.frame = CGRectMake(cell.deviceImage.frame.origin.x + 5, cell.deviceImage.frame.origin.y + cell.deviceImage.frame.size.height + 5, deviceNumberSize.width, deviceNumberSize.height);
    
    cell.deviceMAC.text = [NSString stringWithFormat:@"%@",[[[self appDelegate].handler.allMyDevices objectAtIndex:indexPath.row] objectForKey:kDEVICEMAC]];
    CGSize deviceMacStrSize = [cell.deviceMAC.text sizeWithFont:[UIFont systemFontOfSize:17]];
    cell.deviceMAC.frame = CGRectMake(cell.DEVICEMAC.frame.origin.x + cell.DEVICEMAC.frame.size.width + 10, 38, deviceMacStrSize.width, deviceMacStrSize.height);
    
    
    cell.deviceLocation.text = [NSString stringWithFormat:@"%@",[[[self appDelegate].handler.allMyDevices objectAtIndex:indexPath.row] objectForKey:KDEVICELOCATION]];
    CGSize deviceLocation = [cell.deviceMAC.text sizeWithFont:[UIFont systemFontOfSize:17]];
    cell.deviceLocation.frame = CGRectMake(cell.DEVICEMAC.frame.origin.x + cell.DEVICEMAC.frame.size.width + 10, 58, deviceLocation.width, deviceLocation.height);
    
    cell.deviceType.text = [NSString stringWithFormat:@"%@",[[[self appDelegate].handler.allMyDevices objectAtIndex:indexPath.row] objectForKey:kDEVICETYPE]];
    CGSize deviceType = [cell.deviceType.text sizeWithFont:[UIFont systemFontOfSize:17]];
    cell.deviceType.frame = CGRectMake(cell.DEVICEMAC.frame.origin.x + cell.DEVICEMAC.frame.size.width + 10, 78, deviceType.width, deviceType.height);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 135;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults] setObject:[[[self appDelegate].handler.allMyDevices objectAtIndex:indexPath.row] objectForKey:kDEVICEMAC] forKey:kCURRENTDEVICEMAC];
    [[NSUserDefaults standardUserDefaults] setObject:[[[self appDelegate].handler.allMyDevices objectAtIndex:indexPath.row] objectForKey:kDEVICETYPE] forKey:kCURRENTDEVICETYPE];
    [[NSUserDefaults standardUserDefaults] setObject:[[[self appDelegate].handler.allMyDevices objectAtIndex:indexPath.row] objectForKey:KDEVICELOCATION] forKey:kCURRENTDEVICELocation];
    [self appDelegate].handler.currentDeviceLocation = [[[self appDelegate].handler.allMyDevices objectAtIndex:indexPath.row] objectForKey:KDEVICELOCATION];
    [self appDelegate].handler.currentDeviceMac = [[[self appDelegate].handler.allMyDevices objectAtIndex:indexPath.row] objectForKey:kDEVICEMAC];
    [self appDelegate].handler.currentDeviceType = [[[self appDelegate].handler.allMyDevices objectAtIndex:indexPath.row] objectForKey:kDEVICETYPE];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    [[self appDelegate].handler refreshHomeDataWithCurrentDeviceMac];
    [[self appDelegate].handler.connectingServer loadingDeviceRecordWithCurrentDeviceMACWithViewController:([self appDelegate].recordingsVC != nil)? [self appDelegate].recordingsVC : nil];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    [self.allMyDevice setEditing:editing animated:YES];
    if (self.editing) {
        self.editButtonItem.title = @"完成";
    } else {
        self.editButtonItem.title = @"删除";
    }
    
}

- (UITableViewCellEditingStyle )tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleNone];
    [MMProgressHUD showWithTitle:@"删除中..."];
    [[self appDelegate].handler.connectingServer deleteMyDeviceWithDeviceMAC:[[[self appDelegate].handler.allMyDevices objectAtIndex:indexPath.row] objectForKey:kDEVICEMAC] inView:self];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}



- (void)deleteDeviceSuccess
{
    [MMProgressHUD dismissWithSuccess:@"删除成功!"];
    
    
}

- (void)deleteDeviceFail
{
    [MMProgressHUD dismissWithError:@"删除失败,请稍后再试"];
}

- (void)refreshViewWithCurrentUserID
{
    [[self appDelegate].handler.connectingServer loadingAllMyDeviceWithCurrentUserIDAndViewController:self];
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

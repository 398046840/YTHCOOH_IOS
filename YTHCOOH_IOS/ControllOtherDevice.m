//
//  ControllOtherDevice.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-15.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "ControllOtherDevice.h"
#import "OtherDeviceCell.h"
#import "AppDelegate.h"
#import "DIYRemoteVC.h"

@interface ControllOtherDevice ()

@end

@implementation ControllOtherDevice

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.dataArray = [[NSMutableArray alloc] init];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[self appDelegate].handler.connectingServer getDIYControlListWithCurrentDeviceMacInView:self];
    
    [self.view makeToastActivity];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([[self appDelegate].handler.DIYList count] >= 5) {
        
        return [[self appDelegate].handler.DIYList count] + 3;
        
    } else {
        
        return [[self appDelegate].handler.DIYList count] + 3 + 1;
        
    }
    
    
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    OtherDeviceCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
   
    
    switch (indexPath.row) {
        case 0:
            cell.image.image = [UIImage imageNamed:@"air_condition"];
            cell.subjectLabel.text = @"空调遥控器";
            break;
        case 1:
            cell.image.image = [UIImage imageNamed:@"air_cleaner"];
            cell.subjectLabel.text = @"空气净化器遥控器";
            break;
        case 2:
            cell.image.image = [UIImage imageNamed:@"television"];
            cell.subjectLabel.text = @"电视遥控器";
            break;
            
        default:
            cell.image.image = [UIImage imageNamed:@"DIY"];
            if (indexPath.row < ([[self appDelegate].handler.DIYList count] + 3)) {
                
                cell.subjectLabel.text = [[self appDelegate].handler.DIYList objectAtIndex:(indexPath.row - 3)];
    

            } else {
                cell.subjectLabel.text = @"添加自定义遥控器";
            }
        
            break;
    }
    

    return  cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(150,150);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //[[self appDelegate].handler.connectingServer getAirconditionAllStudyFlagWithCurrentDeviceMacInView:self];
    
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"airCondition" sender:nil];
            break;
        case 1:
            [self performSegueWithIdentifier:@"airCleaner" sender:nil];
            break;
        case 2:
            [self performSegueWithIdentifier:@"TV" sender:nil];
            break;
            
        default:
            
            if (indexPath.row < ([[self appDelegate].handler.DIYList count] + 3)) {
                
                [self performSegueWithIdentifier:@"DIY" sender:[[self appDelegate].handler.DIYList objectAtIndex:(indexPath.row - 3)]];
                
            } else {
                
            }
            break;
    }
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"DIY"]) {
        
        DIYRemoteVC *VC = segue.destinationViewController;
        VC.Name = (NSString *)sender;
    }
}


- (void)checkDIYListSuccess
{
    [self.view hideToastActivity];
}

- (void)checkDIYListFail
{
    [self.view hideToastActivity];
}

@end

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

@interface ControllOtherDevice ()

@end

@implementation ControllOtherDevice

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.dataArray = [[NSMutableArray alloc] init];
    
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
    return 4;
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
        case 3:
            cell.image.image = [UIImage imageNamed:@"DIY"];
            cell.subjectLabel.text = @"自定义";
            break;
            
        default:
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
            break;
    }
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

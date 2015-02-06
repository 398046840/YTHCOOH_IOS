//
//  ControllOtherDevice.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-15.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ControllOtherDevice : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;
@end

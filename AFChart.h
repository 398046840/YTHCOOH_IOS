//
//  AFChart.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-14.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFChart : UIView




//横竖轴显示标签
@property (nonatomic, strong) NSArray *dataY;

//点信息
@property (nonatomic, strong) NSArray *pointData;

//点类型
@property (nonatomic, strong) NSString *subject;


- (id)initWithFrame:(CGRect)frame andDataY:(NSArray *)dataY andPointData:(NSMutableArray *)pointData andSubject:(NSString *)subject;

@end

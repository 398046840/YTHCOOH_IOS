//
//  BarChart.m
//  YTHCOOH_IOS
//
//  Created by afable on 15/1/11.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "BarChart.h"

@implementation BarChart

- (BarChart *)initBarChartWithPoint:(CGPoint)point inView:(UIView *)view
{
    self = [super init];
    
    if (self) {
        
        for (int a = 0; a < 15; a++) {
            
            switch (a) {
                case 0:
                    self.barChartCell1 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 1:
                    self.barChartCell2 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];                break;
                case 2:
                    self.barChartCell3 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 3:
                    self.barChartCell4 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 4:
                    self.barChartCell5 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 5:
                    self.barChartCell6 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 6:
                    self.barChartCell7 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 7:
                    self.barChartCell8 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 8:
                    self.barChartCell9 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 9:
                    self.barChartCell10 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 10:
                    self.barChartCell11 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 11:
                    self.barChartCell12 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 12:
                    self.barChartCell13 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 13:
                    self.barChartCell14 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                case 14:
                    self.barChartCell15 = [[BarChartCell alloc] initBarChartCellWithPoint:point inView:view atIndex:a];
                    break;
                    
                default:
                    break;
            }
        }
    }
    
    return self;
    
}

- (void)refreshBarChartWithData:(NSMutableArray *)array andSubject:(NSString *)subject
{
    for (int a = 0; a < 15; a++) {
        
        NSDictionary *tmpDic = [array objectAtIndex:a];
        
        switch (a) {
            case 0:
    
                [self.barChartCell1 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell1 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                
                break;
            case 1:
                [self.barChartCell2 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell2 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 2:
                [self.barChartCell3 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell3 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 3:
                [self.barChartCell4 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell4 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 4:
                [self.barChartCell5 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell5 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 5:
                [self.barChartCell6 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell6 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 6:
                [self.barChartCell7 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell7 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 7:
                [self.barChartCell8 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell8 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 8:
                [self.barChartCell9 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell9 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 9:
                [self.barChartCell10 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell10 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 10:
                [self.barChartCell11 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell11 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 11:
                [self.barChartCell12 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell12 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 12:
                [self.barChartCell13 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell13 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 13:
                [self.barChartCell14 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell14 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
            case 14:
                [self.barChartCell15 fixBarChartCorolAndFrame:[tmpDic objectForKey:@"Value"] withSubject:subject];
                [self.barChartCell15 fixBarChartValueAndTimeLabelWithValue:[tmpDic objectForKey:@"Value"] andTime:[tmpDic objectForKey:@"Time"] withSubject:subject];
                break;
                
            default:
                break;
        }
        
        
    }
}

@end

//
//  BarChartCell.m
//  YTHCOOH_IOS
//
//  Created by afable on 15/1/11.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "BarChartCell.h"

@implementation BarChartCell

- (BarChartCell *)initBarChartCellWithPoint:(CGPoint)point inView:(UIView *)view atIndex:(int)index
{
    self = [super init];
    
    if (self) {
        
        self.barChart = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RecordTitleBG"]];
        self.barChart.frame = CGRectMake(point.x + 15 * index + (index * 4), point.y - 5, 15, 5 );
        
        self.value = [[UILabel alloc] init];
        self.value.text = @"0";
        self.value.font = [UIFont systemFontOfSize:9];
        self.value.backgroundColor = [UIColor clearColor];
        CGSize valueSize = [self.value.text sizeWithFont:[UIFont systemFontOfSize:9]];
        self.value.frame = CGRectMake((self.barChart.frame.size.width / 2) - valueSize.width / 2, -10, valueSize.width, valueSize.height);
        
        self.time = [[UILabel alloc] init];
        self.time.text = @"00";
        self.time.font = [UIFont systemFontOfSize:7];
        self.time.backgroundColor = [UIColor clearColor];
        CGSize timeSize = [self.time.text sizeWithFont:[UIFont systemFontOfSize:7]];
        self.time.frame = CGRectMake((self.barChart.frame.size.width / 2) - timeSize.width / 2, self.barChart.frame.size.height, timeSize.width, timeSize.height);
        
        [self.barChart addSubview:self.value];
        [self.barChart addSubview:self.time];
        [view addSubview:self.barChart];
        
    }
    
    return self;
}

- (void)fixBarChartCorolAndFrame:(NSString *)value withSubject:(NSString *)subject
{
    self.barChart.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[self whatColorWithValue:value andType:subject]]];
    
    if ([subject isEqualToString:kFORMALDEHYDE]) {
        
        self.barChart.frame = CGRectMake(self.barChart.frame.origin.x, self.barChart.frame.origin.y + self.barChart.frame.size.height - [value floatValue] * 50 - 5, self.barChart.frame.size.width, 5 + [value floatValue] * 50);
        
    } else if ([subject isEqualToString:kPM]) {
        
        self.barChart.frame = CGRectMake(self.barChart.frame.origin.x, self.barChart.frame.origin.y + self.barChart.frame.size.height - [value floatValue]  - 5, self.barChart.frame.size.width, 5 + [value floatValue]);
        
    } else if ([subject isEqualToString:kTEMPERATURE]) {
        
        self.barChart.frame = CGRectMake(self.barChart.frame.origin.x, self.barChart.frame.origin.y + self.barChart.frame.size.height - ([value floatValue] / 100) * 70 - 5, self.barChart.frame.size.width, 5 + ([value floatValue] / 100) * 70);
        
    } else if ([subject isEqualToString:kHUMIDITY]) {
        
        self.barChart.frame = CGRectMake(self.barChart.frame.origin.x, self.barChart.frame.origin.y + self.barChart.frame.size.height - ([value floatValue] / 230) * 70  - 5, self.barChart.frame.size.width, 5 + ([value floatValue] / 230) * 70);
        
    } else if ([subject isEqualToString:KVOC]) {
        
        self.barChart.frame = CGRectMake(self.barChart.frame.origin.x, self.barChart.frame.origin.y + self.barChart.frame.size.height - [value floatValue] * 50  - 5, self.barChart.frame.size.width, 5 + [value floatValue] * 50);
        
    } else if ([subject isEqualToString:kPM10]) {
        
        self.barChart.frame = CGRectMake(self.barChart.frame.origin.x, self.barChart.frame.origin.y + self.barChart.frame.size.height - ([value floatValue] / 230) * 70  - 5, self.barChart.frame.size.width, 5 + ([value floatValue] / 230) * 70);
        
    }
    
    
    
}

- (void)transformValueToHeight:(NSString *)value withSubject:(NSString *)subject
{
    
}

- (void)fixBarChartValueAndTimeLabelWithValue:(NSString *)value andTime:(NSString *)time withSubject:(NSString *)subject
{
    self.value.text = value;
    CGSize valueSize = [self.value.text sizeWithFont:[UIFont systemFontOfSize:9]];
    self.value.frame = CGRectMake((self.barChart.frame.size.width / 2) - valueSize.width / 2, -10, valueSize.width, valueSize.height);

    self.time.text = time;
    CGSize timeSize = [self.time.text sizeWithFont:[UIFont systemFontOfSize:7]];
    self.time.frame = CGRectMake((self.barChart.frame.size.width / 2) - timeSize.width / 2, self.barChart.frame.size.height, timeSize.width, timeSize.height);

}

- (NSString *)whatColorWithValue:(NSString *)value andType:(NSString *)type
{
    
    if ([type isEqualToString:kFORMALDEHYDE]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return @"LevelColor_Green";
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return @"LevelColor_Or";
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return @"LevelColor_Red";
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return @"LevelColor_Pink";
            
        } else if ([value floatValue] > 250) {
            
            return @"LevelColor_Purple";
            
        }
        
        
    } else if ([type isEqualToString:kPM]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 16) {
            
            return @"LevelColor_Green";
            
        } else if ([value floatValue] > 16 && [value floatValue] <= 20) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] > 20 && [value floatValue] <= 25) {
            
            return @"LevelColor_Or";
            
        } else if ([value floatValue] > 25 && [value floatValue] <= 26) {
            
            return @"LevelColor_Red";
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return @"LevelColor_Pink";
            
        } else if ([value floatValue] > 250) {
            
            return @"LevelColor_Purple";
            
        }
        
    } else if ([type isEqualToString:kTEMPERATURE]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return @"LevelColor_Green";
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return @"LevelColor_Or";
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return @"LevelColor_Red";
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return @"LevelColor_Pink";
            
        } else if ([value floatValue] > 250) {
            
            return @"LevelColor_Purple";
            
        }
        
    } else if ([type isEqualToString:kHUMIDITY]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return @"LevelColor_Green";
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return @"LevelColor_Or";
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return @"LevelColor_Red";
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return @"LevelColor_Pink";
            
        } else if ([value floatValue] > 250) {
            
            return @"LevelColor_Purple";
            
        }
        
    } else if ([type isEqualToString:KVOC]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return @"LevelColor_Green";
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return @"LevelColor_Or";
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return @"LevelColor_Red";
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return @"LevelColor_Pink";
            
        } else if ([value floatValue] > 250) {
            
            return @"LevelColor_Purple";
            
        }
        
    } else if ([type isEqualToString:kPM10]) {
        
        if ([value floatValue] >= 0 && [value floatValue] <= 35) {
            
            return @"LevelColor_Green";
            
        } else if ([value floatValue] > 35 && [value floatValue] <= 75) {
            
            return @"LevelColor_Ye";
            
        } else if ([value floatValue] > 75 && [value floatValue] <= 115) {
            
            return @"LevelColor_Or";
            
        } else if ([value floatValue] > 115 && [value floatValue] <= 150) {
            
            return @"LevelColor_Red";
            
        } else if ([value floatValue] > 150 && [value floatValue] <= 250) {
            
            return @"LevelColor_Pink";
            
        } else if ([value floatValue] > 250) {
            
            return @"LevelColor_Purple";
            
        }
        
    }
    
    
    return @"LevelColor_Green";
    
}

//- (NSString *)whatLevelWithValue:(NSString *)value andType:(NSString *)type
//{
//    
//}

@end

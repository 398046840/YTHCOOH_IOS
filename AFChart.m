//
//  AFChart.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-14.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "AFChart.h"
#import "AppDelegate.h"
#define kGAPWITHBOTTOM 30
#define kGAPWITHRIGHT 30
#define kWIDTH 70
//@interface AFChart ()
//{
//    CALayer *linesLayer;
//
//    UIView *popView;
//    UILabel *disLabel;
//
//    int x;
//    int y;
//}
//
//@end


@implementation AFChart

- (id)initWithFrame:(CGRect)frame andDataY:(NSArray *)dataY andPointData:(NSMutableArray *)pointData andSubject:(NSString *)subject
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.dataY = dataY;
        self.pointData = pointData;
        self.subject = subject;
        
    }
    return self;
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)drawRect:(CGRect)rect
{
    
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0f , self.bounds.size.height);
    CGContextScaleCTM(context, 1, -1);
    
    
    
    
    
    for (int i = 0; i < 11; i++) {
        
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);//线条颜色
        CGContextSetLineWidth(context, 0.3);//线条宽度
        CGContextMoveToPoint(context, kGAPWITHRIGHT, 10 * i + kGAPWITHBOTTOM); //开始画线, x，y 为开始点的坐标
        CGContextAddLineToPoint(context, kGAPWITHRIGHT + 980, 10 * i + kGAPWITHBOTTOM);//画直线, x，y 为线条结束点的坐标
        CGContextStrokePath(context); //开始画线
        
        CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSelectFont(context, "Helvetica" ,11, kCGEncodingMacRoman);
        CGContextSetTextDrawingMode(context, kCGTextFill);
        CGContextShowTextAtPoint(context, 5, 10 * i + kGAPWITHBOTTOM - 4, [[self.dataY objectAtIndex:i] UTF8String], strlen([[self.dataY objectAtIndex:i] UTF8String]));
    }
    
    for (int i = 0; i < self.pointData.count; i++) {
        
        
        NSArray *tempArr = [[[self.pointData objectAtIndex:i] objectForKey:@"Time"] componentsSeparatedByString:@"/"];
        
        NSString *tempStr = [[tempArr objectAtIndex:1] stringByReplacingOccurrencesOfString:@"：" withString:@":"];
        
        
        CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSelectFont(context, "Helvetica" ,11, kCGEncodingMacRoman);
        CGContextSetTextDrawingMode(context, kCGTextFill);
        CGContextShowTextAtPoint(context, kWIDTH * i + kGAPWITHRIGHT - 25, 15, [[tempArr objectAtIndex:0] UTF8String], strlen([[tempArr objectAtIndex:0] UTF8String]));
        CGContextShowTextAtPoint(context, kWIDTH * i + kGAPWITHRIGHT - 15, 5, [tempStr UTF8String], strlen([tempStr UTF8String]));
    }
    
    
    
    for (int i = 0; i < 15; i++) {
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);//线条颜色
        CGContextSetLineWidth(context, 0.3);//线条宽度
        CGContextMoveToPoint(context, kWIDTH * i + kGAPWITHRIGHT,  kGAPWITHBOTTOM); //开始画线, x，y 为开始点的坐标
        CGContextAddLineToPoint(context, kWIDTH * i + kGAPWITHRIGHT,  kGAPWITHBOTTOM + 100);//画直线, x，y 为线条结束点的坐标
        CGContextStrokePath(context); //开始画线
        
        
        
        
        //画线
        int b = i;
        if (b < (self.pointData.count - 1)) {
            
            
            
            
            CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);//线条颜色
            CGContextSetLineWidth(context, 2.0);//线条宽度
            
            
            if ([self.subject isEqualToString:kFORMALDEHYDE]) {
                
                CGContextMoveToPoint(context, kWIDTH * i + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 1.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 1.0) * 10) * 10 + kGAPWITHBOTTOM);
                CGContextAddLineToPoint(context, kWIDTH * (i+1)  + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] <= 1.0 ? [[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] : 1.0) * 10) * 10 + kGAPWITHBOTTOM);
                CGContextStrokePath(context);
                
            } else if ([self.subject isEqualToString:kPM]) {
                
                CGContextMoveToPoint(context, kWIDTH * i + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 250 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 250) / 25) * 10 + kGAPWITHBOTTOM);
                CGContextAddLineToPoint(context, kWIDTH * (i+1)  + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] <= 250 ? [[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] : 250) / 25) * 10 + kGAPWITHBOTTOM);
                CGContextStrokePath(context);
            } else if ([self.subject isEqualToString:kPM10]) {
                
                CGContextMoveToPoint(context, kWIDTH * i + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 250 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 250) / 25) * 10 + kGAPWITHBOTTOM);
                CGContextAddLineToPoint(context, kWIDTH * (i+1)  + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] <= 250 ? [[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] : 250) / 25) * 10 + kGAPWITHBOTTOM);
                CGContextStrokePath(context);
                
            } else if ([self.subject isEqualToString:KVOC]) {
                
                CGContextMoveToPoint(context, kWIDTH * i + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 2.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 2.0) * 5) * 10 + kGAPWITHBOTTOM);
                CGContextAddLineToPoint(context, kWIDTH * (i+1)  + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] <= 2.0 ? [[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] : 2.0) * 5) * 10 + kGAPWITHBOTTOM);
                CGContextStrokePath(context);
            } else if ([self.subject isEqualToString:kTEMPERATURE]) {
                
                CGContextMoveToPoint(context, kWIDTH * i + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 50.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 50.0) / 5) * 10 + kGAPWITHBOTTOM);
                CGContextAddLineToPoint(context, kWIDTH * (i+1)  + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] <= 50.0 ? [[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] : 50.0) / 5) * 10 + kGAPWITHBOTTOM);
                CGContextStrokePath(context);
            } else if ([self.subject isEqualToString:kHUMIDITY]) {
                
                CGContextMoveToPoint(context, kWIDTH * i + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 100.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 100.0) / 10) * 10 + kGAPWITHBOTTOM);
                CGContextAddLineToPoint(context, kWIDTH * (i+1)  + kGAPWITHRIGHT, (([[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] <= 100.0 ? [[[self.pointData objectAtIndex:b+1] objectForKey:@"Value"] floatValue] : 100.0) / 10) * 10 + kGAPWITHBOTTOM);
                CGContextStrokePath(context);
            }
            
            
            
            
            
            
            
        }
        
        if (b < self.pointData.count) {
            //描点
            if ([self.subject isEqualToString:kFORMALDEHYDE]) {
                
                
                CGContextSetFillColorWithColor(context, [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[self.pointData objectAtIndex:b] objectForKey:@"Value"] inType:kFORMALDEHYDE].CGColor);
                CGContextFillRect(context, CGRectMake(kWIDTH * i + kGAPWITHRIGHT - 2.5, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 1.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 1.0) * 10) * 10 + kGAPWITHBOTTOM - 2.5, 5, 5));
                CGContextStrokePath(context);
                
                
                CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
                CGContextSelectFont(context, "Helvetica" ,11, kCGEncodingMacRoman);
                CGContextSetTextDrawingMode(context, kCGTextFill);
                CGContextShowTextAtPoint(context,kWIDTH * i + kGAPWITHRIGHT + 7, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 1.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 1.0) * 10) * 10 + kGAPWITHBOTTOM + 5, [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String], strlen([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String]));
                
                
            } else if ([self.subject isEqualToString:kPM]) {
                
                CGContextSetFillColorWithColor(context, [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[self.pointData objectAtIndex:b] objectForKey:@"Value"] inType:kPM].CGColor);
                CGContextFillRect(context, CGRectMake(kWIDTH * i + kGAPWITHRIGHT - 2.5, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 250 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 250) / 25) * 10 + kGAPWITHBOTTOM - 2.5, 5, 5));
                CGContextStrokePath(context);
                
                CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
                CGContextSelectFont(context, "Helvetica" ,11, kCGEncodingMacRoman);
                CGContextSetTextDrawingMode(context, kCGTextFill);
                CGContextShowTextAtPoint(context,kWIDTH * i + kGAPWITHRIGHT + 7, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 250 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 250) / 25) * 10 + kGAPWITHBOTTOM + 5, [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String], strlen([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String]));
                
                
                
            } else if ([self.subject isEqualToString:kPM10]) {
                
                CGContextSetFillColorWithColor(context, [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[self.pointData objectAtIndex:b] objectForKey:@"Value"] inType:kPM10].CGColor);
                CGContextFillRect(context, CGRectMake(kWIDTH * i + kGAPWITHRIGHT - 2.5, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 250 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 250) / 25) * 10 + kGAPWITHBOTTOM - 2.5, 5, 5));
                CGContextStrokePath(context);
                
                CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
                CGContextSelectFont(context, "Helvetica" ,11, kCGEncodingMacRoman);
                CGContextSetTextDrawingMode(context, kCGTextFill);
                CGContextShowTextAtPoint(context,kWIDTH * i + kGAPWITHRIGHT + 7, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 250 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 250) / 25) * 10 + kGAPWITHBOTTOM + 5, [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String], strlen([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String]));
                
                
                
            } else if ([self.subject isEqualToString:KVOC]) {
                
                CGContextSetFillColorWithColor(context, [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[self.pointData objectAtIndex:b] objectForKey:@"Value"] inType:KVOC].CGColor);
                CGContextFillRect(context, CGRectMake(kWIDTH * i + kGAPWITHRIGHT - 2.5, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 2.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 2.0) * 5) * 10 + kGAPWITHBOTTOM - 2.5, 5, 5));
                CGContextStrokePath(context);
                
                CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
                CGContextSelectFont(context, "Helvetica" ,11, kCGEncodingMacRoman);
                CGContextSetTextDrawingMode(context, kCGTextFill);
                CGContextShowTextAtPoint(context,kWIDTH * i + kGAPWITHRIGHT + 7, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 2.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 2.0) * 5) * 10 + kGAPWITHBOTTOM + 5, [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String], strlen([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String]));
                
                
                
            } else if ([self.subject isEqualToString:kTEMPERATURE]) {
                CGContextSetFillColorWithColor(context, [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[self.pointData objectAtIndex:b] objectForKey:@"Value"] inType:kTEMPERATURE].CGColor);
                CGContextFillRect(context, CGRectMake(kWIDTH * i + kGAPWITHRIGHT - 2.5, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 50.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 50.0) / 5) * 10 + kGAPWITHBOTTOM - 2.5, 5, 5));
                CGContextStrokePath(context);
                
                CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
                CGContextSelectFont(context, "Helvetica" ,11, kCGEncodingMacRoman);
                CGContextSetTextDrawingMode(context, kCGTextFill);
                CGContextShowTextAtPoint(context,kWIDTH * i + kGAPWITHRIGHT + 7, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 50.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 50.0) / 5) * 10 + kGAPWITHBOTTOM + 5, [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String], strlen([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String]));
                
                
                
            } else if ([self.subject isEqualToString:kHUMIDITY]) {
                
                CGContextSetFillColorWithColor(context, [[self appDelegate].handler.connectingServer whatTextColorWithValue:[[self.pointData objectAtIndex:b] objectForKey:@"Value"] inType:kHUMIDITY].CGColor);
                CGContextFillRect(context, CGRectMake(kWIDTH * i + kGAPWITHRIGHT - 2.5, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 100.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 100.0) / 10) * 10 + kGAPWITHBOTTOM - 2.5, 5, 5));
                CGContextStrokePath(context);
                
                CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
                CGContextSelectFont(context, "Helvetica" ,11, kCGEncodingMacRoman);
                CGContextSetTextDrawingMode(context, kCGTextFill);
                CGContextShowTextAtPoint(context,kWIDTH * i + kGAPWITHRIGHT + 7, (([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] <= 100.0 ? [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] floatValue] : 100.0) / 10) * 10 + kGAPWITHBOTTOM + 5, [[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String], strlen([[[self.pointData objectAtIndex:b] objectForKey:@"Value"] UTF8String]));
                
                
            }
        }
        
        
        
        
    }
    
}




@end

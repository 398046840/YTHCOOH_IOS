//
//  studyRemoteTypeAirCondition.h
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-29.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudyRemoteTypeAirCondition : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIButton *nextItem;
@property (strong, nonatomic) IBOutlet UIButton *startStudy;

@property (nonatomic, copy) NSString *type;
@property (nonatomic) int currentSubject;
@property (nonatomic) int totalPage;

@property (nonatomic) BOOL isScrolling;

- (IBAction)startStudy:(id)sender;

- (IBAction)closeView:(id)sender;


- (IBAction)nextItem:(id)sender;


- (void)studyFail;
- (void)studySuccess;

@end

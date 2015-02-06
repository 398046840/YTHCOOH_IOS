//
//  studyRemoteTypeAirCondition.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-29.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "StudyRemoteTypeAirCondition.h"
#import "StudyRemoteTypeAirConditionView.h"
#import "AppDelegate.h"

@interface StudyRemoteTypeAirCondition ()

@end

@implementation StudyRemoteTypeAirCondition

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    self.currentSubject = 0;
    
    self.isScrolling = NO;
    
    if ([self.type isEqualToString:@"Aircondition"]) {
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 8, self.scrollView.frame.size.height);
        
        UIView *view1 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:0];
        UIView *view2 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:1];
        UIView *view3 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:2];
        UIView *view4 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 3, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:3];
        UIView *view5 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 4, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:4];
        UIView *view6 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 5, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:5];
        UIView *view7 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 6, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:6];
        UIView *view8 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 7, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:7];
        
        [self.scrollView addSubview:view1];
        [self.scrollView addSubview:view2];
        [self.scrollView addSubview:view3];
        [self.scrollView addSubview:view4];
        [self.scrollView addSubview:view5];
        [self.scrollView addSubview:view6];
        [self.scrollView addSubview:view7];
        [self.scrollView addSubview:view8];
        
        [self.pageControl setNumberOfPages:8];
        self.totalPage = 8;
        
    } else if ([self.type isEqualToString:@"AirCleaner"]) {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 8, self.scrollView.frame.size.height);
        
        UIView *view1 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:8];
        UIView *view2 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:9];
        UIView *view3 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:10];
        UIView *view4 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 3, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:11];
        UIView *view5 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 4, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:12];
        UIView *view6 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 5, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:13];
        UIView *view7 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 6, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:14];
        UIView *view8 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 7, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:15];
        
        [self.scrollView addSubview:view1];
        [self.scrollView addSubview:view2];
        [self.scrollView addSubview:view3];
        [self.scrollView addSubview:view4];
        [self.scrollView addSubview:view5];
        [self.scrollView addSubview:view6];
        [self.scrollView addSubview:view7];
        [self.scrollView addSubview:view8];
        
        [self.pageControl setNumberOfPages:8];
        self.totalPage = 8;
        
    } else if ([self.type isEqualToString:@"TV"]) {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 6, self.scrollView.frame.size.height);
        
        UIView *view1 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:16];
        UIView *view2 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:17];
        UIView *view3 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:18];
        UIView *view4 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 3, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:19];
        UIView *view5 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 4, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:20];
        UIView *view6 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 5, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:21];
        UIView *view7 = [[StudyRemoteTypeAirConditionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 6, 0, self.view.frame.size.width, self.view.frame.size.height) andTittle:22];
        
        [self.scrollView addSubview:view1];
        [self.scrollView addSubview:view2];
        [self.scrollView addSubview:view3];
        [self.scrollView addSubview:view4];
        [self.scrollView addSubview:view5];
        [self.scrollView addSubview:view6];
        [self.scrollView addSubview:view7];
        
        [self.pageControl setNumberOfPages:7];
        self.totalPage = 7;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.isScrolling = YES;
    
    
    CGPoint offset = self.scrollView.contentOffset;
    self.pageControl.currentPage = offset.x / [UIScreen mainScreen].bounds.size.width;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    self.isScrolling = NO;
    
}

- (IBAction)startStudy:(id)sender {
    
    if (self.isScrolling) {
        return;
    }
    
    [MMProgressHUD showWithTitle:@"正在学习中..."];
    [[self appDelegate].handler.connectingServer AirconditionStudyWithSubject:self.currentSubject inView:self];
}

- (IBAction)closeView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (IBAction)nextItem:(id)sender {
    if (self.isScrolling) {
        return;
    }
    
    if (self.currentSubject >= 7) {
        
        [self dismissViewControllerAnimated:YES completion: nil];
        return;
    }
    
    [self nextPage];
}



- (void)nextPage
{
    [self.startStudy setTitle:@"点击学习" forState:UIControlStateNormal];
    
    CGPoint offset = CGPointMake(self.scrollView.contentOffset.x + self.view.frame.size.width, self.scrollView.contentOffset.y);
    [self.scrollView setContentOffset:offset animated:YES];
    self.currentSubject += 1;
    
    
}



- (void)studyFail
{
    
    [self.startStudy setTitle:@"学习失败,点击重新学习" forState:UIControlStateNormal];
    
    [MMProgressHUD dismissWithError:@"学习失败,请稍后重试"];
}

- (void)studySuccess
{
    
    [MMProgressHUD dismissWithSuccess:@"学习成功"];
    if (self.currentSubject >= 7) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        
        [self nextPage];
        
    }
}




@end

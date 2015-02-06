//
//  AboutUs.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-15.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "AboutUs.h"
#import "AppDelegate.h"

@interface AboutUs ()

@end

@implementation AboutUs

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] init];
    

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        
 
    [self.scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 550)];
    [self.view addSubview:self.scrollView];
    
    [self setUp];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)setUp
{
    UILabel *introduceLabel = [[UILabel alloc] init];
    introduceLabel.text = @"       成都永腾电子有限公司座落于享有美丽天府之国美誉的成都经济技术开发区，是一家集研发、生产、销售于一体的高科技企业。凝聚了一批学有专长且经验丰富的优秀人才，专业从事环境检测仪器、环境监测系统开发和制造。\r\n       公司自创建以来，自主研发生产的各系列产品以质量可靠，价格实在，服务周全，赢得了全国各地用户的青睐及支持。\r\n       产品主要包含有：粒子计数器，环境监测仪，空气检测仪，空气净化器检测仪，PM2.5、PM10、甲醛等环境检测仪器，这类广泛应用于集成电路生产、精密加工、化工、医药卫生、食品加工、环境保护和工程、航天国防和科研、室内净化环境保护等工业和民用市场。";
    
    introduceLabel.numberOfLines = 0;
    introduceLabel.font = [UIFont systemFontOfSize:13];
    introduceLabel.backgroundColor = [UIColor clearColor];
    
    CGSize labelSize = [[self appDelegate] stringSizeWithString:introduceLabel.text andWidthLimit:[UIScreen mainScreen].bounds.size.width - 32 andFontSize:13.0];
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
        
        introduceLabel.frame = CGRectMake(16, 10 , labelSize.width, labelSize.height);
    } else {
        introduceLabel.frame = CGRectMake(16, 10  , labelSize.width, labelSize.height);
    }
    
    
   
    
    [self.scrollView addSubview:introduceLabel];
    
    UILabel *tempLabel1 = [[UILabel alloc] init];
    tempLabel1.font = [UIFont systemFontOfSize:13];
    tempLabel1.backgroundColor = [UIColor clearColor];
    tempLabel1.text = @"销售咨询:";
    CGSize sizeLabel1 = [tempLabel1.text sizeWithFont:[UIFont systemFontOfSize:13]];
    tempLabel1.frame = CGRectMake(16, introduceLabel.frame.origin.y + introduceLabel.frame.size.height + 20, sizeLabel1.width, sizeLabel1.height);
    [self.scrollView addSubview:tempLabel1];
    
    UILabel *tel1 = [[UILabel alloc] init];
    tel1.font = [UIFont systemFontOfSize:13];
    tel1.backgroundColor = [UIColor clearColor];
    tel1.text = @"02884779619";
    CGSize size1 = [tel1.text sizeWithFont:[UIFont systemFontOfSize:13]];
    tel1.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - size1.width / 2, tempLabel1.frame.origin.y + tempLabel1.frame.size.height + 10, size1.width, size1.height);
    [self.scrollView addSubview:tel1];
    
    UIImageView *telPic1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone_picture"]];
    telPic1.frame = CGRectMake(tel1.frame.origin.x + tel1.frame.size.width + 5, tel1.frame.origin.y + tel1.frame.size.height / 2 - 11, 22, 22);
    [self.scrollView addSubview:telPic1];
    
    
    UILabel *tel2 = [[UILabel alloc] init];
    tel2.font = [UIFont systemFontOfSize:13];
    tel2.backgroundColor = [UIColor clearColor];
    tel2.text = @"02866255273";
    CGSize size2 = [tel2.text sizeWithFont:[UIFont systemFontOfSize:13]];
    tel2.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - size2.width / 2, tel1.frame.origin.y + tel1.frame.size.height + 10, size2.width, size2.height);
    [self.scrollView addSubview:tel2];
    
    UIImageView *telPic2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone_picture"]];
    telPic2.frame = CGRectMake(tel2.frame.origin.x + tel2.frame.size.width + 5, tel2.frame.origin.y + tel2.frame.size.height / 2 - 11, 22, 22);
    [self.scrollView addSubview:telPic2];
    
    
    UILabel *tel3 = [[UILabel alloc] init];
    tel3.font = [UIFont systemFontOfSize:13];
    tel3.backgroundColor = [UIColor clearColor];
    tel3.text = @"13981787165";
    CGSize size3 = [tel3.text sizeWithFont:[UIFont systemFontOfSize:13]];
    tel3.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - size3.width / 2, tel2.frame.origin.y + tel2.frame.size.height + 10, size3.width, size3.height);
    [self.scrollView addSubview:tel3];
    
    UIImageView *telPic3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone_picture"]];
    telPic3.frame = CGRectMake(tel3.frame.origin.x + tel3.frame.size.width + 5, tel3.frame.origin.y + tel3.frame.size.height / 2 - 11, 22, 22);
    [self.scrollView addSubview:telPic3];
    
    
    UILabel *QQLabel = [[UILabel alloc] init];
    QQLabel.font = [UIFont systemFontOfSize:13];
    QQLabel.backgroundColor = [UIColor clearColor];
    QQLabel.text = @"QQ咨询:         1147851145";
    CGSize sizeQQLabel = [QQLabel.text sizeWithFont:[UIFont systemFontOfSize:13]];
    QQLabel.frame = CGRectMake(10, telPic3.frame.origin.y + 22 + 20, sizeQQLabel.width, sizeQQLabel.height);
    [self.scrollView addSubview:QQLabel];
    
    UILabel *URLLabel = [[UILabel alloc] init];
    URLLabel.font = [UIFont systemFontOfSize:13];
    URLLabel.backgroundColor = [UIColor clearColor];
    URLLabel.text = @"公司网站:        http://www/cdytdz.com";
    CGSize sizeURLLabel = [URLLabel.text sizeWithFont:[UIFont systemFontOfSize:13]];
    URLLabel.frame = CGRectMake(10, QQLabel.frame.origin.y + QQLabel.frame.size.height + 5, sizeURLLabel.width, sizeURLLabel.height);
    [self.scrollView addSubview:URLLabel];
    
    UILabel *TAOBAOLabel = [[UILabel alloc] init];
    TAOBAOLabel.font = [UIFont systemFontOfSize:13];
    TAOBAOLabel.backgroundColor = [UIColor clearColor];
    TAOBAOLabel.text = @"公司淘宝店铺: http://yongteng.taobao.com";
    CGSize sizeTAOBAOLabel = [TAOBAOLabel.text sizeWithFont:[UIFont systemFontOfSize:13]];
    TAOBAOLabel.frame = CGRectMake(10, URLLabel.frame.origin.y + URLLabel.frame.size.height + 5, sizeTAOBAOLabel.width, sizeTAOBAOLabel.height);
    [self.scrollView addSubview:TAOBAOLabel];
    
    
    UILabel *AddLabel = [[UILabel alloc] init];
    AddLabel.font = [UIFont systemFontOfSize:13];
    AddLabel.backgroundColor = [UIColor clearColor];
    AddLabel.text = @"公司地址:        四川省成都市龙泉驿区大面银河路1号";
    CGSize sizeAddLabel = [AddLabel.text sizeWithFont:[UIFont systemFontOfSize:13]];
    AddLabel.frame = CGRectMake(10, TAOBAOLabel.frame.origin.y + TAOBAOLabel.frame.size.height + 5, sizeAddLabel.width, sizeAddLabel.height);
    [self.scrollView addSubview:AddLabel];
    
    NSLog(@"%f",AddLabel.frame.origin.y);
}

@end

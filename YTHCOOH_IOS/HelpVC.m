//
//  HelpVC.m
//  YTHCOOH_IOS
//
//  Created by 宝发 on 15-1-15.
//  Copyright (c) 2015年 AFABLE. All rights reserved.
//

#import "HelpVC.h"
#import "HelpDetailVC.h"

@interface HelpVC ()

@end

@implementation HelpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    switch (indexPath.row) {
        case 0:
            [dic setObject:@"       点击注册设备(这里我们首先需要连接上一个WIFI),这里我们进入到注册设备界面,添加WIFI密码，点击连接，等待...,如果成功，则会出现设备位置，填好位置，点击配置，如果失败则重试。" forKey:@"Content"];
            [dic setObject:@"如何初始化设备" forKey:@"Subject"];
            [self performSegueWithIdentifier:@"Help" sender:dic];
            break;
        case 1:
            [dic setObject:@"       点击一键控制，进入一键控制 界面，点击空调控制，这是所有图标是蓝色的，则点击学习,点击学习后将遥控板对准设备，按下相应的控制按键，等待...,如果成功，则图标会变成蓝色，失败则重试，其他设备与空调类似" forKey:@"Content"];
            [dic setObject:@"如何一键控制设备" forKey:@"Subject"];
            [self performSegueWithIdentifier:@"Help" sender:dic];
            break;
        case 2:
            [dic setObject:@"       PM2.5是指大气中直径小于或等于2.5微米的颗粒物，也称为可入肺颗粒物。它的直径还不到人的头发丝粗细的1/20。虽然PM2.5只是地球大气成分中含量很少的组分，但它对空气质量和能见度等有重要的影响。与较粗的大气颗粒物相比，PM2.5粒径小，富含大量的有毒、有害物质且在大气中的停留时间长、输送距离远，因而对人体健康和大气环境质量的影响更大" forKey:@"Content"];
            [dic setObject:@"什么是PM2.5" forKey:@"Subject"];
            [self performSegueWithIdentifier:@"Help" sender:dic];
            break;
        case 3:
            [dic setObject:@"       PM10是可吸入颗粒物，一般名称上讲可吸入颗粒物指的是PM10，就是说这个空气中颗粒物的直径从空气动力学来讲直径大小是十个微米，十个微米的话，它是能够吸入呼吸道的，从上呼吸道，通过声门能够到下呼吸道，所以它叫可吸入颗粒物PM10， 可吸入颗粒物（PM10）在环境空气中持续的时间很长，对人体健康和大气能见度影响都很大。\r\n       一些颗粒物来自污染源的直接排放，比如烟囱与车辆。另一些则是由环境空气中硫的氧化物、氮氧化物、挥发性有机化合物及其它化合物互相作用形成的细小颗粒物，它们的化学和物理组成依地点、气候、一年中的季节不同而变化很大。\r\n       可吸入颗粒物通常来自在未铺沥青、水泥的路面上行使的机动车、材料的破碎碾磨处理过程以及被风扬起的尘土可吸入颗粒物被人吸入后，会累积在呼吸系统中，引发许多疾病。对粗颗粒物的暴露可侵害呼吸系统，诱发哮喘病。细颗粒物可能引发心脏病、肺病、呼吸道疾病，降低肺功能等。因此，对于老人、儿童和已患心肺病者等敏感人群，风险是较大的。另外，环境空气中的颗粒物还是降低能见度的主要原因，并会损坏建筑物表面。" forKey:@"Content"];
            [dic setObject:@"什么是PM10" forKey:@"Subject"];
            [self performSegueWithIdentifier:@"Help" sender:dic];
            break;
        case 4:
            [dic setObject:@"       总挥发性有机化合物（TVOC）：挥发性有机物常用VOC表示，它是Votatile Organic Compound三个词第一个字母的缩写，但有时也用总挥发性有机物TVOC来表示。\r\n       TVOC分为八类：烷类、芳烃类、烯类、卤烃类、酯类、醛类、酮类和其他。TVOC的主要成份有：烃类、卤代烃、氧烃和氮烃，它包括：苯系物、有机氯化物、氟里昂系列、有机酮、胺、醇、醚、酯、酸和石油泾化合物等。\r\nTVOC是空气中三种有机污染物（多环芳烃、挥发性有机物和醛类化合物）中影响较为严重的一种。室内刚装修完主要含有甲醛，苯和TVOC等有害气体" forKey:@"Content"];
            [dic setObject:@"什么是TVOC" forKey:@"Subject"];
            [self performSegueWithIdentifier:@"Help" sender:dic];
            break;
        case 5:
            [dic setObject:@"       甲醛是一种无色，有强烈刺激型气味的气体。易溶于水、醇和醚。甲醛在常温下是气态，通常以水溶液形式出现。易溶于水和乙醇，35～40%的甲醛水溶液叫做福尔马林。甲醛分子中有醛基生缩聚反应，得到酚醛树脂。各种人造板材（刨花板、密度板、纤维板、胶合板等）中由于使用了脲醛树脂粘合剂，因而可含有甲醛。新式家具的制作，墙面、地面的装饰铺设，都要使用粘合剂。凡是大量使用粘合剂的地方，总会有甲醛释放。此外，某些化纤地毯、油漆涂料也含有一定量的甲醛。甲醛还可来自化妆品。化妆品、清洁剂、杀虫剂、消毒剂、防腐剂、印刷油墨、纸张、纺织纤维等多种化工轻工产品。" forKey:@"Content"];
            [dic setObject:@"什么是甲醛" forKey:@"Subject"];
            [self performSegueWithIdentifier:@"Help" sender:dic];
            break;
            
        default:
            break;
    }
    
    
}



#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"Help"]) {
        
        HelpDetailVC *viewController = segue.destinationViewController;
        viewController.dataDic = (NSMutableDictionary *)sender;
        
    }
    
}


@end

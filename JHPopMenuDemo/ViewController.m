//
//  ViewController.m
//  JHPopMenuDemo
//
//  Created by 徐仲平 on 16/4/18.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import "ViewController.h"
#import "JHMenuListView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pop {
    
    JHMenuListView *listView = [[JHMenuListView alloc]init];
    
    JHMenuButton *btn1 = [JHMenuButton menuButtonTitle:@"图片" image:[UIImage imageNamed:@"publish-picture"] clickBlock:^{
        NSLog(@"图片");
    }];
    JHMenuButton *btn2 = [JHMenuButton menuButtonTitle:@"语音" image:[UIImage imageNamed:@"publish-audio"] clickBlock:^{
        NSLog(@"语音");
    }];
    JHMenuButton *btn3 = [JHMenuButton menuButtonTitle:@"下载" image:[UIImage imageNamed:@"publish-offline"] clickBlock:^{
        NSLog(@"下载");
    }];
    JHMenuButton *btn4 = [JHMenuButton menuButtonTitle:@"赞" image:[UIImage imageNamed:@"publish-review"] clickBlock:^{
        NSLog(@"赞");
    }];
    JHMenuButton *btn5 = [JHMenuButton menuButtonTitle:@"视频" image:[UIImage imageNamed:@"publish-video"] clickBlock:^{
        NSLog(@"视频");
    }];
    JHMenuButton *btn6 = [JHMenuButton menuButtonTitle:@"文字" image:[UIImage imageNamed:@"publish-text"] clickBlock:^{
        NSLog(@"文字");
    }];
    
    
    listView.menus = @[btn1,btn2,btn3,btn4,btn5,btn6];
    

    [listView showOnTheView:self.view];
    

    
}

@end

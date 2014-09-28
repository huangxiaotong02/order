//
//  SecondViewController.m
//  order
//
//  Created by xyooyy on 14-9-17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "SecondViewController.h"
#import "peopleViewController.h"
#import "resViewController.h"
#import "comboViewController.h"
#import "ordViewController.h"
@interface SecondViewController ()

@end


@implementation SecondViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"订餐";
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    scrollView.contentSize = CGSizeMake( self.view.bounds.size.width, self.view.bounds.size.height * 1.2);
    scrollView.directionalLockEnabled = YES;
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.delaysContentTouches=YES;
    //nsnotification 
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];//取得NSNotification对象
    [center addObserver:self selector:@selector(peoHandleInfo:) name:@"logInfo" object:nil];//注册自己为监听者，当有消息过来
    [center addObserver:self selector:@selector(resHandleInfo:) name:@"resInfo" object:nil];
    [center addObserver:self selector:@selector(comHandleInfo:) name:@"comInfo" object:nil];
    [center addObserver:self selector:@selector(comboHandleInfo:) name:@"comboInfo" object:nil];
    //label人
    CGRect labelRect = CGRectMake(15, 15, 30, 20);
    UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
    label.text = @"人:";
    label.font = [UIFont boldSystemFontOfSize:16];
    [scrollView addSubview:label];
    //label 空白 人
    CGRect label2Rect = CGRectMake(20, 40, 280, 40);
    label2 = [[UILabel alloc] initWithFrame:label2Rect];
    label2.font = [UIFont boldSystemFontOfSize:16];
    label2.enabled = YES;
//    label2.text = data;
    label2.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:label2];
    //button 选人
    CGRect frame = CGRectMake(20, 90, 280, 50);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"选人"forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:button];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    //label 餐厅
    CGRect label3Rect = CGRectMake(15, 160, 40, 20);
    UILabel *label3 = [[UILabel alloc] initWithFrame:label3Rect];
    label3.text = @"餐厅:";
    label3.font = [UIFont boldSystemFontOfSize:16];
    [scrollView addSubview:label3];
    //label 空白 餐厅
    CGRect label4Rect = CGRectMake(20, 190, 280, 40);
    label4 = [[UILabel alloc] initWithFrame:label4Rect];
    label4.font = [UIFont boldSystemFontOfSize:16];
    label4.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:label4];
    //button 选餐厅
    CGRect frame2 = CGRectMake(20, 240, 280, 50);
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = frame2;
    [button2 setTitle:@"选餐厅"forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor clearColor];
    button2.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:button2];
    [button2 addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    //label 套餐
    CGRect label5Rect = CGRectMake(15, 310, 40, 20);
    UILabel *label5 = [[UILabel alloc] initWithFrame:label5Rect];
    label5.text = @"套餐:";
    label5.font = [UIFont boldSystemFontOfSize:16];
    [scrollView addSubview:label5];
    //label 空白 套餐
    CGRect label6Rect = CGRectMake(20, 340, 280, 40);
    label6 = [[UILabel alloc] initWithFrame:label6Rect];
    label6.font = [UIFont boldSystemFontOfSize:16];
    label6.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:label6];
    //label7 空白 价格
    CGRect label7Rect = CGRectMake(20, 340, 280, 40);
    label7 = [[UILabel alloc]initWithFrame:label7Rect];
    //button 选套餐
    CGRect frame3 = CGRectMake(20, 390, 280, 50);
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = frame3;
    [button3 setTitle:@"选套餐"forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor clearColor];
    button3.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:button3];
    [button3 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    //button 确定
    CGRect frame4 = CGRectMake(20, 440, 280, 50);
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = frame4;
    [button4 setTitle:@"确定"forState:UIControlStateNormal];
    button4.backgroundColor = [UIColor clearColor];
    button4.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:button4];
    [button4 addTarget:self action:@selector(on:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
}

- (void)onClick:(id)sender{
    peopleViewController *nextController = [[peopleViewController alloc]init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:nextController animated:YES];
}
- (void)Click:(id)sender{
    resViewController *nextController = [[resViewController alloc]init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:nextController animated:YES];
}
- (void)press:(id)sender{
    comboViewController *nextController = [[comboViewController alloc]init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:nextController animated:YES];
}
- (void)on:(id)sender{
    SecondViewController *nextController = [[SecondViewController alloc]init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:nextController animated:YES];
    //保存数据
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);  
    NSString *path=[paths objectAtIndex:0];
//    NSLog(@"path = %@",path);
    NSString *filename=[path stringByAppendingPathComponent:@"ordered.plist"];
    NSFileManager *ordered = [NSFileManager defaultManager];
        if (![[NSFileManager defaultManager] fileExistsAtPath:filename])
    {
        [ordered createFileAtPath:filename contents:nil attributes:nil];
        arrorder =[[NSArray alloc]initWithObjects:label2.text, label4.text, label6.text, label7.text, nil];
        NSArray *arrord = [[NSArray alloc]initWithObjects:arrorder, nil];
//        NSDictionary *dicorder = [[NSDictionary alloc]initWithObjectsAndKeys:label2.text, @"people", label4.text, @"res", label6.text, @"combo", label7.text, @"price", nil];
        [arrord writeToFile:filename atomically:YES];
        NSLog(@" %@",arrord);
    }
    else
    {
         NSMutableArray *arrordered = [NSArray arrayWithContentsOfFile:filename];
        NSArray *arradd = [[NSArray alloc]initWithObjects:label2.text, label4.text, label6.text, label7.text, nil];
        [arrordered addObject:arradd];
        [arrordered writeToFile:filename atomically:YES];
        NSLog(@"%@",arrordered);
//        if (arrordered.count == 4){
//            NSArray *arradd = [[NSArray alloc]initWithObjects:label2.text, label4.text, label6.text, label7.text, nil];
//            NSMutableArray *arrlast = [[NSMutableArray alloc]initWithObjects:arrordered, arradd, nil];
//            [arrlast writeToFile:filename atomically:YES];
//            NSLog(@"%@",arrlast);
//        }
//        else{
//        NSArray *arradd = [[NSArray alloc]initWithObjects:label2.text, label4.text, label6.text, label7.text, nil];
//            [arrordered addObject:arradd];
//            [arrordered writeToFile:filename atomically:YES];
//            NSLog(@"%@",arrordered);
        
//        NSDictionary *dicordered = [NSDictionary dictionaryWithContentsOfFile: filename];
//        NSLog(@" %@",dicordered);
//        NSDictionary *dicadd = [[NSDictionary alloc]initWithObjectsAndKeys:label2.text, @"people", label4.text, @"res", label6.text, @"combo", label7.text, @"price", nil];
//        NSLog(@" %@",dicadd);
//        }
    }
}
-(void)peoHandleInfo:(NSNotification *)notification{
    NSString *data = [notification object];
    label2.text = data;
//    NSLog(@"%@",label2.text);
//    NSLog(@">>2>> %@",data);
}
-(void)resHandleInfo:(NSNotification *)notification{
    NSString *datar = [notification object];
    label4.text = datar;
//    NSLog(@" %@", datar);
}
-(void)comHandleInfo:(NSNotification *)notification{
    NSString *datac = [notification object];
    label6.text = datac;
}
-(void)comboHandleInfo:(NSNotification *)notification{
    NSString *datap = [notification object];
    label7.text = datap;
//    NSLog(@"  %@",datap);
}
@end
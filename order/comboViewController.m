//
//  comboViewController.m
//  order
//
//  Created by xyooyy on 14-9-18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "comboViewController.h"
#import "SecondViewController.h"
@interface comboViewController ()

@end

@implementation comboViewController
@synthesize listData;
@synthesize listDatap;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*
    //button 田园脆鸡堡
    CGRect frame = CGRectMake(0, 20, 320, 50);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"田园脆鸡堡"forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    //button 黄金咖喱猪排饭
    CGRect frame2 = CGRectMake(0, 70, 320, 50);
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = frame2;
    [button2 setTitle:@"黄金咖喱猪排饭"forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor clearColor];
    button2.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    //button 意式肉酱肉丸饭
    CGRect frame3 = CGRectMake(0, 120, 320, 50);
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = frame3;
    [button3 setTitle:@"意式肉酱肉丸饭"forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor clearColor];
    button3.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button3];
    //button 老北京鸡肉卷
    CGRect frame4 = CGRectMake(0, 170, 320, 50);
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = frame4;
    [button4 setTitle:@"老北京鸡肉卷"forState:UIControlStateNormal];
    button4.backgroundColor = [UIColor clearColor];
    button4.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button4];
    //button 劲脆鸡腿堡
    CGRect frame5 = CGRectMake(0, 220, 320, 50);
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button5.frame = frame5;
    [button5 setTitle:@"劲脆鸡腿堡"forState:UIControlStateNormal];
    button5.backgroundColor = [UIColor clearColor];
    button5.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button5];
	// Do any additional setup after loading the view.
     */
    TableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 320, 300)];
    [self.view addSubview:TableView];
    TableView.delegate = self;
    TableView.dataSource = self;
    
    NSArray *arrayn = [[NSArray alloc]initWithObjects:@"田园脆鸡堡",@"黄金咖喱猪排饭",@"意式肉酱肉丸饭",@"老北京鸡肉卷",@"劲脆鸡腿堡", nil];//创建数组
    self.listData = arrayn;
    NSArray *arrayp = [[NSArray alloc]initWithObjects:@"￥10.00", @"￥23.50", @"￥16.00", @"￥14.00", @"￥15.00", nil];
    self.listDatap = arrayp;
    
}
      

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
//- (void)Click:(id)sender{
//    SecondViewController *nextController = [[SecondViewController alloc]init];
//    [self.navigationController pushViewController:nextController animated:YES];}
#pragma mark -
#pragma mark Table View Data Soure Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [listData objectAtIndex:row];
    cell.textLabel.textColor = [UIColor blueColor];
    cell.detailTextLabel.text = [listDatap objectAtIndex:row];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewController *nextController = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
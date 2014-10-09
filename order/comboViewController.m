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
@synthesize m_listData;
@synthesize m_listDatap;

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
    m_TableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 320, 300)];
    [self.view addSubview:m_TableView];
    m_TableView.delegate = self;
    m_TableView.dataSource = self;
    [self array];
}
-(void)array
{
    NSArray *arrayn = [[NSArray alloc]initWithObjects:@"田园脆鸡堡",@"黄金咖喱猪排饭",@"意式肉酱肉丸饭",@"老北京鸡肉卷",@"劲脆鸡腿堡", nil];//创建数组
    self.m_listData = arrayn;
    NSArray *arrayp = [[NSArray alloc]initWithObjects:@"￥10.00", @"￥23.50", @"￥16.00", @"￥14.00", @"￥15.00", nil];
    self.m_listDatap = arrayp;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark Table View Data Soure Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.m_listData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [m_listData objectAtIndex:row];
    cell.textLabel.textColor = [UIColor blueColor];
    cell.detailTextLabel.text = [m_listDatap objectAtIndex:row];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"comInfo" object:[m_listData objectAtIndex:row]];
    [center postNotificationName:@"priceInfo" object:[m_listDatap objectAtIndex:row]];
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end

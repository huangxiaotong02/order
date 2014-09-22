//
//  peopleViewController.m
//  order
//
//  Created by xyooyy on 14-9-18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "peopleViewController.h"
#import "SecondViewController.h"

@interface peopleViewController ()

@end

@implementation peopleViewController
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
    pTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 320, 360)];
    [self.view addSubview:pTableView];
    pTableView.delegate = self;
    pTableView.dataSource = self;
    NSArray *array = [[NSArray alloc]initWithObjects:@"赵大",@"钱二",@"张三",@"李四",@"王五", @"赵六", nil];//创建数组
    self.listDatap = array;
//    NSDictionary * dict = [[NSDictionary alloc]initWithObjectsAndKeys:@"赵大", @"name1", @"钱二", @"name2", @"张三", @"name3", @"李四", @"name4", @"王五", @"name5", @"赵六", @"name6", nil];
//    NSLog(@" %@", dict);
//    NSArray *values = [dict allValues];
//    self.listDatap = values;
//    NSLog(@" %@", listDatap);
    

	// Do any additional setup after loading the view.
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
    return [self.listDatap count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [listDatap objectAtIndex:row];
    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    [center addObserver:self selector:@selector(GetInfo:) name:@"logInfo" object:nil];//注册自己为监听者observer
    //    [center removeObserver:self];
    [center postNotificationName:@"logInfo" object:[listDatap objectAtIndex:row]];//注册自己为发送者并发送信息
    SecondViewController *nextController = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//-(void) GetInfo:(NSNotification *) notificaion{
    //取得接受数据并打印
//    NSString *data = [notificaion object];
//        NSLog(@">> %@",data);
//}
@end

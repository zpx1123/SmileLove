//
//  SecondViewController.m
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/2/18.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "SecondViewController.h"
#import <YYKit/YYKit.h>

@interface SecondViewController()<UITableViewDelegate,UITableViewDataSource>{
    

}
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,strong)NSMutableArray * dataItemArrs;
@end

@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
      self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveItem)];
    
    self.navigationItem.rightBarButtonItem.enabled=NO;
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self setupContentView];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(instancetype)initWithDateSouce:(NSMutableArray *)date{
    if (self=[super init]) {
        
//        _dataArr=[NSMutableArray arrayWithArray:date];
        self.dataArr=[date copy];
        self.dataItemArrs=[NSMutableArray array];

        
    }
    
    return self;
}
#pragma  mark - navigationItem is click
-(void)saveItem{
    
    if (self.sucessBlock) {
        
        self.sucessBlock(self.dataItemArrs);
    }
    
    
}
-(void)setupContentView{
    
  
        
        _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
//        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
        _tableView.backgroundColor=[UIColor clearColor];
        _tableView.dataSource=self;
        _tableView.delegate=self;
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        [self.view addSubview:_tableView];

    
}
-(void)backBlock:(void (^)(id  date))block{
    
    self.sucessBlock=block;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    return self.dataArr.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:15.0];
    }
    

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.textLabel setTextColor:[UIColor grayColor]];
    [cell setAccessoryType:UITableViewCellAccessoryNone];

    cell.textLabel.text = [self.dataArr[indexPath.row] objectForKey:@"label"];
    
//    if ([cell.textLabel.text isEqualToString:cellTitle]) {
//        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
//        
//        cell.tintColor = [UIColor redColor];
//        [cell.textLabel setTextColor:[UIColor redColor]];
//    }
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
        cell.tintColor = [UIColor redColor];
    
        if(cell.accessoryType==UITableViewCellAccessoryCheckmark){
    
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            
            [self.dataItemArrs removeObject:self.dataArr[indexPath.row]];
    
        }else{
    
            
              [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
            
            [self.dataItemArrs addObject:self.dataArr[indexPath.row]];
        }
    
    
    if (self.dataItemArrs.count>0) {
        
          self.navigationItem.rightBarButtonItem.enabled=YES;
        
    }else{
        
        self.navigationItem.rightBarButtonItem.enabled=NO;
    }
}

@end

//
//  PXDatePickerViewController.m
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/2/25.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "PXDatePickerViewController.h"
#import <YYKit/YYKit.h>
#define currentMonth [currentMonthString integerValue]


@interface PXDatePickerViewController ()<UITextFieldDelegate>

@property (strong, nonatomic)  UIView *toolbarCancelDone;

@property (strong, nonatomic)  UIPickerView *customPicker;

@end

@implementation PXDatePickerViewController
{
    
    NSMutableArray *yearArray;
    NSArray *monthArray;
    NSMutableArray *monthMutableArray;
    NSMutableArray *DaysArray;
    NSString *currentyearString;
    NSString *currentMonthString;
    NSString *currentDateString;
    
    NSInteger selectedYearRow;
    NSInteger selectedMonthRow;
    NSInteger selectedDayRow;
    
    BOOL firstTimeLoad;
    
    NSInteger m ;
    int year;
    int month;
    int day;
    
  

    BOOL isChoseMonth;
    BOOL isChoseDay;
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
-(void)choseDateNeedMonth:(BOOL)dmonth AndDay:(BOOL)dday{

    isChoseMonth=dmonth;
    isChoseDay=dday;
    [self configDate];
    
}
-(void)choseDate:(NSDate *)nowDate{
    
    [self configViews];
   
}



- (void)configViews
{

    [self addSubview:self.customPicker];
    self.customPicker.backgroundColor=[UIColor whiteColor];
    [self addSubview:self.toolbarCancelDone];
    self.toolbarCancelDone.backgroundColor = [UIColor colorWithHexString:@"e63979"];
    
    
    
    UILabel *titleLabel  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 45)];
    titleLabel.text = @"选择日期";
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.toolbarCancelDone addSubview:titleLabel];
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [backBtn setImage:[UIImage imageNamed:@"selected_no"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(kScreenWidth - 120, 0, 40, 45);
    backBtn.tag = 10;
    [backBtn setTintColor:[UIColor whiteColor]];
    [backBtn addTarget:self action:@selector(selectedCancleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.toolbarCancelDone addSubview:backBtn];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [sureBtn setImage:[UIImage imageNamed:@"selected_ok"] forState:UIControlStateNormal];
    sureBtn.frame = CGRectMake(kScreenWidth - 60, 0, 40, 45);
    sureBtn.tag = 20;
    [sureBtn setTintColor:[UIColor whiteColor]];
    [sureBtn addTarget:self action:@selector(selectedOkButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.toolbarCancelDone addSubview:sureBtn];
    
    
    
    
    
    self.customPicker.delegate=self;
    self.customPicker.dataSource=self;
    

        
     [self.customPicker selectRow:[yearArray indexOfObject:currentyearString] inComponent:0 animated:YES];

    
    if (isChoseMonth) {
        
     [self.customPicker selectRow:[monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
        
    }
    if (isChoseDay) {
        
         [self.customPicker selectRow:[DaysArray indexOfObject:currentDateString] inComponent:2 animated:YES];
    }
   
    
    
   
    
}

-(void)configDate{
    
//    if (firstTimeLoad)return;

    m=0;
    firstTimeLoad = YES;
    
    NSDate *date = [NSDate date];
    
    // Get Current Year
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    
    currentyearString = [NSString stringWithFormat:@"%@",
                                   [formatter stringFromDate:date]];
    year =[currentyearString intValue];
    
    
    // Get Current  Month
    
    [formatter setDateFormat:@"MM"];
    
    currentMonthString = [NSString stringWithFormat:@"%ld",(long)[[formatter stringFromDate:date]integerValue]];
    month=[currentMonthString intValue];
    
    
    
    
    // Get Current  Date
    
    [formatter setDateFormat:@"dd"];
    currentDateString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    day =[currentDateString intValue];
    
    
    yearArray = [[NSMutableArray alloc]init];
    monthMutableArray = [[NSMutableArray alloc]init];

    for (int i = 1900; i <= year+4 ; i++)
    {
        [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
        
    }
    
    
    // PickerView -  Months data
    
    if (isChoseMonth) {
        
        monthArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
        
        for (int i=1; i<month+1; i++) {
            [monthMutableArray addObject:[NSString stringWithFormat:@"%d",i]];
        }
        
    }
    if (isChoseDay) {
        
        DaysArray = [[NSMutableArray alloc]init];
        
        for (int i = 1; i <= 31; i++)
        {
            [DaysArray addObject:[NSString stringWithFormat:@"%d",i]];
            
        }
       
    }
    
    
    
  
    
    
}
-(void)selectedCancleButtonClick{
    
    
//    self.hidden=YES;
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(DatePickerClosed)]) {
        
        [self.delegate DatePickerClosed];
    }
    
    
}
-(void)selectedOkButtonClick{
    
//     self.hidden=YES;
     NSString * formatDate = @"";
    
  NSString *  monthStr=@"";
  NSString *  dayStr=@"";
    
    

    
     if (isChoseMonth) {
         
         if([[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]]integerValue]<10){
             monthStr=[NSString stringWithFormat:@"%@",[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]]];
         }else{
             monthStr=[NSString stringWithFormat:@"%@",[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]]];
             
         }
    
     }
   
    if (isChoseDay) {
        
        if([[DaysArray objectAtIndex:[self.customPicker selectedRowInComponent:1]]integerValue]<10){
            dayStr=[NSString stringWithFormat:@"%@",[DaysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]]];
        }else{
            dayStr=[NSString stringWithFormat:@"%@",[DaysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]]];
            
        }

    }
    
    if (isChoseMonth) {
        
        if (isChoseDay) {
            
            //返回年月日
            formatDate= [NSString stringWithFormat:@"%@-%@-%@ ",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]],monthStr,dayStr];
            
        }else{
            
            //返回年月
            formatDate= [NSString stringWithFormat:@"%@%@",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]],monthStr];
        }
        
    }else{
        
        //返回年
        formatDate= [NSString stringWithFormat:@"%@",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]]];
    }
    
    NSLog(@"%@",formatDate);
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(DatePickerDidClick:)]) {
        
        [self.delegate DatePickerDidClick:formatDate];
    }
    
}

-(UIPickerView *)customPicker{
    
    if (_customPicker==nil) {
        
        _customPicker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, kScreenHeight-265, kScreenWidth, 265)];
    }
    return _customPicker;
    
}
-(UIView *)toolbarCancelDone{
    
    if (_toolbarCancelDone==nil) {
        _toolbarCancelDone=[[UIView alloc]init];
        _toolbarCancelDone.size=CGSizeMake(kScreenWidth, 40);
        _toolbarCancelDone.bottom=_customPicker.top+40;
    }
    return _toolbarCancelDone;
}



#pragma mark - UIPickerViewDelegate


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    m=row;
    
    
    
    if (component == 0)
    {
        selectedYearRow = row;
        [self.customPicker reloadAllComponents];
    }
    else if (component == 1)
    {
        selectedMonthRow = row;
        [self.customPicker reloadAllComponents];
    }
    else if (component == 2)
    {
        selectedDayRow = row;
        
        [self.customPicker reloadAllComponents];
        
    }
    
}


#pragma mark - UIPickerViewDatasource

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    // Custom View created for each component
    
    UILabel *pickerLabel = (UILabel *)view;
    
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 50, 60);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:18.0f]];
    }
    
    
    
    if (component == 0)
    {
        pickerLabel.text =  [yearArray objectAtIndex:row]; // Year
    }
    else if (component == 1)
    {
        pickerLabel.text =  [monthArray objectAtIndex:row];  // Month
    }
    else if (component == 2)
    {
        pickerLabel.text =  [DaysArray objectAtIndex:row]; // Date
        
    }
    
    
    return pickerLabel;
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    

    
        if (isChoseMonth) {
            
            if (isChoseDay) {
            
                return 3;
            }else{
                
                return 2;
            }
        
        }else{
            return 1;
        }
       
   
        
    
  
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (component == 0)
    {
        return [yearArray count];
        
    }
    else if (component == 1)
    {
        NSInteger selectRow =  [pickerView selectedRowInComponent:0];
        int n;
        n= year-1970;
        if (selectRow==n) {
            return [monthMutableArray count];
        }else
        {
            return [monthArray count];
            
        }
    }
    else
    {
        NSInteger selectRow1 =  [pickerView selectedRowInComponent:0];
        int n;
        n= year-1970;
        NSInteger selectRow =  [pickerView selectedRowInComponent:1];
        
        if (selectRow==month-1 &selectRow1==n) {
            
            return day;
            
        }else{
            
            if (selectedMonthRow == 0 || selectedMonthRow == 2 || selectedMonthRow == 4 || selectedMonthRow == 6 || selectedMonthRow == 7 || selectedMonthRow == 9 || selectedMonthRow == 11)
            {
                return 31;
            }
            else if (selectedMonthRow == 1)
            {
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
                
                
                
            }
            else
            {
                return 30;
            }
            
            
        }
        
    }
    
}




@end

//
//  EditContentsViewController.m
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/2/15.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "EditContentsViewController.h"
#import <YYKit/YYKit.h>
#import "NSString+ZPX.h"
@interface EditContentsViewController ()<YYTextViewDelegate>{
    
    NSString * labelTitle;
}
@property (nonatomic, assign) YYTextView *textView;

@end



@implementation EditContentsViewController


-(instancetype)initWithText:(NSString *)text{
    
    if (self=[super init]) {
        
        labelTitle=text;
    }
    
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"编辑内容";
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    

    
    YYTextView *textView = [YYTextView new];
    textView.text = labelTitle;
    textView.font = [UIFont systemFontOfSize:17];
    textView.size = self.view.size;
    textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    textView.delegate = self;
    textView.allowsUndoAndRedo = YES; /// Undo and Redo
    textView.maximumUndoLevel = 10; /// Undo level
    if ([self.mEditType isEqualToString:@"发票"]) {
        textView.placeholderText=@"请输入发票抬头）";
        self.navigationItem.title=@"发票";
    }
    if ([self.mEditType isEqualToString:@"备注"]) {
        textView.placeholderText=@"请输入备注（如： 不要辣）";
        self.navigationItem.title=@"职位名称";
    }
   
    if (kiOS7Later) {
        textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    }
    textView.contentInset = UIEdgeInsetsMake((kiOS7Later ? 64 : 0), 0, 0, 0);
    textView.scrollIndicatorInsets = textView.contentInset;
    [self.view addSubview:textView];
    self.textView = textView;
    textView.selectedRange = NSMakeRange(labelTitle.length, 0);
    [textView becomeFirstResponder];
}


- (void)edit:(UIBarButtonItem *)item {
    if (_textView.isFirstResponder) {
        
        if (![_textView.text isValid]) {
            
            [_textView resignFirstResponder];
            
            if (self.delegate ) {
                
                if ([self.mEditType isEqualToString:@"备注"]) {
                       [self.delegate editComplete:_textView.text type:1];
                }else if([self.mEditType isEqualToString:@"发票"]){
                    [self.delegate editComplete:_textView.text type:0];
                }
             
                
                [self.navigationController popVC:YES];
               // [self.navigationController pushVC:YES ];
            }
            
            
        }else{
            
            NSLog(@"请输入编辑内容");
        }
        
        
    } else {
        [_textView becomeFirstResponder];
    }
}

- (void)textViewDidBeginEditing:(YYTextView *)textView {
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(edit:)];
    self.navigationItem.rightBarButtonItem = buttonItem;
}

- (void)textViewDidEndEditing:(YYTextView *)textView {
  //  self.navigationItem.rightBarButtonItem = nil;
}

- (BOOL)textView:(YYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
//    if ([self.mEditType isEqualToString:@"招聘人数"]) {
//        NSUInteger length = textView.text.length;
//        if (length >= 3  &&  text.length >0)
//        {
//            return  NO;
//        }
//        return [self validateNumber:text];
//    }
    if ([self.mEditType isEqualToString:@"发票"]) {
        NSUInteger length = textView.text.length;
        if (length >= 100  &&  text.length >0)
        {
            return  NO;
        }
    }
    
    if ([self.mEditType isEqualToString:@"备注"]) {
        NSUInteger length = textView.text.length;
        if (length >= 100  &&  text.length >0)
        {
            return  NO;
        }
    }
    return YES;
    
}

- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

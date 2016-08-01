//
//  WebViewController.m
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/1/19.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "WebViewController.h"
#import "WDGoBackNav.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (nonatomic, weak) UIWebView *webView;
@property (nonatomic, weak) UIActivityIndicatorView* indicator;
@property(nonatomic,strong)NSString * url;
@end

@implementation WebViewController

-(id)initWithUrl:(NSString*)url{
    self=[super init];
    if (self) {
        _url=url;
    }
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
   
    
}
- (void)viewDidLoad {
    [super viewDidLoad];


    
 
    
    // 添加webview
    [self setupWebview];
    
    // 添加UIActivityIndicatorView
    [self setupActivityIndicator];
    
    // 加载网页
    [self loadWebViewUrl:_url];
    
    
    [self addHeaderLeftBar];

    
   
}

-(void)addHeaderLeftBar
{
    __weak typeof(self) _weakself = self;
    
    WDGoBackNav* mleftButton = [[WDGoBackNav alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    mleftButton.mGoBackBlock=^(void){
        [_weakself goback];
    };
    
    UIBarButtonItem* leftBar=[[UIBarButtonItem alloc]initWithCustomView:mleftButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftBar];
    
}

-(void)addHeaderRightBar
{
    __weak typeof(self) _weakself = self;
    
    WDGoBackNav* rightButton = [[WDGoBackNav alloc] initWithFrame:CGRectMake(0, 0, 44, 44) WithText:@"关闭"];
    rightButton.mGoBackBlock=^(void){
        [_weakself.navigationController popViewControllerAnimated:YES];
    };
    
    UIBarButtonItem* rightBar=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
   
    self.navigationItem.rightBarButtonItem = rightBar;
    
}

#pragma mark - setting

-(void)setNavTitle:(NSString *)NavTitle{
    
    _NavTitle=NavTitle;
    self.title=_NavTitle;
}

#pragma mark setupViews
// 添加webview
- (void)setupWebview
{
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    self.webView = webView;
    webView.scalesPageToFit=YES;
    self.webView.delegate = self;
    webView.scrollView.bounces=NO;
}

- (void)setupActivityIndicator
{
    //初始化:
    UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    
    //设置显示样式,见UIActivityIndicatorViewStyle的定义
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    
    //设置显示位置
    [indicator setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
    
    //设置背景色
    indicator.backgroundColor = [UIColor grayColor];
    
    //设置背景透明
    indicator.alpha = 0.5;
    
    //设置背景为圆角矩形
    indicator.layer.cornerRadius = 6;
    indicator.layer.masksToBounds = YES;
    
    [self.view addSubview:indicator];
    self.indicator = indicator;
    self.indicator.hidden = YES;
}

// 加载网页
- (void)loadWebViewUrl:(NSString *)strUrl
{
    if (strUrl==nil)
        return;
    
    //[NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@",host_url,baseurl,postURL]]
    
    NSString *correctUrlStr = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:correctUrlStr];
    
//    NSDictionary *properties = [[NSMutableDictionary alloc] init];
    
//    if([[WDCLIGet createInstance] wdcliUsable])
//    {
//        [properties setValue:[[WDCLIGet createInstance] wdcli] forKey:NSHTTPCookieValue];
//    }else
//    {
//        
//    }
    
//    [properties setValue:@"WDCLI" forKey:NSHTTPCookieName];
//    [properties setValue:@"api.dance365.com" forKey:NSHTTPCookieDomain];
//    [properties setValue:[NSDate dateWithTimeIntervalSinceNow:60*60] forKey:NSHTTPCookieExpires];
//    [properties setValue:@"/" forKey:NSHTTPCookiePath];
//    
//    
//    NSHTTPCookie *cookie = [[NSHTTPCookie alloc] initWithProperties:properties];
//    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
//
//    NSArray *headeringCookie = [NSHTTPCookie cookiesWithResponseHeaderFields:
//                                [NSDictionary dictionaryWithObject:
//                                 [[NSString alloc] initWithFormat:@"%@=%@",[cookie name],[cookie value]]
//                                                            forKey:@"Set-Cookie"]
//                                                                      forURL:[NSURL URLWithString:strUrl]];
//    
//    
//    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookies:headeringCookie forURL:url mainDocumentURL:nil];
//    
//    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    
    [self.webView loadRequest:request];
    
}

#pragma mark navItem action
// 后退
- (void)goback
{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    } else {

        if ([self.title isEqualToString:@"用户协议"]) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }
}


#pragma mark UIWebViewDelegate


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.indicator startAnimating];
    self.indicator.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView;
{
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;
    
     BOOL isCanBack=[self.webView canGoBack];
    if (isCanBack) {
        
        [self addHeaderRightBar];
       
    }else{
        
         self.navigationItem.rightBarButtonItem = nil;
    }

   
    
}

- (void)dealloc
{
    self.webView.delegate = nil;
    //self.webView = nil;
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                        duration:(NSTimeInterval)duration
{
    CGRect _frame = [[UIScreen mainScreen] bounds];
    // popView.frame=CGRectMake(_frame.size.width-50, (_frame.size.height-_number*50)/2, 50,  _number*50);
    
    self.webView.frame=_frame;
    
    
    if (toInterfaceOrientation==UIDeviceOrientationLandscapeLeft) {
        //
        
        self.view.frame = CGRectMake(0, 40, _frame.size.width, _frame.size.height);
        self.webView.frame=_frame;
        
    }
    
    
    //这里是横屏时 你执行的方法
    if (toInterfaceOrientation==UIDeviceOrientationLandscapeRight) {
        //        //self.navigationItem.hidesBackButton =YES;
        CGRect _frame = [[UIScreen mainScreen] bounds];
        
        self.view.frame = CGRectMake(0, 40, _frame.size.width, _frame.size.height);
        self.webView.frame=_frame;
        
    }
    
    if (toInterfaceOrientation==UIDeviceOrientationPortrait) {
        CGRect _frame = [[UIScreen mainScreen] bounds];
        
        self.view.frame = CGRectMake(0,64, _frame.size.width, _frame.size.height);
        self.webView.frame=_frame;
    }
}

-(BOOL)shouldAutorotate{
    
    return NO;
}


@end

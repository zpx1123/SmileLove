//
//  HomeViewController.m
//  SmileLove
//
//  Created by 周鹏翔 on 16/7/14.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "HomeViewController.h"
#import <YYKit/YYKit.h>
#import "UINavigationBar+Awesome.h"
#define DURATION 0.7f
#define IMAGE_COUNT 5

typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
    
} AnimationType;


@interface HomeViewController (){
    
    
    UIImageView * backgroundView;
    int  _currentIndex;
    
}
@property (nonatomic, assign) int subtype;
@end

@implementation HomeViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
//    self.tableView.delegate = self;
//    [self scrollViewDidScroll:self.tableView];
    
//    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
//    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY > NAVBAR_CHANGE_POINT) {
//        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
//        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
//    } else {
//        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
//    }
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:0];
     [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    self.tableView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"I LOVE YOU";
//    self.view.backgroundColor=[UIColor blackColor];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"04.jpg"]];
    backgroundView=[[UIImageView alloc]init];
    [self.view addSubview:backgroundView];
    backgroundView.image=[UIImage imageNamed:@"1"];
    backgroundView.contentMode=UIViewContentModeScaleAspectFill;
    backgroundView.size=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    backgroundView.center=self.view.center;
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"切换" style:UIBarButtonItemStylePlain target:self action:@selector(ChangeIndex)];
    
    
//    backgroundView=[[UIImageView alloc]init];
//    [self.view addSubview:backgroundView];
//    backgroundView.image=[UIImage imageNamed:@"02.jpg"];
//    backgroundView.contentMode=UIViewContentModeScaleAspectFill;
//    backgroundView.size=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
//    backgroundView.center=self.view.center;
    
    
    
    //添加左滑动手势
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    //添加右滑动手势
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self.view addGestureRecognizer:tapGesture];
    
    _subtype = 0;
    
    // Do any additional setup after loading the view.
}

-(void)ChangeIndex{
    
  
    UIViewController * viewc=[[UIViewController alloc]init];
    viewc.view.backgroundColor=[UIColor grayColor];
    
//    //1.创建转场动画对象
    CATransition *transition=[[CATransition alloc]init];
    
    //2.设置动画类型,注意对于苹果官方没公开的动画类型只能使用字符串，并没有对应的常量定义
    transition.type=@"oglFlip";
    
    //设置子类型
    if (/* DISABLES CODE */ (YES)) {
        transition.subtype=kCATransitionFromRight;
    }else{
        transition.subtype=kCATransitionFromLeft;
    }
    //设置动画时常
    transition.duration=0.7f;
    
    
    [ self.navigationController.view . layer   addAnimation :transition  forKey : @"KCTransitionAnimation" ];
    [ self.navigationController pushViewController :viewc  animated : NO ];
    
    
    
    
//    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    popAnimation.duration = 0.4;
//    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
//                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
//                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
//                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
//    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
//    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    
    
//    [ self.navigationController.view . layer   addAnimation :popAnimation  forKey : nil ];
//    [ self.navigationController pushViewController :viewc  animated : NO ];
    
    
   
    
}

#pragma mark 向左滑动浏览下一张图片
-(void)leftSwipe:(UISwipeGestureRecognizer *)gesture{
    [self transitionAnimation:YES];
}

#pragma mark 向右滑动浏览上一张图片
-(void)rightSwipe:(UISwipeGestureRecognizer *)gesture{
    [self transitionAnimation:NO];
}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//    //1.创建转场动画对象
//    CATransition *transition=[[CATransition alloc]init];
//    
//    //2.设置动画类型,注意对于苹果官方没公开的动画类型只能使用字符串，并没有对应的常量定义
//    transition.type=@"rippleEffect";
//    
//    //设置子类型
//    if (/* DISABLES CODE */ (YES)) {
//        transition.subtype=kCATransitionFromRight;
//    }else{
//        transition.subtype=kCATransitionFromLeft;
//    }
//    //设置动画时常
//    transition.duration=0.7f;
//    
//    //3.设置转场后的新视图添加转场动画
//    backgroundView.image=[self getImage:YES];
//    [backgroundView.layer addAnimation:transition forKey:@"KCTransitionAnimation"];
//}
-(void)tapGesture:(UITapGestureRecognizer *)tap{
    
    //1.创建转场动画对象
    CATransition *transition=[[CATransition alloc]init];
    
    //2.设置动画类型,注意对于苹果官方没公开的动画类型只能使用字符串，并没有对应的常量定义
    transition.type=@"rippleEffect";
    
    //设置子类型
    if (/* DISABLES CODE */ (YES)) {
        transition.subtype=kCATransitionFromRight;
    }else{
        transition.subtype=kCATransitionFromLeft;
    }
    //设置动画时常
    transition.duration=0.7f;
    
    //3.设置转场后的新视图添加转场动画
    backgroundView.image=[self getImage:YES];
    [backgroundView.layer addAnimation:transition forKey:@"KCTransitionAnimation"];
}
-(void)transitionAnimation:(BOOL)isNext{

        //1.创建转场动画对象
        CATransition *transition=[[CATransition alloc]init];
        
        //2.设置动画类型,注意对于苹果官方没公开的动画类型只能使用字符串，并没有对应的常量定义
        transition.type=@"pageCurl";
        
        //设置子类型
        if (isNext) {
            transition.subtype=kCATransitionFromRight;
        }else{
            transition.subtype=kCATransitionFromLeft;
        }
        //设置动画时常
        transition.duration=0.7f;
        
        //3.设置转场后的新视图添加转场动画
        backgroundView.image=[self getImage:isNext];
        [backgroundView.layer addAnimation:transition forKey:@"KCTransitionAnimation"];
    

    
    return;
    
    
    
    AnimationType animationType = 7;
    
    NSString *subtypeString;
    
    switch (_subtype) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
        default:
            break;
    }
    _subtype += 1;
    if (_subtype > 3) {
        _subtype = 0;
    }
    
    
    switch (animationType) {
        case Fade:
            [self transitionWithType:kCATransitionFade WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Push:
            [self transitionWithType:kCATransitionPush WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Reveal:
            [self transitionWithType:kCATransitionReveal WithSubtype:subtypeString ForView:self.view];
            break;
            
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Cube:
            [self transitionWithType:@"cube" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case SuckEffect:
            [self transitionWithType:@"suckEffect" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case OglFlip:
            [self transitionWithType:@"oglFlip" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case PageCurl:
            [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:backgroundView];
            break;
            
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CurlDown:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case CurlUp:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case FlipFromLeft:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case FlipFromRight:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
            
        default:
            break;
    }
    
    static int i = 0;
    if (i == 0) {
//        [self addBgImageWithImageName:IMAGE1];
        i = 1;
    }
    else
    {
//        [self addBgImageWithImageName:IMAGE2];
        i = 0;
    }


}

#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = DURATION;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}

#pragma mark 取得当前图片
-(UIImage *)getImage:(BOOL)isNext{
    if (isNext) {
        _currentIndex=(_currentIndex+1)%IMAGE_COUNT;
    }else{
        _currentIndex=(_currentIndex-1+IMAGE_COUNT)%IMAGE_COUNT;
    }
    NSString *imageName=[NSString stringWithFormat:@"%i.png",_currentIndex];
    return [UIImage imageNamed:imageName];
}

#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
//        [backgroundView removeFromSuperview ];
        
    }];
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

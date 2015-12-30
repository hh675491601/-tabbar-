//
//  ViewController.m
//  CustomTabbar
//
//  Created by 何昊 on 15/12/17.
//  Copyright © 2015年 DaMuGeTech. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width/320
#define kScreenHeight [UIScreen mainScreen].bounds.size.height/480
@interface ViewController ()
@property (strong, nonatomic)UIViewController *current;
@property (strong, nonatomic)OneViewController *oneVC;
@property (strong, nonatomic)TwoViewController *twoVC;
@property (strong, nonatomic)ThreeViewController *threeVC;
@property (strong, nonatomic)UIButton *btn1;
@property (strong, nonatomic)UIButton *btn2;
@property (strong, nonatomic)UIButton *btn3;

@property (strong, nonatomic)UIButton *one;
@property (strong, nonatomic)UIButton *two;
@property (strong, nonatomic)UIButton *three;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createTabbar];
    
    self.oneVC = [[OneViewController alloc] init];
    self.twoVC = [[TwoViewController alloc] init];
    self.threeVC = [[ThreeViewController alloc] init];
    [self setCurrent:self.oneVC];
}
- (void)createTabbar
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 480 * kScreenHeight - 49, 320 * kScreenWidth, 49)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn1 setImage:[UIImage imageNamed:@"my_information_01"] forState:UIControlStateNormal];
    self.btn1.selected = YES;
    self.btn1.frame = CGRectMake(170 * kScreenWidth / 4, 5, 50, 40);
    [bgView addSubview:self.btn1];
    SEL a = @selector(btn1Click);
    [self.btn1 addTarget:self action:a forControlEvents:UIControlEventTouchUpInside];
    
    self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn2 setBackgroundImage:[UIImage imageNamed:@"main_bar_plus"] forState:UIControlStateNormal];
    self.btn2.selected = NO;
    self.btn2.frame = CGRectMake(320 * kScreenWidth / 2 - 40, -31, 80, 80);
    [bgView addSubview:self.btn2];
    SEL b = @selector(btn2Click);
    [self.btn2 addTarget:self action:b forControlEvents:UIControlEventTouchUpInside];
    
    self.btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn3 setImage:[UIImage imageNamed:@"my_task_02"] forState:UIControlStateNormal];
    self.btn3.selected = NO;
    self.btn3.frame = CGRectMake(170 * kScreenWidth / 4 * 3 + 100, 5, 50, 40);
    [bgView addSubview:self.btn3];
    SEL c = @selector(btn3Click);
    [self.btn3 addTarget:self action:c forControlEvents:UIControlEventTouchUpInside];
}
- (void)btn1Click
{
    if (self.btn1.selected == NO)
    {
        self.btn1.selected = YES;
//        self.btn2.selected = NO;
        self.btn3.selected = NO;
        [self.btn1 setImage:[UIImage imageNamed:@"my_information_01"] forState:UIControlStateNormal];
//        [self.btn2 setImage:[UIImage imageNamed:@"my_pack_02"] forState:UIControlStateNormal];
        [self.btn3 setImage:[UIImage imageNamed:@"my_task_02"] forState:UIControlStateNormal];
    }
    [self setCurrent:self.oneVC];
}
- (void)btn2Click
{
    if (self.btn2.selected == NO)
    {
        self.btn2.transform = CGAffineTransformMakeRotation(M_PI_4);
        [self createFollow];//
        self.btn2.selected = YES;
        self.btn1.selected = NO;
        self.btn3.selected = NO;
//        [self.btn2 setImage:[UIImage imageNamed:@"my_pack_01"] forState:UIControlStateNormal];
        [self.btn1 setImage:[UIImage imageNamed:@"my_information_02"] forState:UIControlStateNormal];
        [self.btn3 setImage:[UIImage imageNamed:@"my_task_02"] forState:UIControlStateNormal];
    }
    else
    {
        self.btn2.transform = CGAffineTransformMakeRotation(M_PI_2);
        [self closeUI];//
        self.btn2.selected = NO;
        [self.btn1 setImage:[UIImage imageNamed:@"my_information_02"] forState:UIControlStateNormal];
        [self.btn3 setImage:[UIImage imageNamed:@"my_task_02"] forState:UIControlStateNormal];
    }
    [self setCurrent:self.twoVC];
}
- (void)btn3Click
{
    if (self.btn3.selected == NO)
    {
        self.btn3.selected = YES;
        self.btn1.selected = NO;
//        self.btn2.selected = NO;
        [self.btn3 setImage:[UIImage imageNamed:@"my_task_01"] forState:UIControlStateNormal];
        [self.btn1 setImage:[UIImage imageNamed:@"my_information_02"] forState:UIControlStateNormal];
//        [self.btn2 setImage:[UIImage imageNamed:@"my_pack_02"] forState:UIControlStateNormal];
    }
    [self setCurrent:self.threeVC];
}
-(void)setCurrent:(UIViewController *)currentVC
{
    if (_current != currentVC)
    {
        [_current.view removeFromSuperview];
        
        [self.view addSubview:currentVC.view];
        [self.view sendSubviewToBack:currentVC.view];
        
        _current = currentVC;
    }
}
- (void)createFollow
{
    self.one = [UIButton buttonWithType:UIButtonTypeCustom];
    self.one.frame = CGRectMake(320 * kScreenWidth / 2 - 20, 480 * kScreenHeight - 80, 40, 40);
    [self.one setBackgroundImage:[UIImage imageNamed:@"information_03"] forState:UIControlStateNormal];
    [self.view addSubview:self.one];

    self.two = [UIButton buttonWithType:UIButtonTypeCustom];
    self.two.frame = CGRectMake(320 * kScreenWidth / 2 - 20, 480 * kScreenHeight - 80, 40, 40);
    [self.two setBackgroundImage:[UIImage imageNamed:@"information_04"] forState:UIControlStateNormal];
    [self.view addSubview:self.two];
    
    self.three = [UIButton buttonWithType:UIButtonTypeCustom];
    self.three.frame = CGRectMake(320 * kScreenWidth / 2 - 20, 480 * kScreenHeight - 80, 40, 40);
    [self.three setBackgroundImage:[UIImage imageNamed:@"information_05"] forState:UIControlStateNormal];
    [self.view addSubview:self.three];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    self.one.frame = CGRectMake((320 * kScreenWidth - 120)/4, 380 * kScreenHeight, 40, 40);
    self.two.frame = CGRectMake((320 * kScreenWidth - 120)/4 * 2 + 40, 360 * kScreenHeight, 40, 40);
    self.three.frame = CGRectMake((320 * kScreenWidth - 120)/4 * 3 + 80, 380 * kScreenHeight, 40, 40);
    [UIView commitAnimations];
}
- (void)closeUI
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    self.one.frame = CGRectMake(320 * kScreenWidth / 2 - 20, 480 * kScreenHeight - 80, 40, 40);
    self.two.frame = CGRectMake(320 * kScreenWidth / 2 - 20, 480 * kScreenHeight - 80, 40, 40);
    self.three.frame = CGRectMake(320 * kScreenWidth / 2 - 20, 480 * kScreenHeight - 80, 40, 40);
    [UIView commitAnimations];
    [self performSelector:@selector(removeUI) withObject:nil afterDelay:1];
}
- (void)removeUI
{
    [self.one removeFromSuperview];
    [self.two removeFromSuperview];
    [self.three removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

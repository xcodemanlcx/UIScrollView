//
//  BaseViewController.m
//  UIScrollView
//
//  Created by hx_leichunxiang on 14-9-17.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  功能：坐标偏移属性contentOffset与滚动方法scrollRectToVisible的区别
//  说明：contentOffset不带动画，scrollRectToVisible带动画

#import "BaseViewController.h"

@interface BaseViewController ()
{
    UIScrollView *scrollView;
}
@end

@implementation BaseViewController

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
    // Do any additional setup after loading the view.
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scrollView];
    
    for (int i=0; i<3; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, i*scrollView.frame.size.height, scrollView.frame.size.width, scrollView.frame.size.height);
        label.backgroundColor = [UIColor colorWithRed:random()%255/256.0 green:random()%255/256.0 blue:random()%255/256.0 alpha:1];
//        label.backgroundColor = [UIColor greenColor];
        label.text = [NSString stringWithFormat:@"label tag is %d",i];
        [scrollView addSubview:label];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height*3);
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0,250, 200, 40)];
    [btn1 setTitle:@"contentOffset" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(action1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 250+60, 200, 40)];
    [btn2 setTitle:@"scrollRectToVisible" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(action2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

//坐标偏移
- (void)action1:(UIButton *)sender
{
    [scrollView setContentOffset:CGPointMake(50, scrollView.frame.size.height/2)];//坐标左上移动
}

//滚动使contentSize不可见为可见
- (void)action2:(UIButton *)sender
{
    [scrollView scrollRectToVisible:CGRectMake(0, scrollView.frame.size.height*2, scrollView.frame.size.width, scrollView.frame.size.height) animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

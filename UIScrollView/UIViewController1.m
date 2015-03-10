//
//  UIViewController1.m
//  UIScrollView
//
//  Created by hx_leichunxiang on 14-11-12.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  功能：1.1 scrollView的主要代理方法执行顺序;1.2 touches触点的响应前提：子视图userInteractionEnabled的设置NO；1.3 touches的代理方法与执行order。1.4 获取touch触点滑动方向、坐标。

#import "UIViewController1.h"

@interface UIViewController1 ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    NSInteger _NO;//scrollView代理方法执行顺序号
    NSInteger _touchesNo;//touches代理方法执行顺序号
}
@end

@implementation UIViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor purpleColor];
    _scrollView.contentSize = CGSizeMake(3*320, 400);
    _scrollView.pagingEnabled = YES;
//    _scrollView.scrollEnabled = NO;
    _scrollView.minimumZoomScale = 20;
    _scrollView.maximumZoomScale = 200;
//    _scrollView.contentInset = UIEdgeInsetsMake(10, 20, 40, 80);//内容边距
    [self.view addSubview:_scrollView];
//    _scrollView.userInteractionEnabled = NO;//设置为NO，touches可以响应self.view.
    _scrollView.delaysContentTouches = NO;
    for (NSInteger i = 0; i < 3; i ++)
    {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(320*i, 0, 320, 400);
        imgView.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
        [_scrollView addSubview:imgView];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"DidScroll == %i",_NO++);
}// any offset changes

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _NO = 0;
    NSLog(@"WillBeginDragging == %i",_NO++);

}
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    NSLog(@"WillEndDragging == %i",_NO++);

}

// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"DidEndDragging == %i",_NO++);

}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"WillBeginDecelerating == %i",_NO++);

}// called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"DidEndDecelerating == %i",_NO++);

}// called when scroll view grinds to a halt

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"DidEndScrollingAnimation == %i",_NO++);
}// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    NSLog(@"touchesShouldBegin == %i",_NO++);

    return YES;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    NSLog(@"touchesShouldCancelInContentView == %i",_NO++);
    return YES;
}

#pragma mark - touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _touchesNo = 0;
    NSLog(@"touchesBegan == %i",_touchesNo++);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = (UITouch *)[touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    CGPoint prePoint = [touch previousLocationInView:self.view];
    NSLog(@"x==%f,y==%f",point.x,point.y);
    NSLog(@"x==%f,y==%f",prePoint.x,prePoint.y);

    NSLog(@"touchesMoved == %i",_touchesNo++);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded == %i",_touchesNo++);
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

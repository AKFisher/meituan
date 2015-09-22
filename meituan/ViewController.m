//
//  ViewController.m
//  meituan
//
//  Created by tom on 15/8/26.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "ViewController.h"
#import "TopView.h"
#import "BottomView.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<BottomViewDelegate,TopViewDelegate>
@property(nonatomic,strong) TopView   *topView ;
@property(nonatomic,strong) BottomView   *bottomView ;

@property(nonatomic,strong) UIView  *toolBar ;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TopView *topView=[TopView topViewWithFrame:CGRectMake(0, 0, 60, 200)];
    topView.delegate=self;
    self.topView=topView ;
    
    UIView *toolBar=[[UIView alloc] init];
    toolBar.backgroundColor=[UIColor lightGrayColor];

    self.toolBar=toolBar;
    [self.view addSubview:toolBar ];
    [self.toolBar addSubview:self.topView];
    
    BottomView *bottomView=[BottomView bottomViewWithFrame:CGRectZero];
    self.bottomView=bottomView ;
    [self.toolBar addSubview:self.bottomView];
    bottomView.delegate=self;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    NSLog(@"%@",window);
    
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated] ;
    UIInterfaceOrientation  orientation=self.interfaceOrientation ;
    [self didRotateFromInterfaceOrientation:orientation];
}

    // 旋转完成时调用
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    NSLog(@"%s,width=%f,height=%f",__func__,Width,Height);
    
    UIInterfaceOrientation orientation=self.interfaceOrientation ;
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        NSLog(@"%@",@"横屏");
        [self viewLandscape ];
    }
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        NSLog(@"%@",@"竖屏");
        [self viewPortrait];
    }
}
    // 将要旋转的时候调用
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
   
}
- (void) viewLandscape {
    [UIView animateWithDuration:.2 animations:^{
        self.toolBar.frame=CGRectMake(0, 0, 60, Height);
        self.topView.frame=CGRectMake(0, 0, 60, 200);
        self.bottomView.frame=CGRectMake(0, Height-200, 60, 150);
    }];
}
- (void) viewPortrait{
    [UIView animateWithDuration:0.2 animations:^{
        self.toolBar.frame=CGRectMake(0, 0, 60, Height);
        self.topView.frame=CGRectMake(0, 0, 60, 200);
        self.bottomView.frame=CGRectMake(0, Height-200, 60, 150);
    }] ;
   
}
- (void)bottomView:(BottomView *)bottomView click:(UIButton *)btn {
    NSLog(@"%d",btn.tag);

}
- (void)topView:(TopView *)topView click:(UIButton *)btn{
    NSLog(@"%d",btn.tag);
}
@end

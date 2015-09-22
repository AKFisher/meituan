
    //
//  TopView.m
//  meituan
//
//  Created by tom on 15/8/31.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "TopView.h"
#define Random (arc4random_uniform(255)+1)/255.0
#define Padding 10
#define Width    40
#define Height   40

@interface TopView ()

@property(nonatomic,strong) UIButton   *btn1 ;
@property(nonatomic,strong) UIButton   *btn2 ;
@property(nonatomic,strong) UIButton   *btn3 ;
@property(nonatomic,strong) UIButton   *btn4 ;


@end

@implementation TopView
+(instancetype) topViewWithFrame :(CGRect) frame{
    return  [[self alloc] initWithFrame:frame];
}
 
- (instancetype) initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        btn1.backgroundColor= [UIColor colorWithRed:Random green:Random blue:Random alpha:1];
        [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
        btn1.tag=1;
        [btn1 addTarget:self action:@selector(topViewClick:) forControlEvents:UIControlEventTouchUpInside];
        self.btn1=btn1;
        
         UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
         btn2.backgroundColor=[UIColor colorWithRed:Random green:Random blue:Random alpha:1];
        [btn2 setTitle:@"btn2" forState:UIControlStateNormal];
        btn2.tag=2 ;
         [btn2
          addTarget:self action:@selector(topViewClick:) forControlEvents:UIControlEventTouchUpInside];
        self.btn2=btn2;
        
        UIButton *btn3=[UIButton buttonWithType:UIButtonTypeCustom];
        btn3.backgroundColor=[UIColor colorWithRed:Random green:Random blue:Random alpha:1];
        [btn3 setTitle:@"btn3" forState:UIControlStateNormal];
        btn3.tag=3;
         [btn3 addTarget:self action:@selector(topViewClick:) forControlEvents:UIControlEventTouchUpInside];
        self.btn3=btn3 ;
        
        
        UIButton *btn4=[UIButton buttonWithType:UIButtonTypeCustom];
        btn4.backgroundColor=[UIColor colorWithRed:Random green:Random blue:Random alpha:1];
        [btn4 setTitle:@"btn4" forState:UIControlStateNormal];
        btn4.tag=4;
         [btn4 addTarget:self action:@selector(topViewClick:) forControlEvents:UIControlEventTouchUpInside];
        self.btn4=btn4 ;
        
         [self addSubview:btn1] ;
         [self addSubview:btn2] ;
         [self addSubview:btn3] ;
         [self addSubview:btn4] ;
    }
    return  self ;
}
- (void)layoutSubviews {
    [super layoutSubviews] ;
    self.btn1.frame=CGRectMake(Padding, Padding, Width ,Height);
    self.btn2.frame=CGRectMake(Padding, CGRectGetMaxY(self.btn1.frame)+Padding, Width, Height);
    self.btn3.frame=CGRectMake(Padding, CGRectGetMaxY(self.btn2.frame)+Padding, Width, Height);
    self.btn4.frame=CGRectMake(Padding, CGRectGetMaxY(self.btn3.frame)+Padding, Width, Height);
}

- (void) topViewClick:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(topView:click:)]) {
        [self.delegate topView:self click:btn];
    }
    
}
@end

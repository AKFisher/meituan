//
//  BottomView.m
//  meituan
//
//  Created by tom on 15/8/31.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "BottomView.h"
#define Random (arc4random_uniform(255)+1)/255.0
#define Padding 10
#define Width    40
#define Height   40
@interface BottomView ()
@property(nonatomic,strong) UIButton   *btn5 ;
@property(nonatomic,strong) UIButton   *btn6 ;
@property(nonatomic,strong) UIButton   *btn7 ;

@end

@implementation BottomView

+(instancetype) bottomViewWithFrame :(CGRect) frame{
    return  [[self alloc] initWithFrame:frame];
}

- (instancetype) initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        UIButton *btn5=[UIButton buttonWithType:UIButtonTypeCustom];
        btn5.backgroundColor= [UIColor colorWithRed:Random green:Random blue:Random alpha:1];
        [btn5 setTitle:@"btn5" forState:UIControlStateNormal];
        btn5.tag=5;
        self.btn5=btn5;
        [btn5 addTarget: self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn6=[UIButton buttonWithType:UIButtonTypeCustom];
        btn6.backgroundColor=[UIColor colorWithRed:Random green:Random blue:Random alpha:1];
        btn6.tag=6;
        [btn6 setTitle:@"btn6" forState:UIControlStateNormal];
        self.btn6=btn6;
        [btn6 addTarget: self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn7=[UIButton buttonWithType:UIButtonTypeCustom];
        btn7.backgroundColor=[UIColor colorWithRed:Random green:Random blue:Random alpha:1];
        [btn7 setTitle:@"btn7" forState:UIControlStateNormal];
        self.btn7=btn7 ;
        self.btn7.tag=7;
        [btn7 addTarget: self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn5] ;
        [self addSubview:btn6] ;
        [self addSubview:btn7] ;

    }
    return  self ;
}
- (void)layoutSubviews {
    [super layoutSubviews] ;
    self.btn5.frame=CGRectMake(Padding, Padding, Width ,Height);
    self.btn6.frame=CGRectMake(Padding, CGRectGetMaxY(self.btn5.frame)+Padding, Width, Height);
    self.btn7.frame=CGRectMake(Padding, CGRectGetMaxY(self.btn6.frame)+Padding, Width, Height);
}
- (void) buttonClick:(UIButton *)btn  {
    if ([self.delegate respondsToSelector:@selector(bottomView:click:)]) {
        [self.delegate bottomView:self click:btn];
    }
}
@end

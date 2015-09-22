//
//  TopView.h
//  meituan
//
//  Created by tom on 15/8/31.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopView ;

@protocol TopViewDelegate <NSObject>

- (void) topView:(TopView *) topView click:(UIButton *) btn ;

@end

@interface TopView : UIView

+(instancetype) topViewWithFrame :(CGRect) frame ;
@property(nonatomic,weak) id<TopViewDelegate>   delegate ;


@end

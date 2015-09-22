//
//  BottomView.h
//  meituan
//
//  Created by tom on 15/8/31.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BottomView;

@protocol BottomViewDelegate <NSObject>

-(void) bottomView:(BottomView *) bottomView click :(UIButton * )btn ;

@end

@interface BottomView : UIView
+(instancetype) bottomViewWithFrame :(CGRect) frame ;

@property(nonatomic,weak) id<BottomViewDelegate>   delegate  ;

@end

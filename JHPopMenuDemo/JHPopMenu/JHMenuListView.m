//
//  JHMenuListView.m
//  MenuDemo
//
//  Created by 徐仲平 on 16/4/18.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import "JHMenuListView.h"
#import <POP.h>

#define JHMENUBUTTON_W 70
#define JHMENUBUTTON_H 100
#define JHMAXCOLUMNS 3
#define JHANIMATION_BEGINTIME 0.05

@implementation JHMenuListView


-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {

        self.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.99];

       
    }
    return self;
}


-(void)setMenus:(NSArray *)menus{

    _menus = menus;
    
    for (NSUInteger i = 0; i < menus.count; i++) {
        JHMenuButton *button = menus[i];

        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.frame = [UIScreen mainScreen].bounds;
    
    
}

/** 通过按钮的索引计算frame */
-(CGRect)calculateFrameForIndex:(NSUInteger)index{

    
    /** 最大列数 */
    NSInteger maxColumns = JHMAXCOLUMNS;
    /** 按钮开始的Y值 */
    CGFloat buttonStarY = ([UIScreen mainScreen].bounds.size.height - JHMENUBUTTON_H * (JHMAXCOLUMNS - 1)) * 0.5;
    /** 按钮开始的X值 */
    CGFloat buttonStarX = 20;
    /** 按钮X轴的间隔 */
    CGFloat buttonXmargin = ([UIScreen mainScreen].bounds.size.width - JHMENUBUTTON_W * 3 - buttonStarX * 2) / (maxColumns - 1);
    
    /** 行号 */
    NSInteger row = index / maxColumns;
    /** 列号 */
    NSInteger col = index % maxColumns;
    
    CGFloat buttonX= buttonStarX + col * (JHMENUBUTTON_W + buttonXmargin);
    CGFloat buttonY= buttonStarY + row * JHMENUBUTTON_H;

    return CGRectMake(buttonX, buttonY, JHMENUBUTTON_W, JHMENUBUTTON_H);
    
}

-(void)buttonClick:(JHMenuButton *)button{

    [self dismissAnimationCompletionBlock:^{
        button.clickBlock();
    }];
    
}

-(void)showOnTheView:(UIView *)view{


    [view addSubview:self];
    
    [self beginAnimation];
    
}
/** 开始动画 */
-(void)beginAnimation{

    self.userInteractionEnabled = NO;
    for (NSUInteger i = 0; i < _menus.count; i++) {
        JHMenuButton *button = _menus[i];
        
        CGRect frame = [self calculateFrameForIndex:i];
        
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(frame.origin.x, frame.origin.y - [UIScreen mainScreen].bounds.size.height, frame.size.width, frame.size.height)];
        anim.toValue = [NSValue valueWithCGRect:frame];
        
        anim.beginTime = CACurrentMediaTime() + JHANIMATION_BEGINTIME * i;
        [anim setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
            
            self.userInteractionEnabled = YES;
        }];
        
        [button pop_addAnimation:anim forKey:nil];
    }
    
    
}

/** 结束动画 */
-(void)dismissAnimationCompletionBlock:(void(^)())completionBlock{
    
    self.userInteractionEnabled = NO;
        for (NSUInteger i = 0; i < _menus.count; i++) {
        
            JHMenuButton *button = _menus[i];
    
            CGRect frame = [self calculateFrameForIndex:i];
    
            POPSpringAnimation *anima = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    
            anima.toValue = [NSValue valueWithCGRect:CGRectMake(frame.origin.x, frame.origin.y + [UIScreen mainScreen].bounds.size.height, frame.size.width, frame.size.height)];
            
             anima.beginTime = CACurrentMediaTime() + JHANIMATION_BEGINTIME * i;
            [anima setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
                   [self removeFromSuperview];
                if (i == 0) {
                     !completionBlock? :completionBlock();
                }
                       }];
            [button pop_addAnimation:anima forKey:nil];
            
        }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self dismissAnimationCompletionBlock:nil];
    
}

-(void)cancelMenu{

    [self dismissAnimationCompletionBlock:nil];
}



@end

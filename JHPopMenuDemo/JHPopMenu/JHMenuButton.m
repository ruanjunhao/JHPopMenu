//
//  JHMenuButton.m
//  MenuDemo
//
//  Created by 徐仲平 on 16/4/18.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import "JHMenuButton.h"

@implementation JHMenuButton


+(instancetype)menuButtonTitle:(NSString *)title image:(UIImage *)image clickBlock:(JHMenuClickBlock)clickBlock{

    JHMenuButton *button = [JHMenuButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    
    button.clickBlock = clickBlock;
    
    return button;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    self.imageView.jh_x=0;
    self.imageView.jh_y=0;
    self.imageView.jh_height=self.jh_width;
    self.imageView.jh_width=self.jh_width;
    
    self.titleLabel.jh_x=0;
    self.titleLabel.jh_y=self.imageView.jh_height + 5;
    self.titleLabel.jh_width=self.jh_width;
    self.titleLabel.jh_height=self.jh_height-self.titleLabel.jh_y;
}

@end

//*********************************JHExtension***********************************//
@implementation UIView (JHExtension)

-(void)setJh_width:(CGFloat)jh_width{
    
    CGRect frame=self.frame;
    
    frame.size.width=jh_width;
    
    self.frame=frame;
}

-(void)setJh_height:(CGFloat)jh_height{
    
    CGRect frame=self.frame;
    
    frame.size.height=jh_height;
    
    self.frame=frame;
    
}

-(void)setJh_x:(CGFloat)jh_x{
    CGRect frame=self.frame;
    
    frame.origin.x=jh_x;
    
    self.frame=frame;
    
}

-(void)setJh_y:(CGFloat)jh_y{
    CGRect frame=self.frame;
    
    frame.origin.y=jh_y;
    
    self.frame=frame;
    
    
}

-(void)setJh_size:(CGSize)jh_size{
    
    CGRect frame=self.frame;
    
    frame.size=jh_size;
    
    self.frame=frame;
    
}

-(void)setJh_origin:(CGPoint)jh_origin{
    
    CGRect frame=self.frame;
    
    frame.origin=jh_origin;
    
    self.frame=frame;
    
}

-(void)setJh_centerX:(CGFloat)jh_centerX{
    
    CGPoint center=self.center;
    
    center.x=jh_centerX;
    
    self.center=center;
    
}

-(void)setJh_centerY:(CGFloat)jh_centerY{
    CGPoint center=self.center;
    center.y=jh_centerY;
    
    self.center=center;
    
}


-(CGFloat)jh_width{
    
    return self.frame.size.width;
}

-(CGFloat)jh_height{
    
    return self.frame.size.height;
}

-(CGFloat)jh_x{
    
    return self.frame.origin.x;
}

-(CGFloat)jh_y{
    
    return self.frame.origin.y;
}

-(CGSize)jh_size{
    
    return self.frame.size;
}

-(CGPoint)jh_origin{
    
    return self.frame.origin;
}

-(CGFloat)jh_centerX{
    
    return self.center.x;
}

-(CGFloat)jh_centerY{
    
    return self.center.y;
}

@end
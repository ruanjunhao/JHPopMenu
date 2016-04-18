//
//  JHMenuButton.h
//  MenuDemo
//
//  Created by 徐仲平 on 16/4/18.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JHMenuClickBlock)();

@interface JHMenuButton : UIButton


+(instancetype)menuButtonTitle:(NSString *)title image:(UIImage *)image clickBlock:(JHMenuClickBlock)clickBlock;

@property (nonatomic,copy)JHMenuClickBlock clickBlock;


@end

//*********************************JHExtension***********************************//
@interface UIView (JHExtension)

@property (nonatomic,assign)CGFloat jh_width;

@property (nonatomic,assign)CGFloat jh_height;

@property (nonatomic,assign)CGFloat jh_x;

@property (nonatomic,assign)CGFloat jh_y;

@property (nonatomic,assign)CGSize jh_size;

@property (nonatomic,assign)CGPoint jh_origin;

@property (nonatomic,assign)CGFloat jh_centerX;

@property (nonatomic,assign)CGFloat jh_centerY;
@end
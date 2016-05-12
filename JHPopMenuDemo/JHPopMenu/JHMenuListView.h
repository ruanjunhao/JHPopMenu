//
//  JHMenuListView.h
//  MenuDemo
//
//  Created by 徐仲平 on 16/4/18.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHMenuButton.h"

@interface JHMenuListView : UIView

/** 所有的按钮 */
@property (nonatomic,strong)NSArray<JHMenuButton *> *menus;

/** 显示到某个View上 */
-(void)showOnTheView:(UIView *)view;

@end

//
//  UIScrollView+TSSCrollStatusBar.h
//  JiHeShi
//
//  Created by Dylan Chen on 2017/11/21.
//  Copyright © 2017年 JiHes. All rights reserved.
//  滚动的上边的状态条条 的分类

#import <UIKit/UIKit.h>
#import "TSScrollStatusBar.h"

@interface UIScrollView (TSSCrollStatusBar)

@property (strong, nonatomic) TSScrollStatusBar * ts_scrollStatusBar;

@end

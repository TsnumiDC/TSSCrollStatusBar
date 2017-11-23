//
//  UIScrollView+TSSCrollStatusBar.m
//  JiHeShi
//
//  Created by Dylan Chen on 2017/11/21.
//  Copyright © 2017年 JiHes. All rights reserved.
//

#import "UIScrollView+TSSCrollStatusBar.h"
#import <objc/runtime.h>

@implementation UIScrollView (TSSCrollStatusBar)

static const char TSSCrollStatusBarKey = '\2';

- (void)setTs_scrollStatusBar:(TSScrollStatusBar *)ts_scrollStatusBar{
    
    if (ts_scrollStatusBar != self.ts_scrollStatusBar) {
        [self.ts_scrollStatusBar removeFromSuperview];
        [self.superview insertSubview:ts_scrollStatusBar atIndex:0];
        [self.superview setNeedsLayout];
                
        [self willChangeValueForKey:@"ts_scrollStatusBar"]; // KVO
        objc_setAssociatedObject(self, &TSSCrollStatusBarKey,
                                 ts_scrollStatusBar, OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"ts_scrollStatusBar"]; // KVO
    }
    
}

- (TSScrollStatusBar *)ts_scrollStatusBar{
    
    return objc_getAssociatedObject(self, &TSSCrollStatusBarKey);
}

@end

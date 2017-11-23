//
//  TSScrollStatusBar.h
//  JiHeShi
//
//  Created by Dylan Chen on 2017/11/21.
//  Copyright © 2017年 JiHes. All rights reserved.
//  滚动的上边的状态条条

#import <UIKit/UIKit.h>

@interface TSScrollStatusBar : UIView

//调整Y坐标 这个Y坐标一般是坐标轴得位置
- (void)adjustWithIndexY:(CGFloat)indexY;
/**
 展示
 */
- (void)show;

/**
 展示

 @param autoHidden 是否自动隐藏
 @param animation NO就不判断autohidden   是否显示动画
 */
- (void)showWithAuthHidden:(BOOL)autoHidden andAnimation:(BOOL) animation;
//消失 isAnimation = YES 展示的时候animation = YES需要调用

/**
 消失
 展示的时候animation = YES需要调用

 @param animation 是否带动画
 */
- (void)dismissWithAnimation:(BOOL) animation;

/**
 修改文字 可能每次刷新文字是不一样的,在展示状态下不可以修改文字

 @param string 新的文字
 @return 返回修改成功还是失败
 */
- (BOOL)configWithString:(NSString *)string;

/**
 继续需求的,通用的初始化方法

 @param string 内容
 @return 返回创建好的控件
 */
+ (instancetype)scrollStatusBarWithString:(NSString *)string andIndexY:(CGFloat)indexY;

/**
 万能初始化方法

 @param frame 创建的frame 这里写的是消失时候的frame,比展示的高一点
 @param showTime 下滑动画时间
 @param stayTime 停留时间
 @param dismissTime 上滑动画时间
 @param backColor 背景色
 @param textColor 字体色
 @param alpha 背景透明度
 @param textFont 字体大小
 @param string 内容
 @return 返回创建好的控件
 */
- (instancetype)initWithFrame:(CGRect)frame
                  andShowTime:(CGFloat)showTime
                  andStayTime:(CGFloat)stayTime
               andDismissTime:(CGFloat)dismissTime
                 andBackColor:(UIColor *)backColor
                 andTextColor:(UIColor *)textColor
                     andAlpha:(CGFloat)alpha
                  andTextFont:(CGFloat)textFont
                    andString:(NSString *)string;
@end

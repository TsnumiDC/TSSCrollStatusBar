//
//  TSScrollStatusBar.m
//  JiHeShi
//
//  Created by Dylan Chen on 2017/11/21.
//  Copyright © 2017年 JiHes. All rights reserved.
//

#import "TSScrollStatusBar.h"

@interface TSScrollStatusBar(){
    
    CGFloat _showTime;//下滑时间
    CGFloat _stayTime;//停留时间
    CGFloat _dismissTime;//上滑时间
    
    UIColor * _backColor;//背景色
    UIColor * _textColor;//文字颜色

    CGFloat _backAlpha;//透明度
    CGFloat _textFont;//文字大小

    NSString * _string;//文字内容
    
//    CGRect _dismissFrame;//消失位置
//    CGRect _showFrame;//显示位置
    
//    BOOL _isShowing;//是否正在展示状态  初始化默认为NO, 在展示的时候变成YES, 展示结束后变成NO
}

@property (strong, nonatomic)UIView * animationBackView;//动画背景图
@property (strong, nonatomic)UIView * backView;//背景
@property (strong, nonatomic)UILabel * titleLabel;//标题

@end

@implementation TSScrollStatusBar

#pragma mark - Public
- (void)adjustWithIndexY:(CGFloat)indexY{
    
    //调整Y
    //_dismissFrame = CGRectMake(_dismissFrame.origin.x, _dismissFrame.origin.y + indexY, _dismissFrame.size.width, _dismissFrame.size.height);
    //_showFrame = CGRectMake(_showFrame.origin.x, _showFrame.origin.y + indexY, _showFrame.size.width, _showFrame.size.height);
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + indexY, self.frame.size.width, self.frame.size.height);
}

- (void)showWithString:(NSString *)string{
    
    [self configWithString:string];
    [self show];
}

- (BOOL)configWithString:(NSString *)string{
    
//    if (_isShowing) {
//        return NO;
//    }
    
    _string = string;
    //计算位置 重新计算高度
    CGFloat height = self.frame.size.height;
    
    if (string) {
        NSDictionary * dict=@{NSFontAttributeName:[UIFont systemFontOfSize:12]};//字体大小
        CGSize size=CGSizeMake([UIScreen mainScreen].bounds.size.width - 10,CGFLOAT_MAX);
        size=[string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
        height = size.height + 13;
    }
//    CGRect frame = CGRectMake(0, 0 - height, [UIScreen mainScreen].bounds.size.width, height);
//    _showFrame = CGRectMake(frame.origin.x, frame.origin.y + frame.size.height, frame.size.width, frame.size.height);
//    _dismissFrame = frame;
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
    
    self.titleLabel.text = _string?_string:@"";
    [self _layoutSubviews];
    
    return YES;
}

- (void)show{
    [self showWithAuthHidden:YES andAnimation:YES];
}

- (void)showWithAuthHidden:(BOOL)autoHidden andAnimation:(BOOL) animation{
    //展示
//    if (_isShowing) {
//        return;
//    }
//    _isShowing = YES;
    //停止所有动画
    [self.animationBackView.layer removeAllAnimations];
    //初始化位置
    self.animationBackView.frame = CGRectMake(self.bounds.origin.x,  -self.bounds.size.height , self.bounds.size.width, self.bounds.size.height);

    //执行动画
    [self.superview bringSubviewToFront:self];
    if (animation) {
        
        [UIView animateWithDuration:_showTime animations:^{
            
            //结束位置
            self.animationBackView.frame = self.bounds;
            
            self.alpha = 1;
            
        } completion:^(BOOL finished) {
            
            
            if (autoHidden && finished) {

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_stayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

                    [self dismissWithAnimation:YES];

                });
            }
            
        }];
    }else{
        
        //没有动画的时候,不做消失处理,不判断autohidden
        self.animationBackView.frame = self.bounds;
        self.alpha = 1;
    }
}

//移除
- (void)dismissWithAnimation:(BOOL)animation{
    
    if (animation) {
        [UIView animateWithDuration:_dismissTime animations:^{
            //消失位置
            self.animationBackView.frame = CGRectMake(self.bounds.origin.x,  -self.bounds.size.height , self.bounds.size.width, self.bounds.size.height);
            self.alpha = 0;
        } completion:^(BOOL finished) {
//            _isShowing = NO;
        }];
    }else{
        self.alpha = 0;
        self.animationBackView.frame = CGRectMake(self.bounds.origin.x,  -self.bounds.size.height , self.bounds.size.width, self.bounds.size.height);
//        _isShowing = NO;
    }
}

#pragma mark - Init

+ (instancetype)scrollStatusBarWithString:(NSString *)string{
    
    //根据string计算高度
    CGFloat height = 0.0;
    
    //计算高度
    if (string) {

        NSDictionary * dict=@{NSFontAttributeName:[UIFont systemFontOfSize:12]};//字体大小
        CGSize size=CGSizeMake([UIScreen mainScreen].bounds.size.width - 10,CGFLOAT_MAX);
        size=[string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
        height = size.height + 13;
    }
    
    TSScrollStatusBar * bar = [[self alloc]initWithFrame:CGRectMake(0, 0 , [UIScreen mainScreen].bounds.size.width, height)
                                             andShowTime:0.8
                                             andStayTime:2
                                          andDismissTime:0.8
                                            andBackColor:[UIColor orangeColor]
                                            andTextColor:[UIColor whiteColor]
                                                andAlpha:0.85
                                             andTextFont:12
                                               andString:string];
    
    return bar;
}

- (instancetype)initWithFrame:(CGRect)frame
                  andShowTime:(CGFloat)showTime
                  andStayTime:(CGFloat)stayTime
               andDismissTime:(CGFloat)dismissTime
                 andBackColor:(UIColor *)backColor
                 andTextColor:(UIColor *)textColor
                   andAlpha:(CGFloat)alpha
                  andTextFont:(CGFloat)textFont
                    andString:(NSString *)string{
    
    if (self = [super initWithFrame:frame]) {
//
//        _showFrame = CGRectMake(frame.origin.x, frame.origin.y + frame.size.height, frame.size.width, frame.size.height);
//        _dismissFrame = frame;
        self.alpha = 0;
        self.clipsToBounds = YES;
        
        _showTime = showTime;
        _stayTime = stayTime;
        _dismissTime = dismissTime;
        
        _backColor = backColor;
        _textColor = textColor;
        
        _backAlpha = alpha;
        _textFont = textFont;
        
        _string = string;
        
        [self configSubViews];
        [self _layoutSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

#pragma mark - Private
- (void)configSubViews{
    
    [self addSubview:self.animationBackView];
    [self.animationBackView addSubview:self.backView];
    [self.animationBackView addSubview:self.titleLabel];
    
    self.backView.backgroundColor = _backColor;
    self.backView.layer.opacity = _backAlpha;
    
    self.titleLabel.font = [UIFont systemFontOfSize:_textFont];
    self.titleLabel.textColor = _textColor;

    self.titleLabel.text = _string?_string:@"";
}

- (void)_layoutSubviews{
    
    //上7 下6
    self.animationBackView.frame = CGRectMake(self.bounds.origin.x,  -self.bounds.size.height , self.bounds.size.width, self.bounds.size.height);
    self.backView.frame = self.bounds;
    self.titleLabel.frame = CGRectMake(5, 7, [UIScreen mainScreen].bounds.size.width - 10 , self.bounds.size.height - 7 - 6);
}

#pragma mark - Lazy
- (UIView *)animationBackView{
    if (_animationBackView == nil) {
        _animationBackView = [UIView new];
        _animationBackView.backgroundColor = [UIColor clearColor];
    }
    return _animationBackView;
}

- (UIView *)backView{
    if (_backView == nil) {
        _backView = [UIView new];
    }
    return _backView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

#pragma mark - dealloc
- (void)dealloc{
    
}
@end


# TSSCrollStatusBar 是一个仿微博的下拉提示,大概效果如图

![效果gif](https://github.com/TsnumiDC/TSSCrollStatusBar/blob/master/Untitled.gif?raw=true)

### 0. 实现功能

通过分类加属性,给UIScrollView添加了属性ts_scrollStatusBar,来显示和微博下拉刷新类似的下拉提示效果

- 可以多行
- 可以动态切换文案
- 更多功能有待完善

### 1. 原理

通过给UIScrollView 写分类,在分类中添加属性,并实现 set 和 get 方法来给UIScrollView 添加了属性 :

```
@property (strong, nonatomic) TSScrollStatusBar * ts_scrollStatusBar;

```


### 2. 控件封装

TSScrollStatusBar 带有万能创建方法,展示,隐藏方法,切换文案方法

```
//万能初始化
- (instancetype)initWithFrame:(CGRect)frame
                  andShowTime:(CGFloat)showTime
                  andStayTime:(CGFloat)stayTime
               andDismissTime:(CGFloat)dismissTime
                 andBackColor:(UIColor *)backColor
                 andTextColor:(UIColor *)textColor
                     andAlpha:(CGFloat)alpha
                  andTextFont:(CGFloat)textFont
                    andString:(NSString *)string;
                    
//展示             
- (void)showWithAuthHidden:(BOOL)autoHidden andAnimation:(BOOL) animation;
//隐藏
- (void)dismissWithAnimation:(BOOL) animation;
//切换文案
- (BOOL)configWithString:(NSString *)string;
```

### 3. 更多功能正在完善中

- 比如加点击事件等...


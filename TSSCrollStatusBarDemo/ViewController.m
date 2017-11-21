//
//  ViewController.m
//  TSSCrollStatusBarDemo
//
//  Created by Dylan Chen on 2017/11/21.
//  Copyright © 2017年 Dylan Chen. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+TSSCrollStatusBar.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UITableView * tableView;
@property (strong, nonatomic)UIRefreshControl * refreshControl;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configSubView];
    
    [self layoutSubView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)configSubView{
    
    [self.view addSubview:self.tableView];
    
    
    _refreshControl = [[UIRefreshControl alloc] init];
    _refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [_refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:_refreshControl];
    [self.tableView sendSubviewToBack:_refreshControl];
    //[_refreshControl beginRefreshing];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //初始化
    self.tableView.ts_scrollStatusBar = [TSScrollStatusBar scrollStatusBarWithString:@"这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息这是一条提示信息"];
}

- (void)layoutSubView{
    
    self.tableView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
}

- (void)loadData{
    
    [_refreshControl endRefreshing];

    //展示
    [self.tableView.ts_scrollStatusBar show];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell ;
    cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"点击显示 click to show - %ld rows",indexPath.row+1];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0: {
            [self.tableView.ts_scrollStatusBar configWithString:@"111111111111111"];
            }
            break;
        case 1: {
            [self.tableView.ts_scrollStatusBar configWithString:@"2222222222222222222222222222222222222222222222222222222"];
        }
            break;
        case 2: {
            [self.tableView.ts_scrollStatusBar configWithString:@"33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333"];
        }
            break;
        case 3: {
            [self.tableView.ts_scrollStatusBar configWithString:@"4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444"];
        }
            break;
        case 4: {
            [self.tableView.ts_scrollStatusBar configWithString:@"5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555"];
        }
            break;
        case 5: {
            [self.tableView.ts_scrollStatusBar configWithString:@"555666655566666666666666666666666666666666666655566666666666666666666666666666666666655566666666666666666666666666666666666655566666666666666666666666666666666666655566666666666666666666666666666666666655566666666666666666666666666666666666655566666666666666666666666666666666666655566666666666666666666666666666666666655566666666666666666666666666666666666666666666666666666666666666666666"];
        }
            break;
        case 6: {
            [self.tableView.ts_scrollStatusBar configWithString:@"777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777"];
        }
            break;
        case 7: {
            [self.tableView.ts_scrollStatusBar configWithString:@"888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888"];
        }
            break;
            
        default:
            break;
    }
    
    
    [self.tableView.ts_scrollStatusBar show];

}
#pragma mark - Lazy
- (UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

@end

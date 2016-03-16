//
//  ViewController.m
//  半糖
//
//  Created by zyx on 16/3/14.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import "ViewController.h"
#import "AFNetWork.h"

@interface ViewController ()
{
    NSMutableArray *_dataSource;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
    AFNetWork *afNetWork = [[AFNetWork alloc] init];
    [afNetWork reach];
    
    
    _dataSource = [NSMutableArray array];
    
    [afNetWork getWithURL:@"http://open3.bantangapp.com/recommend/index" WithParmeters:@{@"app_installtime":@"1457339276.130753", @"app_versions":@"5.3.3", @"channel_name":@"appStore", @"client_id":@"bt_app_ios", @"client_secret":@"9c1e6634ce1c5098e056628cd66a17a5"}];
    
    [afNetWork setBlock:^(id info){
        
        NSLog(@"-------------------------------------------------info = %@", info);
        
        NSArray *array = info[@"data"][@"topic"];
        NSLog(@"-------------------------------------------------%@",array);
        
        
        for (int i = 0; i < array.count; i++) {
            [_dataSource addObject:array[i]];
        }
        
        //[self.tableView reloadData];
    }];
    



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

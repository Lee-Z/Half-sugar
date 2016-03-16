//
//  TableViewController.m
//  半糖
//
//  Created by zyx on 16/3/14.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "AFNetWork.h"
#import <UIImageView+WebCache.h>
#import <MJRefresh.h>  


#define CellIdentifier @"CellIdentifier"


@interface TableViewController ()
{
    NSMutableArray *_dataSource;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //self.tableView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 400);
     _dataSource = [NSMutableArray array];
    
    AFNetWork *afNetWork = [[AFNetWork alloc] init];
    [afNetWork reach];

    [afNetWork getWithURL:@"http://open3.bantangapp.com/recommend/index" WithParmeters:@{@"app_installtime":@"1457339276.130753", @"app_versions":@"5.3.3", @"channel_name":@"appStore", @"client_id":@"bt_app_ios", @"client_secret":@"9c1e6634ce1c5098e056628cd66a17a5", @"device_token":@"82ad17a64076610542e79180507d30587b0fa7636e8abcc0ece491fe6b8dccba", @"oauth_token":@"d6be233c50ccf25dfb687f4184de944b", @"os_versions":@"9.1", @"page":@"0" , @"pagesize":@"20"}];
    

    // 4.
    [afNetWork setBlock:^(id info){
        
       // NSLog(@"-------------------------------------------------info = %@", info);
        
        NSArray *array = info[@"data"][@"topic"];
       // NSLog(@"-------------------------------------------------array%@",array);
        
        
        for (int i = 0; i < array.count; i++) {
            [_dataSource addObject:array[i]];
        }
        [self.tableView reloadData];
    }];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CellIdentifier];
    
    
    // 定义一个刷新 下啦刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    self.tableView.mj_header = header;
}

// 下啦刷新
- (void)loadData {
    
    AFNetWork *afNetWork = [[AFNetWork alloc] init];
    [afNetWork reach];
    
    [afNetWork getWithURL:@"http://open3.bantangapp.com/recommend/index" WithParmeters:@{@"app_installtime":@"1457339276.130753", @"app_versions":@"5.3.3", @"channel_name":@"appStore", @"client_id":@"bt_app_ios", @"client_secret":@"9c1e6634ce1c5098e056628cd66a17a5", @"device_token":@"82ad17a64076610542e79180507d30587b0fa7636e8abcc0ece491fe6b8dccba", @"oauth_token":@"d6be233c50ccf25dfb687f4184de944b", @"os_versions":@"9.1", @"page":@"0" , @"pagesize":@"20"}];
    
    
    // 4.
    [afNetWork setBlock:^(id info){
        
        // info
       // NSLog(@"-------------------------------------------------info = %@", info);
        
        NSArray *array = info[@"data"][@"topic"];
       // NSLog(@"-------------------------------------------------%@",array);
        
        
        for (int i = 0; i < array.count; i++) {
            [_dataSource addObject:array[i]];
        }
        
        // 数据进行重载
        [self.tableView reloadData];
        // 数据请求成功 停止刷新
        [self.tableView.mj_header endRefreshing];
    }];
}


// 返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *dic = _dataSource[indexPath.row];
    
    cell.likesLabel.text = [NSString stringWithFormat:@"%@", dic[@"likes"]];
    cell.titleLabel.text = dic[@"tags"];
    [cell.likesButton setImage:[UIImage imageNamed:@"Heart_love_16px_1096413_easyicon.net"] forState:UIControlStateNormal];
    
    NSURL *url = dic[@"pic"];
    [cell.picImage sd_setImageWithURL:url];
    return cell;
}
 
 
// cell 的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}
 
 

 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

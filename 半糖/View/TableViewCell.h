//
//  TableViewCell.h
//  半糖
//
//  Created by zyx on 16/3/14.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *picImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *likesLabel;

@property (weak, nonatomic) IBOutlet UIButton *likesButton;

@end

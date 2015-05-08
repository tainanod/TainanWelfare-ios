//
//  TableCell.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/4/24.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *Icon;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Area;
@property (weak, nonatomic) IBOutlet UILabel *removing;

@end

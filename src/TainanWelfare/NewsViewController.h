//
//  NewsViewController.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/4/9.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSJSONSerialization+JsonDetail.h"
#import "AppDelegate.h"
#import "NewsCell.h"
#import "NewsData.h"
#import "InfoViewController.h"
@interface NewsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *NewsTable;

@end

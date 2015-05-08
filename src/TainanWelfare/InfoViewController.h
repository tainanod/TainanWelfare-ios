//
//  InfoViewController.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/5/11.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "NewsData.h"

@interface InfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UIWebView *webContent;
@property (readwrite)NewsData *News;
@end

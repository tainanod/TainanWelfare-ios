//
//  ViewController.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/3/25.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CareViewController.h"
#import "MedicalViewController.h"
//#import "IntimateViewController.h"
#import "pageState.h"
#import "AppDelegate.h"

@interface ViewController : UIViewController
//@property (weak, nonatomic) IBOutlet UIButton *InLookafter;
@property (weak, nonatomic) IBOutlet UIButton *Medical;
@property (weak, nonatomic) IBOutlet UIButton *Intimate;
@property (weak, nonatomic) IBOutlet UIButton *Care;
@property (weak, nonatomic) IBOutlet UIButton *News;

//-(NSString *)gateData:(NSString *)url;

@end

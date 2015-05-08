//
//  AppDelegate.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/3/25.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <sqlite3.h>
#import "pageState.h"
#import "NSJSONSerialization+JsonDetail.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>{
    sqlite3 *db;
}

-(sqlite3 *) getDB;
-(CLLocation *)getNowLocation;
-(NSMutableArray *)dbGetText:(NSString *)insertSQL :(int)count;
-(void)dbComm:(NSString *)SQLComm;
-(void)checkVer;
@property (strong, nonatomic) UIWindow *window;
@property (readwrite)NSInteger *changeType;
@property (readwrite)NSString *changeName;


@end

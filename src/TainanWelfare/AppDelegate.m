//
//  AppDelegate.m
//  TainanWelfare
//
//  Created by Alfredko on 2014/3/25.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import "AppDelegate.h"
#import <sqlite3.h>
#import <math.h>

@implementation AppDelegate{
    CLLocationManager *location;
    CLLocation *locationInfo;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //將DB複製到有權限的目錄
    NSFileManager *fm = [[NSFileManager alloc] init];
    NSString *sqlite = [[NSBundle mainBundle] pathForResource:@"welfaredb" ofType:@"sqlite"];
    
    NSString *tag = [NSString stringWithFormat:@"%@/Documents/welfaredb.sqlite",NSHomeDirectory()];
    
    //檢查目錄目前是否存在DB
    if(![fm fileExistsAtPath:tag]){
        [fm copyItemAtPath:sqlite toPath:tag error:nil];
    }
    
    //設定檔案不備份屬性
    NSURL *url = [NSURL fileURLWithPath:tag];
    NSError *error = nil;
    BOOL success = [url setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error:&error];
    if(success){
        NSLog(@"Success");
    }else{
        NSLog(@"Error: %@",error);
    }
    
    //與資料庫連線
    if(sqlite3_open([sqlite UTF8String], &db) != SQLITE_OK){
        db=nil;
        NSLog(@"DB連線失敗");
    }
    
    //Check DB Data
//    [self checkVer];
    
    //設定地理資訊
    location = [CLLocationManager new];
    location.delegate = self;
    locationInfo = [CLLocation new];
    //開起計算位置功能
    [location startUpdatingLocation];
    return YES;
}
-(CLLocation *)getNowLocation{
    return locationInfo;
}

-(sqlite3 *)getDB{
    return db;
}
-(NSMutableArray *)dbGetText:(NSString *)insertSQL :(int)count
{
    NSMutableArray *tmp=[[NSMutableArray alloc]init];

        const char *sqlStatement = [insertSQL UTF8String];
        sqlite3_stmt *statement;
        if( sqlite3_prepare_v2(db, sqlStatement, -1, &statement, NULL) == SQLITE_OK )
        {
//            if (sqlite3_step(statement) == SQLITE_ROW)
//            {
//                for(int i=0;i<count;i++)
//                {
//                    NSString *addressField = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, i)];
//                    [tmp addObject:addressField];
//                }
//            }
            NSMutableArray *tempArray = [NSMutableArray new];
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                for(int i = 0; i < sqlite3_column_count(statement);i++){
                    [tempArray addObject:[[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, i)]];
                }
                
                
                
                [tmp addObject:[[NSArray alloc]initWithArray:tempArray]];
                [tempArray removeAllObjects];
            }
            sqlite3_finalize(statement);
        }
        else
        {
            NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(db) );
        }

    return tmp;
}

-(void)dbComm:(NSString *)SQLComm
{
    
    const char *sqlStatement = [SQLComm UTF8String];
    sqlite3_stmt *statement;
    if( sqlite3_prepare_v2(db, sqlStatement, -1, &statement, NULL) == SQLITE_OK )
    {
        sqlite3_step(statement);
        sqlite3_finalize(statement);
    }
    else
    {
        NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(db) );
        NSLog( @"Error comm: %@", SQLComm );
    }
}



#pragma mark -- rank num
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    locationInfo = [locations objectAtIndex:0];
}

#pragma mark -- check DB ver
-(void)checkVer{
    NSString *seq,*version;
    NSString *CateUrl = @"http://demo2.geo.com.tw/TNOD/api/Category";
    NSArray *array = [NSJSONSerialization JSONObjectWithString:CateUrl options:0 error:nil];
    for (NSDictionary *p in array) {
        seq = [p objectForKey:@"SEQ"] ;
        version = [p objectForKey:@"VERSION"];
        
        NSString *select =[NSString stringWithFormat:@"select version from category where seq = %@", seq];
        NSMutableArray *ver = [self dbGetText:select :10];
        if(ver.count > 0){
            NSMutableArray *data = ver[0];
            if([data[0] integerValue] != [version integerValue]){
                [self updateLandmark:seq verson:version];
            }
        }
    }
    
}

-(void)updateLandmark:(NSString *)ID verson:(NSString *)newver{
    NSString *clean = [NSString stringWithFormat:@"delete from landmark where MARK_TYPE_SEQ = %@ ", ID];
    [self dbComm:clean];
    NSString *url = [NSString stringWithFormat:@"http://demo2.geo.com.tw/TNOD/api/Poi/%@", ID];
    NSArray *array = [NSJSONSerialization JSONObjectWithString:url options:0 error:nil];
    NSString *seq,*name,*address,*town,*longitude,*latitude,*phone,*score,*info;
    for (NSDictionary *p in array) {
        seq = [p objectForKey:@"SEQ"];
        name = [p objectForKey:@"NAME"];
        address = [p objectForKey:@"ADDRESS"];
        town = [p objectForKey:@"TOWN"];
        longitude = [p objectForKey:@"LONGITUDE"];
        latitude = [p objectForKey:@"LATITUDE"];
        phone = [p objectForKey:@"PHONE"];
        score = [p objectForKey:@"SCORE"];
        info = [p objectForKey:@"INFO"];
        NSString *insert = [NSString stringWithFormat:@"insert into LANDMARK (SEQ,NAME,TOWN,ADDRESS,PHONE,LONGITUDE,LATITUDE,SCORE,INFO,MARK_TYPE_SEQ ) VALUES ( '%@', '%@', '%@', '%@', '%@', %@, %@, '%@', \"%@\", %@) ", seq,name,town,address,phone,longitude,latitude,score,info,ID];
        [self dbComm:insert];
    }
    
    NSString *UpVer = [NSString stringWithFormat:@" update CATEGORY set VERSION = %@ where seq = %@ ",newver, ID];
    [self dbComm:UpVer];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    //預設關閉資料庫
    sqlite3_close(db);
    [location stopUpdatingLocation];
}

@end

//
//  IndexViewController.m
//  TainanWelfare
//
//  Created by Alfredko on 2014/4/21.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

sqlite3 *db;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    db = [delegate getDB];
//    [delegate checkVer];
//    [self checkVer];
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    CGFloat screenWidth = screenRect.size.width;
//    CGFloat screenHeight = screenRect.size.height;
//    

	// Do any additional setup after loading the view.
}

-(void)checkVer{
    NSString *seq,*version;
    NSString *CateUrl = @"http://demo2.geo.com.tw/TNOD/api/Category";
    NSArray *array = [NSJSONSerialization JSONObjectWithString:CateUrl options:0 error:nil];
    for (NSDictionary *p in array) {
         seq = [p objectForKey:@"SEQ"];
        version = [p objectForKey:@"VERSION"];
        
    }
    
}

-(NSMutableArray *)dbGet:(NSString  *)sql :(int)count{
    NSMutableArray *tmp=[[NSMutableArray alloc]init];
    const char *sqlStatement = [sql UTF8String];
    sqlite3_stmt *statement;
    if( sqlite3_prepare_v2(db, sqlStatement, -1, &statement, NULL) == SQLITE_OK )
    {
        if (sqlite3_step(statement) == SQLITE_ROW)
        {
            for(int i=0;i<count;i++)
            {
                NSString *addressField = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, i)];
                [tmp addObject:addressField];
            }
        }
    }
    else
    {
        NSLog( @"Failed from sqlite3. Error is:  %s", sqlite3_errmsg(db) );
    }
    // Finalize and close database.
    sqlite3_finalize(statement);
    return tmp;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

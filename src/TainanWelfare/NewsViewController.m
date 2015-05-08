//
//  NewsViewController.m
//  TainanWelfare
//
//  Created by Alfredko on 2014/4/9.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import "NewsViewController.h"


@interface NewsViewController ()

@end

@implementation NewsViewController
NSMutableArray *newslist;
NSMutableArray *Dblist;
AppDelegate *delegate;
NewsData *SelectNews;

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
	// Do any additional setup after loading the view.
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    if(newslist == nil){
        newslist = [NSMutableArray  new];
        Dblist = [NSMutableArray  new];
    }else{
        [newslist removeAllObjects];
        [Dblist removeAllObjects];
    }
    [self checkVer];
    [self setTitle:@"最新消息"];
    [self BuidTable];
    [self.NewsTable reloadData];
}

#pragma mark -- Nav Action
- (IBAction)reback:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- Update Data
-(void)checkVer{
    NSString *newsSql = @"select * from news order by RELEASE_TIME desc";
    Dblist = [delegate dbGetText:newsSql :10];
    NSString *CateUrl = @"http://demo2.geo.com.tw/tnod/api/rssnews";
    NSArray *array = [NSJSONSerialization JSONObjectWithString:CateUrl options:0 error:nil];
    
    if(array.count != Dblist.count){
        [delegate dbComm:@"delete from news"];

        NSString *seq,*title,*link,*description,*pub_Date;
        for (NSDictionary *p in array) {
            seq = [p objectForKey:@"ID"];
            title = [p objectForKey:@"TITLE"];
            link = [p objectForKey:@"LINK"];
            description = [p objectForKey:@"DESCRIPTION"];
            pub_Date = [p objectForKey:@"PUB_DATE"];
            NSString *insert = [NSString stringWithFormat:@"insert into news (SEQ,TITLE,CONTENT,RELEASE_TIME,EDIT_TIME,CREATOR,LINK) VALUES ('%@' ,'%@' ,'%@' ,'%@' ,'%@' ,'%@' ,'%@')", seq,title,description,pub_Date,pub_Date,@"TainanWebRss",link];
            [delegate dbComm:insert];
        }
        Dblist = [delegate dbGetText:newsSql :10];
    }
    
}

#pragma mark -- NewsData Bind
-(void)BuidTable{

    [newslist removeAllObjects];
//    NSString *newsSql = @"select * from news order by RELEASE_TIME desc";
//    Dblist = [delegate dbGetText:newsSql :10];
    
    for(int i = 0; i < [Dblist count]; i++){
        NewsData *news = [NewsData new];
        NSMutableArray *data = Dblist[i];
        //        [_nameList addObject:data[1]];
        //
        //        [_menutype addObject:[self imageName:data[9]]];
        //        [_Townlist addObject:data[2]];
//        news.rowid = [data[0] integerValue];
        news.seq = data[0];
        news.Title =data[1];
        news.Content = data[2];
        news.Release=data[3];
        news.Edit=data[4];
        news.Creator=data[5];
        news.Link=data[6];

        [newslist addObject:news];
    }

}


#pragma mark -- Table Data
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return newslist.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"NewsCell";

    NewsCell *cell = (NewsCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    long row = [indexPath row];
    NewsData *new = newslist[row];
    cell.timeLb.text = new.Release;
    cell.newsTitle.text = new.Title;
    
    return cell;//返回cell
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    SelectNews = newslist[indexPath.row];
//    
//}


#pragma mark -- push News
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InfoViewController *control = [segue destinationViewController];
    NSInteger seletIndex = [[self.NewsTable indexPathForSelectedRow] row];
    control.News = newslist[seletIndex];
}

@end

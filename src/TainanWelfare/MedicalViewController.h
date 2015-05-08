//
//  MedicalViewController.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/4/9.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"
#import "pageState.h"
#import "TableCell.h"
#import "mapInfo.h"
#import "Landmark.h"
#import "MyAnnotation.h"

@interface MedicalViewController : UIViewController <MKMapViewDelegate,UISearchBarDelegate,UITableViewDelegate>
{
    NSString *titleName;

}

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet MKMapView *maps;
@property (weak, nonatomic) IBOutlet UISearchBar *search;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *navChangbt;
@property (weak, nonatomic) IBOutlet UIView *toolview1;
@property (weak, nonatomic) IBOutlet UIView *toolview2;
@property (weak, nonatomic) IBOutlet UIView *toolview3;
@property (weak, nonatomic) IBOutlet UIView *InfoView;

@property (weak, nonatomic) IBOutlet UILabel *InfoTitle;
@property (weak, nonatomic) IBOutlet UILabel *InfoAddress;
@property (weak, nonatomic) IBOutlet UILabel *InfoNote;

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
//@property(strong,nonatomic)NSMutableArray * nameList;
//@property(strong,nonatomic)NSMutableArray * menutype;
//@property(strong,nonatomic)NSMutableArray * Townlist;
//@property(strong,nonatomic)NSMutableArray * ranklist;
@end

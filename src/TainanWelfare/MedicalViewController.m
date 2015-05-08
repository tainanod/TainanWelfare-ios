//
//  MedicalViewController.m
//  TainanWelfare
//
//  Created by Alfredko on 2014/4/9.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import "MedicalViewController.h"

@interface MedicalViewController ()

@end

@implementation MedicalViewController
{
//    NSMutableArray *listdata;
    NSMutableArray *mapData;
    Landmark *selectLand;
}
pageState *state;
AppDelegate *delegate;
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
    
    state = [pageState sendState];
//    _menutype = [NSMutableArray new];
//    _nameList = [NSMutableArray new];
//    _Townlist = [NSMutableArray new];
//    _ranklist = [NSMutableArray new];
    mapData = [NSMutableArray new];
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    //設定地理資訊
//    location = [CLLocationManager new];
//    location.delegate = self;
//    locationInfo = [CLLocation new];
//    //開起計算位置功能
//    [location startUpdatingLocation];
    
    self.maps.delegate = self;
    self.maps.hidden = YES;
    
    
    if([self.title isEqual:@"醫療"]){
        self.toolview2.hidden = YES;
        self.toolview3.hidden=YES;
        self.navBar.title =@"醫療";
    }
    else if([self.title isEqual:@"貼心"])
    {
        self.toolview3.hidden = YES;
        self.toolview1.hidden = YES;
        self.navBar.title =@"貼心";
    }else{
        self.toolview1.hidden = YES;
        self.toolview2.hidden = YES;
        self.navBar.title =@"照護";
    }
    
    [self UpdataData];


}


#pragma mark -- Nav Action
- (IBAction)reback:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)changState:(UIBarButtonItem *)sender {
    if([sender.title isEqual:@"地圖"])
    {
        sender.title = @"列表";
        self.table.hidden = YES;
        self.maps.hidden = NO;
    }else{
        sender.title = @"地圖";
        self.table.hidden = NO;
        self.maps.hidden= YES;
    }
    [self DataBuild];
    [self.table reloadData];
}

#pragma mark -- Button Action
- (IBAction)chang1:(id)sender {
    UIImage *btnImage;
    if(state.getType1){
        [state setType1:NO ];
        btnImage = [UIImage imageNamed:@"icon_01_hover.png"];
    }else{
        btnImage = ([UIImage imageNamed:@"icon_01.png"]);
        [state setType1:YES ];
    }
    
    [sender setImage:btnImage forState:UIControlStateNormal];
    if([self.search.text isEqual:@""]){
        [self UpdataData];
    }else{
        [self SearchData];
    }
    [self.table reloadData];
}

- (IBAction)chang2:(id)sender {
    UIImage *btnImage;
    if(state.getType2){
        [state setType2:NO ];
        btnImage = [UIImage imageNamed:@"icon_02_hover.png"];
    }else{
        btnImage = ([UIImage imageNamed:@"icon_02.png"]);
        [state setType2:YES ];
    }
    
    [sender setImage:btnImage forState:UIControlStateNormal];
    if([self.search.text isEqual:@""]){
        [self UpdataData];
    }else{
        [self SearchData];
    }
    [self.table reloadData];
}

- (IBAction)chang3:(id)sender {
    UIImage *btnImage;
    if(state.getType3){
        [state setType3:NO ];
        btnImage = [UIImage imageNamed:@"icon_03_hover.png"];
    }else{
        btnImage = ([UIImage imageNamed:@"icon_03.png"]);
        [state setType3:YES ];
    }
    
    [sender setImage:btnImage forState:UIControlStateNormal];
    if([self.search.text isEqual:@""]){
        [self UpdataData];
    }else{
        [self SearchData];
    }
    [self.table reloadData];
}

- (IBAction)chang4:(id)sender {
    UIImage *btnImage;
    if(state.getType4){
        [state setType4:NO ];
        btnImage = [UIImage imageNamed:@"icon_04_hover.png"];
    }else{
        btnImage = ([UIImage imageNamed:@"icon_04.png"]);
        [state setType4:YES ];
    }
    
    [sender setImage:btnImage forState:UIControlStateNormal];
    if([self.search.text isEqual:@""]){
        [self UpdataData];
    }else{
        [self SearchData];
    }
    [self.table reloadData];
}

- (IBAction)chang5:(id)sender {
    UIImage *btnImage;
    if(state.getType5){
        [state setType5:NO ];
        btnImage = [UIImage imageNamed:@"icon_05_hover.png"];
    }else{
        btnImage = ([UIImage imageNamed:@"icon_05.png"]);
        [state setType5:YES ];
    }
    
    [sender setImage:btnImage forState:UIControlStateNormal];
    if([self.search.text isEqual:@""]){
        [self UpdataData];
    }else{
        [self SearchData];
    }
    [self.table reloadData];
}

- (IBAction)chang6:(id)sender {
        UIImage *btnImage;
        if(state.getType6){
            [state setType6:NO ];
            btnImage = [UIImage imageNamed:@"icon_06_hover.png"];
        }else{
            btnImage = ([UIImage imageNamed:@"icon_06.png"]);
            [state setType6:YES ];
        }
    
    [sender setImage:btnImage forState:UIControlStateNormal];
    if([self.search.text isEqual:@""]){
        [self UpdataData];
    }else{
        [self SearchData];
    }
    [self.table reloadData];
}

- (IBAction)chang7:(id)sender {
    UIImage *btnImage;
    if(state.getType7){
        [state setType7:NO ];
        btnImage = [UIImage imageNamed:@"icon_07_hover.png"];
    }else{
        btnImage = ([UIImage imageNamed:@"icon_07.png"]);
        [state setType7:YES ];
    }
    [sender setImage:btnImage forState:UIControlStateNormal];
    if([self.search.text isEqual:@""]){
        [self UpdataData];
    }else{
        [self SearchData];
    }
    [self.table reloadData];
}

- (IBAction)chang8:(id)sender {
    UIImage *btnImage;
    if(state.getType8){
        [state setType8:NO ];
        btnImage = [UIImage imageNamed:@"icon_08_hover.png"];
    }else{
        btnImage = ([UIImage imageNamed:@"icon_08.png"]);
        [state setType8:YES ];
    }
    [sender setImage:btnImage forState:UIControlStateNormal];
    if([self.search.text isEqual:@""]){
        [self UpdataData];
    }else{
        [self SearchData];
    }
    [self.table reloadData];
}

- (IBAction)chang9:(id)sender {
    UIImage *btnImage;
    if(state.getType9){
        [state setType9:NO ];
        btnImage = [UIImage imageNamed:@"icon_09_hover.png"];
    }else{
        btnImage = ([UIImage imageNamed:@"icon_09.png"]);
        [state setType9:YES ];
    }
    [sender setImage:btnImage forState:UIControlStateNormal];
    if([self.search.text isEqual:@""]){
        [self UpdataData];
    }else{
        [self SearchData];
    }
    [self.table reloadData];
}

#pragma mark -- Search Action

//-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
//    [searchBar resignFirstResponder];
//}



-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    
}

//UISearchBar 變更搜尋數值時觸發
//-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
//{
//    if([searchText isEqual:@""] && searchBar.resignFirstResponder){
//        [searchBar resignFirstResponder];
//    }
//
//}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.text = nil;
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    [self UpdataData];
    [self.table reloadData];
}

//-(void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar{
//    [searchBar resignFirstResponder];
//}

//UISearchBar 搜索鍵觸發
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    [self SearchData];
    [self.table reloadData];
}

//UISearchBar 開啟輸入鍵盤時觸發
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
}


#pragma mark -- Update listData
-(void)UpdataData{
   
    NSString *type = [self getTypeSql];
    [state setData:[delegate dbGetText:type :10]];
    [self DataBuild];
}

-(void)SearchData{
    NSString *searchText = self.search.text;
    NSString *type = [self getTypeSql];
    type = [type stringByAppendingString:@" and (TOWN like '%"];
    type = [type stringByAppendingString:searchText];
    type = [type stringByAppendingString:@"%' or Name like '%"];
    type = [type stringByAppendingString:searchText];
    type = [type stringByAppendingString:@"%' or ADDRESS like '%"];
    type = [type stringByAppendingString:searchText];
    type = [type stringByAppendingString:@"%' or PHONE like '%"];
    type = [type stringByAppendingString:searchText];
    type = [type stringByAppendingString:@"%')"];
    [state setData:[delegate dbGetText:type :10]];
    [self DataBuild];

}

-(NSString *)getTypeSql{
    NSString *type = @"select * from LANDMARK where (mark_type_seq = 0 ";
    if([self.title isEqual:@"醫療"]){
        if(state.getType6){
            type = [type stringByAppendingString:@" or mark_type_seq  = 9"];
        }
        if(state.getType7){
            type = [type stringByAppendingString:@" or mark_type_seq  = 10"];
        }
        if(state.getType8){
            type = [type stringByAppendingString:@" or mark_type_seq  = 11"];
        }
        if(state.getType9){
            //        type = [NSString stringWithFormat:@"%@%@", type, @"or mark_type_seq  = 9"];
            type = [type stringByAppendingString:@" or mark_type_seq  = 12"];
        }
    }
    else if([self.title isEqual:@"貼心"])
    {
        if(state.getType1){
            type = [type stringByAppendingString:@" or mark_type_seq  = 4"];
        }
        if(state.getType2){
            type = [type stringByAppendingString:@" or mark_type_seq  = 5"];
        }
    }else{
        if(state.getType3){
            type = [type stringByAppendingString:@" or mark_type_seq  = 6"];
        }
        if(state.getType4){
            type = [type stringByAppendingString:@" or mark_type_seq  = 7"];
        }
        if(state.getType5){
            type = [type stringByAppendingString:@" or mark_type_seq  = 8"];
        }
    }
    type = [type stringByAppendingString:@")"];

    return type;
}

-(void)DataBuild{
    if([self.navChangbt.title isEqual:@"地圖"])
    {
        [self.maps removeAnnotations:self.maps.annotations];
        [self BuidTable];
    }else{
        [self BuidMaps];
    }


}

#pragma mark -- Map Data
-(void)BuidMaps{
    
    NSMutableArray *list = state.getData;
    [self.maps removeAnnotations:self.maps.annotations];

    MKCoordinateRegion regin = self.maps.region;
    regin.center.latitude=delegate.getNowLocation.coordinate.latitude;
    regin.center.longitude=delegate.getNowLocation.coordinate.longitude;
    regin.span.latitudeDelta=0.005;
    regin.span.longitudeDelta=0.005;
    [self.maps setRegion:regin animated:YES];
    
//    for(int i = 0; i < [list count]; i++){
//        MKPointAnnotation * point = [MKPointAnnotation new];
//        NSMutableArray *data = list[i];
//        point.coordinate = CLLocationCoordinate2DMake([data[6] doubleValue], [data[5] doubleValue]);
//        point.title = data[1];
//        point.subtitle = data[3];
//        [self.maps addAnnotation:point];
//        
//    }

    [self BuidLandData:list];
//    for(int i = 0; i < [mapData count]; i++){
//
//        MKPointAnnotation * point = [MKPointAnnotation new];
//        Landmark *data = mapData[i];
//        point.coordinate = CLLocationCoordinate2DMake(data.latitude, data.longitude);
//        point.title = data.Name;
//        
////        point.title = [NSString stringWithFormat:@"%li",(long)i];
//        point.subtitle = data.Address;
//        
//        [self.maps addAnnotation:point];
//        
//    }
    for(int i = 0; i < [mapData count]; i++){


        Landmark *data = mapData[i];
        MyAnnotation *point = [[MyAnnotation alloc] initWithLocation:CLLocationCoordinate2DMake(data.latitude, data.longitude) setTitle:data.Name setSubTitle:data.Address];
        point.tag = i;
        point.TypeID = data.mark_type_seq;
        
        [self.maps addAnnotation:point];
        
    }

}
-(void)BuidTable{
    NSMutableArray *list = state.getData;

    [self BuidLandData:list];
    //用distance 此數值為排序 功能
    NSSortDescriptor *sortdes = [[NSSortDescriptor alloc]initWithKey:@"distance" ascending:YES];
    NSArray *sortDescriptors =[NSArray arrayWithObject:sortdes];
    [mapData sortUsingDescriptors:sortDescriptors];
}

-(void) BuidLandData:(NSMutableArray *)list{
    [mapData removeAllObjects];
    CLLocation *tag;
    for(int i = 0; i < [list count]; i++){
        Landmark *land = [Landmark new];
        NSMutableArray *data = list[i];
        land.seq= data[0];
        land.Name=data[1];
        land.Town=data[2];
        land.Address=data[3];
        land.Phone=data[4];
        land.longitude=[data[5] doubleValue];
        land.latitude=[data[6] doubleValue];
        land.score=data[7];
        land.info=data[8];
        land.mark_type_seq=[data[9] intValue];
        
        tag = [[CLLocation alloc] initWithLatitude:[data[6] doubleValue] longitude:[data[5] doubleValue]];
        CLLocationDistance d = [delegate.getNowLocation distanceFromLocation:tag];
        land.distance = d / 1000;
        [mapData addObject:land];

    }
}

-(NSString *)imageName:(int)num{
    NSString *type = [NSString new];
    
    num = num - 3;
    //        if(type.length <2){
    //            type = [@"icon_0" stringByAppendingString:type];
    //        }else{
    //            type=[@"icon_" stringByAppendingString:type];
    //        }
    type = [NSString stringWithFormat:@"%li",(long)num];
    type = [@"icon_0" stringByAppendingString:type];
    type = [type stringByAppendingString:@".png"];
    return type;
}
//#pragma mark -- rank num
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
//    locationInfo = [locations objectAtIndex:0];
//}

#pragma map pin
//建立MapPin時會呼叫的函式
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    //判斷Pin如果是目前位置就不修改
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }

    MyAnnotation *point = (MyAnnotation *)annotation;

    MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc]
                                    initWithAnnotation:annotation reuseIdentifier:@"PinView"];
    
//    pinView.pinColor = MKPinAnnotationColorGreen;

    UIImage *image = [UIImage imageNamed:[self imageName:point.TypeID]];
    pinView.image = [self scaleImage:image toScale:0.3];
    image = nil;
    
//    //重設圖片大小與座標
//    imageView.frame = CGRectMake(0, 0, 3, 3);
//    
//    //設定註解內的圖片
//    pinView.rightCalloutAccessoryView = imageView;
//    imageView = nil;
    UIButton *button = [UIButton new];
    button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    button.tag = point.tag;
	[button addTarget:self action:@selector(checkButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    pinView.rightCalloutAccessoryView=button;

    //點擊時是否出現註解
    pinView.canShowCallout = YES;
    
    //是否可以被拖曳
    pinView.animatesDrop = NO;
    
    return pinView;
}

- (void)checkButtonTapped:(id)sender{
    UIButton* btn = (UIButton*)sender;
    NSInteger num = btn.tag;
    self.InfoView.hidden = NO;
    Landmark *data = mapData[num];
    selectLand = data;
    self.InfoTitle.text = selectLand.Name;
    self.InfoAddress.text = selectLand.Address;
    
}

#pragma mark -- Cell Action
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return _menutype.count;
        return mapData.count;
}
//cell內容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"TableCell";
    NSMutableArray *list;
    list = state.getData;
    TableCell *cell = (TableCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[TableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    long row = [indexPath row];
    
//    cell.Name.text = _nameList[row];
//    cell.Area.text = _Townlist[row];
//    cell.removing.text = _ranklist[row];
//
//    cell.Icon.image = [UIImage imageNamed:_menutype[row]];
    Landmark *land = mapData[row];

    cell.Name.text = land.Name;
    cell.Area.text = land.Town;
    cell.removing.text = [NSString stringWithFormat:@"%.2f", land.distance];
    
    cell.Icon.image = [UIImage imageNamed:[self imageName:land.mark_type_seq]];
    return cell;//返回cell
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.InfoView.hidden = NO;
    selectLand = mapData[indexPath.row];
    self.InfoTitle.text = selectLand.Name;
    self.InfoAddress.text = selectLand.Address;

}

#pragma mark -- scale Mage
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
    
     return scaledImage;
}

#pragma mark -- Info View
- (IBAction)cancel:(id)sender {
    self.InfoView.hidden = YES;
    selectLand = nil;
}

- (IBAction)CellTel:(id)sender {
    NSString *tell = selectLand.Phone;
    tell = [@"tel://" stringByAppendingString:tell];
    NSURL *url = [NSURL URLWithString:tell];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)viewDidAppear:(BOOL)animated
//{
//    [location stopUpdatingLocation];
//}
@end

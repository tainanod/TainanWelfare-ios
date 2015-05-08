//
//  ViewController.m
//  TainanWelfare
//
//  Created by Alfredko on 2014/3/25.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import "ViewController.h"
#import "MedicalViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSString *tnseguedate;
}
@synthesize Medical;
@synthesize Care;
@synthesize Intimate;

- (void)viewDidLoad
{

    [super viewDidLoad];
    
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [delegate checkVer];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -- Button Even
- (IBAction)changeImage:(UIButton *)sender {
    NSString *btName = sender.titleLabel.text;
    
    if([btName  isEqual: @"醫療"]){
        UIImage *btnImage1 = [UIImage imageNamed:@"mainbtn_01_hover.png"];
        [sender setImage:btnImage1 forState:UIControlStateNormal];
//        MedicalViewController *mvc = (MedicalViewController *)[[UIApplication sharedApplication] delegate];
//        mvc.type1 = true;
//        mvc.type2 = true;
//        mvc.type3 = true;
//        mvc.type4 = true;
    }else if([btName  isEqual: @"貼心"]){
        UIImage *btnImage1 = [UIImage imageNamed:@"mainbtn_02_hover.png"];
        [sender setImage:btnImage1 forState:UIControlStateNormal];
//        IntimateViewController *ivc = (IntimateViewController *)[[UIApplication sharedApplication] delegate];
//        *ivc.type1 = YES;
//        *ivc.type2 = YES;
    }else if([btName  isEqual: @"照護"]){
        UIImage *btnImage1 = [UIImage imageNamed:@"mainbtn_03_hover.png"];
        [sender setImage:btnImage1 forState:UIControlStateNormal];
//        CareViewController *cvc = (CareViewController *)[[UIApplication sharedApplication] delegate];
//        
//        *cvc.type1 = YES;
//        *cvc.type2 = YES;
//        *cvc.type3 = YES;
    }else{
        UIImage *btnImage1 = [UIImage imageNamed:@"mainbtn_04_hover.png"];
        [sender setImage:btnImage1 forState:UIControlStateNormal];
    }

    
}

- (IBAction)toSegue:(UIButton *)sender {
    NSString *btName = sender.titleLabel.text;
    if([btName  isEqual: @"醫療"]){
        UIImage *btnImage = [UIImage imageNamed:@"mainbtn_01.png"];
        [sender setImage:btnImage forState:UIControlStateNormal];

    }else if([btName  isEqual: @"貼心"]){
        UIImage *btnImage = [UIImage imageNamed:@"mainbtn_02.png"];
        [sender setImage:btnImage forState:UIControlStateNormal];

    }else if([btName  isEqual: @"照護"]){
        UIImage *btnImage = [UIImage imageNamed:@"mainbtn_03.png"];
        [sender setImage:btnImage forState:UIControlStateNormal];

    }else{
        UIImage *btnImage1 = [UIImage imageNamed:@"mainbtn_04.png"];
        [sender setImage:btnImage1 forState:UIControlStateNormal];
    }
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    pageState *state = [pageState sendState];
    
    MedicalViewController *control = [segue destinationViewController];

    if([[segue identifier] isEqualToString:@"MedicalViewSegue"]){
        [state clearType ];
        [state setType6:YES];
        [state setType7:YES];
        [state setType8:YES];
        [state setType9:YES];
        control.navBar.title = @"醫療";
        control.title =@"醫療";
        
    }else if([[segue identifier] isEqualToString:@"IntimateViewSegue"]){
        [state clearType ];
        [state setType1:YES];
        [state setType2:YES];
        control.navBar.title = @"貼心";
        control.title =@"貼心";

    }else if([[segue identifier] isEqualToString:@"CareViewSegue"]){
        [state clearType ];
        [state setType3:YES];
        [state setType4:YES];
        [state setType5:YES];
        control.navBar.title = @"照護";
        control.title =@"照護";
    }
    
//    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    
//    [state setData:[delegate dbGetText:type :5]];

}
@end

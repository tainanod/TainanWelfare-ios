//
//  MyAnnotation.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/6/11.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic) MKPinAnnotationColor pinColor;
@property (nonatomic) NSInteger tag;
@property (nonatomic) NSInteger TypeID;

-(id)initWithLocation:(CLLocationCoordinate2D)coord setTitle: (NSString *)aTitle setSubTitle:(NSString *)aSubTitle;
@end

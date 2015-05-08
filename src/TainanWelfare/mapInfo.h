//
//  mapInfo.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/5/19.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface mapInfo : NSObject<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic) UIImage *image;

-(id) initWithLocation:(CLLocationCoordinate2D) coord;
@end

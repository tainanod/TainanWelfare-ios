//
//  mapInfo.m
//  TainanWelfare
//
//  Created by Alfredko on 2014/5/19.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import "mapInfo.h"

@implementation mapInfo
@synthesize coordinate,image;

-(id)initWithLocation:(CLLocationCoordinate2D)coord
{
    self = [super init];
    if(self){
        coordinate = coord;
    }
    return self;
}
@end

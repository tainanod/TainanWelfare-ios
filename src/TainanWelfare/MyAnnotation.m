//
//  MyAnnotation.m
//  TainanWelfare
//
//  Created by Alfredko on 2014/6/11.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate, pinColor, title, subtitle;

-(id)initWithLocation:(CLLocationCoordinate2D)coord setTitle: (NSString *)aTitle setSubTitle:(NSString *)aSubTitle
{
    self = [super init];
    if (self) {
        coordinate = coord;
        title = aTitle;
        subtitle =aSubTitle;
    }
    return self;
}


@end

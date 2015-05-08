//
//  Landmark.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/5/19.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Landmark : NSObject

@property (readwrite)NSString *Seq;
@property (readwrite)NSString *Name;
@property (readwrite)NSString *Town;
@property (readwrite)NSString *Address;
@property (readwrite)NSString *Phone;
@property (readwrite)double longitude;
@property (readwrite)double latitude;
@property (readwrite)NSString  *score;
@property (readwrite)NSString *info;
@property (readwrite)int    mark_type_seq;
@property (readwrite)double distance;
@end

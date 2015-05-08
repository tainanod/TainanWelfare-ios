//
//  NewsData.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/6/9.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsData : NSObject

@property (readwrite)NSInteger rowid;
@property (readwrite)NSString *Seq;
@property (readwrite)NSString *Title;
@property (readwrite)NSString *Content;
@property (readwrite)NSString *Release;
@property (readwrite)NSString *Edit;
@property (readwrite)NSString *Creator;
@property (readwrite)NSString *Link;
@end

//
//  NSJSONSerialization+JsonDetail.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/4/21.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (JsonDetail)
+(id)JSONObjectWithString:(NSString*)urlPath
                  options:(NSJSONReadingOptions)options error:(NSError**)error;
@end

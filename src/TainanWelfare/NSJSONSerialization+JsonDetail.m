//
//  NSJSONSerialization+JsonDetail.m
//  TainanWelfare
//
//  Created by Alfredko on 2014/4/21.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import "NSJSONSerialization+JsonDetail.h"

@implementation NSJSONSerialization (JsonDetail)
+(id)JSONObjectWithString:(NSString*)urlPath options:(NSJSONReadingOptions)options error:(NSError**)error{
    NSString *data = @"";
    NSData *postData = [data dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:urlPath]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    [request setTimeoutInterval:7.0];
    NSURLResponse *response;

    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:error];
    NSString *str=[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSData *Data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:Data options:options  error:error];
}
@end

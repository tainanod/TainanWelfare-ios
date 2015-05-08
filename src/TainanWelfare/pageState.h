//
//  pageState.h
//  TainanWelfare
//
//  Created by Alfredko on 2014/4/24.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pageState : NSObject
{
    bool type1;
    bool type2;
    bool type3;
    bool type4;
    bool type5;
    bool type6;
    bool type7;
    bool type8;
    bool type9;

    NSMutableArray *list;
}
+(pageState *)sendState;
-(void)clearType;
-(void)setType4:(bool)type;
-(void)setType5:(bool)type;
-(void)setType6:(bool)type;
-(void)setType7:(bool)type;
-(void)setType8:(bool)type;
-(void)setType9:(bool)type;
-(void)setType1:(bool)type;
-(void)setType2:(bool)type;
-(void)setType3:(bool)type;
-(void)setData:(NSMutableArray *)array;
-(BOOL)getType4;
-(BOOL)getType5;
-(BOOL)getType6;
-(BOOL)getType7;
-(BOOL)getType8;
-(BOOL)getType9;
-(BOOL)getType1;
-(BOOL)getType2;
-(BOOL)getType3;
-(NSMutableArray *)getData;
@end

//
//  pageState.m
//  TainanWelfare
//
//  Created by Alfredko on 2014/4/24.
//  Copyright (c) 2014年 mofuntw. All rights reserved.
//

#import "pageState.h"

@implementation pageState
static pageState *_state = nil;
-(id)init{
    self = [super init];
    if(self){
        type4=true;
        type5=true;
        type6=true;
        type7=true;
        type8=true;
        type9=true;
        type1=true;
        type2=true;
        type3=true;
        list = [[NSMutableArray alloc]init];
    }
    return self;
}
+(pageState *)sendState{
    @synchronized([pageState class]){
        if(!_state)
            [[self alloc] init];
        return _state;
    }
}

+(id)alloc{
    @synchronized([pageState class]){
        NSAssert(_state == nil,@"Memory 已經配置");
        _state = [super alloc];
        return _state;
    }
}

-(void)clearType{
    type1 = NO;
    type2 = NO;
    type3 = NO;
    type4 = NO;
    type5 = NO;
    type6 = NO;
    type7 = NO;
    type8 = NO;
    type9 = NO;
}

-(void)setType4:(bool)type{
    type4 = type;
}
-(void)setType5:(bool)type{
    type5 = type;
}
-(void)setType6:(bool)type{
    type6 = type;
}
-(void)setType7:(bool)type{
    type7 = type;
}
-(void)setType8:(bool)type{
    type8 = type;
}
-(void)setType9:(bool)type{
    type9 = type;
}
-(void)setType1:(bool)type{
    type1 = type;
}
-(void)setType2:(bool)type{
    type2 = type;
}
-(void)setType3:(bool)type{
    type3 = type;
}
-(void)setData:(NSMutableArray *)array{
    list=array;
}
-(BOOL)getType4{
    return type4;
}
-(BOOL)getType5{
    return type5;
}
-(BOOL)getType6{
    return type6;
}
-(BOOL)getType7{
    return type7;
}
-(BOOL)getType8{
    return type8;
}
-(BOOL)getType9{
    return type9;
}
-(BOOL)getType1{
    return type1;
}
-(BOOL)getType2{
    return type2;
}
-(BOOL)getType3{
    return type3;
}
-(NSMutableArray *)getData{
    return list;
}
@end

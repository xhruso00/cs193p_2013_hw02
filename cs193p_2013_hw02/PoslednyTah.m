//
//  PoslednyTah.m
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/12/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "PoslednyTah.h"

@implementation PoslednyTah

- (id)initWithKarty:(NSArray *)karty stav:(NSString *)stav body:(int)body
{
    self = [super init];
    if (self) {
        _karty=karty;
        _stav=stav;
        _body=body;
    }
    return self;
}

@end

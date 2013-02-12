//
//  PoslednyTah.h
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/12/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PoslednyTah : NSObject
- (id)initWithKarty:(NSArray *)karty stav:(NSString *)stav body:(int)body;
@property (nonatomic,strong) NSArray *karty; //of Cards
@property (nonatomic) int body;
@property (nonatomic) NSString *stav;


@end

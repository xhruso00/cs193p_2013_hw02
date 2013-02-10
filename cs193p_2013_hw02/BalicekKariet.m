//
//  BalicekKariet.m
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/28/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "BalicekKariet.h"


@interface BalicekKariet()
@property (strong,nonatomic) NSMutableArray *karty;

@end

@implementation BalicekKariet
@synthesize karty = _karty;

- (NSMutableArray *) karty {
    
    if (_karty == nil)
        _karty = [[NSMutableArray alloc] init];
    
    return _karty;
}

- (void)pridajKartu:(Karta *)karta naVrch:(BOOL)naVrch {
    if(naVrch)
        [self.karty insertObject:karta atIndex:0];
    else
        [self.karty addObject:karta];
}

- (Karta *)potiahniNahodnuKartu {
    
    Karta *nahodnaKarta = nil;
    if(self.karty.count)
    {
        unsigned int nahodnyIndex= arc4random() % self.karty.count;
        nahodnaKarta = self.karty[nahodnyIndex];
        [self.karty removeObjectAtIndex:nahodnyIndex];
    }
    return nahodnaKarta;
    
}

@end

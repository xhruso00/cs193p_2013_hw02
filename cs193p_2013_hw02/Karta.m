//
//  Karta.m
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/28/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "Karta.h"

@implementation Karta

@synthesize obsah = _obsah;
@synthesize nehratelna = _nehratelna;
@synthesize otocenaCelnouStranou = _otocenaCelnouStranou;

- (int)porovnajSKartami:(NSArray *)karty {
    
    int skore = 0;
    
    for (Karta *karta in karty) {
        if ([karta.obsah isEqualToString:self.obsah])
            skore = 1;
    }
    
    return skore;
}

@end

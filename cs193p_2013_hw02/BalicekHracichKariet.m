//
//  BalicekHracichKariet.m
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/28/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "BalicekHracichKariet.h"
#import "HraciaKarta.h"


@implementation BalicekHracichKariet

- (id)init {

    self = [super init];
    
    if(self) {
        for (NSString *farba in [HraciaKarta platneFarby]) {
            for (int hodnota = 1; hodnota <= [HraciaKarta najvyssiaHodnota]; hodnota++) {
                HraciaKarta *karta = [[HraciaKarta alloc] init];
                karta.hodnota = hodnota;
                karta.farba = farba;
                karta.nehratelna = NO;
                karta.otocenaCelnouStranou = NO;
                [self pridajKartu:karta naVrch:YES];
            }
        }
    }
    return self;
}

@end

//
//  BalicekSkupinovychKariet.m
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/12/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "BalicekSkupinovychKariet.h"
#import "SkupinovaKarta.h"

@implementation BalicekSkupinovychKariet

- (id)init {
    
    self = [super init];
    
    if(self) {
        for (NSNumber *hodnota in [SkupinovaKarta vsetkyHodnoty]) {
            for (NSString *farba in [SkupinovaKarta platneFarby]) {
                for (NSString *tvar in [SkupinovaKarta platneTvary]) {
                    for (NSString *odtien in [SkupinovaKarta vsetkyOdtiene]) {
                        SkupinovaKarta *karta = [[SkupinovaKarta alloc] init];
                        karta.hodnota = [hodnota intValue];
                        karta.farba = farba;
                        karta.odtien = odtien;
                        karta.tvar = tvar;
                        karta.nehratelna = NO;
                        karta.otocenaCelnouStranou = NO;
                        [self pridajKartu:karta naVrch:YES];
                    
                    }
                }
            }
        }
    }
    return self;
}

@end

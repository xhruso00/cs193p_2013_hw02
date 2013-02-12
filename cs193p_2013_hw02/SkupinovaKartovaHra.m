//
//  SkupinovaKartovaHra.m
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/12/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "SkupinovaKartovaHra.h"
#import "PoslednyTah.h"

@interface SkupinovaKartovaHra()
@property (readwrite,nonatomic) int skore;
@property (strong,nonatomic) NSMutableArray *karty;
@property (nonatomic,strong,readwrite) NSMutableArray *poslednyTah;
@end

@implementation SkupinovaKartovaHra

- (NSMutableArray *)poslednyTah {
    if (!_poslednyTah) _poslednyTah = [[NSMutableArray alloc]init];
    return _poslednyTah;
}


- (NSMutableArray *)karty {
    if (!_karty) _karty = [[NSMutableArray alloc] init];
    return _karty;
}

- (id)initWithPocetKariet:(NSUInteger)pocetKariet pouzitimBalickahKariet:(BalicekKariet *) balicek{
    self = [super init];
    if (self) {
        for (int i = 0; i < pocetKariet; i++) {
            Karta *karta = [balicek potiahniNahodnuKartu];
            self.karty[i] = karta;
        }
        self.pocetKarietNaZhodu = 3;
    }
    
    return  self;
}

#define POROVNACI_BONUS 4
#define TREST_ZA_NEZHODU 2
#define CENA_ZA_OTOCENIE 1

- (void)otocKartuNaIndexe:(NSUInteger)index {
    Karta *karta = [self kartaNaIndexe:index];
    if ( karta && !karta.nehratelna) {
        if (!karta.otocenaCelnouStranou) {
            NSMutableArray *otoceneKarty = [[NSMutableArray alloc] init];
            for (Karta *inaKarta in self.karty) {
                if (inaKarta.otocenaCelnouStranou &&
                    !inaKarta.nehratelna &&
                    ![karta isEqual:inaKarta]) {
                    [otoceneKarty addObject:inaKarta];
                    if ([otoceneKarty count]+1 == self.pocetKarietNaZhodu)
                        break;
                }
            }
            if ([otoceneKarty count]+1 == self.pocetKarietNaZhodu) {
                int porovnacieSkore = [karta porovnajSKartami:otoceneKarty];
                if(porovnacieSkore) {
                    karta.nehratelna = YES;
                    for (Karta *inaKarta in otoceneKarty)
                        inaKarta.nehratelna = YES;
                    self.skore += porovnacieSkore * POROVNACI_BONUS;
                    NSArray *karty = [otoceneKarty arrayByAddingObject:karta];
                    [self.poslednyTah addObject:[[PoslednyTah alloc] initWithKarty:karty
                                                                              stav:@"ZHODA"
                                                                              body:porovnacieSkore * POROVNACI_BONUS]];
                }
                else {
                    for (Karta *inaKarta in otoceneKarty)
                        inaKarta.otocenaCelnouStranou = NO;
                    self.skore -= TREST_ZA_NEZHODU;
                    NSArray *karty = [otoceneKarty arrayByAddingObject:karta];
                    [self.poslednyTah addObject:[[PoslednyTah alloc] initWithKarty:karty
                                                                              stav:@"NEZHODA"
                                                                              body:-TREST_ZA_NEZHODU]];
                    
                }
            }
            else {
            
                self.skore -= CENA_ZA_OTOCENIE;
                [self.poslednyTah addObject:[[PoslednyTah alloc] initWithKarty:@[karta]
                                                                          stav:@"OTOCENIE"
                                                                          body:-CENA_ZA_OTOCENIE]];
            }
        }
        karta.otocenaCelnouStranou = !karta.otocenaCelnouStranou;
    }
}

- (Karta *)kartaNaIndexe:(NSUInteger)index {
    return (index < [self.karty count]) ? self.karty[index] : nil;
}

@end

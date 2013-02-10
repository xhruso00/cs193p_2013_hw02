//
//  PorovnavaciaKartovaHra.m
//  cs193p_2013_hw01
//
//  Created by Marek Hrušovský on 2/4/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "PorovnavaciaKartovaHra.h"

@interface PorovnavaciaKartovaHra()
@property (readwrite,nonatomic) int skore;
@property (strong,nonatomic) NSMutableArray *karty;
@property (strong,nonatomic,readwrite) NSString *vysledokPoslednehoOtocenia;

@end

@implementation PorovnavaciaKartovaHra

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
        self.pocetKarietNaZhodu = 2;
    }
    
    return  self;
}

#define POROVNACI_BONUS 4
#define TREST_ZA_NEZHODU 2
#define CENA_ZA_OTOCENIE 1

- (void)otocKartuNaIndexe:(NSUInteger)index {
    Karta *karta = [self kartaNaIndexe:index];
    self.vysledokPoslednehoOtocenia = @"";
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
                    if (self.pocetKarietNaZhodu == 2) {
                        self.vysledokPoslednehoOtocenia = [NSString stringWithFormat:@"Zhoda %@ a %@ za %d body.",karta.obsah,((Karta *)otoceneKarty[0]).obsah, porovnacieSkore * POROVNACI_BONUS];
                    }
                    else {
                        self.vysledokPoslednehoOtocenia = [NSString stringWithFormat:@"Zhoda %@ a %@ a %@ za %d body.",karta.obsah,((Karta *)otoceneKarty[0]).obsah, ((Karta *)otoceneKarty[1]).obsah, porovnacieSkore * POROVNACI_BONUS];
                    }
                }
                else {
                    for (Karta *inaKarta in otoceneKarty)
                        inaKarta.otocenaCelnouStranou = NO;
                    self.skore -= TREST_ZA_NEZHODU;
                    if (self.pocetKarietNaZhodu == 2) {
                        self.vysledokPoslednehoOtocenia = [NSString stringWithFormat:@"%@ a %@ sa nezhoduju. %d trestne body",karta.obsah,((Karta *)otoceneKarty[0]).obsah, TREST_ZA_NEZHODU];
                    }
                    else {
                        self.vysledokPoslednehoOtocenia = [NSString stringWithFormat:@"%@ a %@ a %@ sa nezhoduju. %d trestne body",karta.obsah,((Karta *)otoceneKarty[0]).obsah, ((Karta *)otoceneKarty[1]).obsah, TREST_ZA_NEZHODU];
                    }

                }
            }
        
        
            self.skore -= CENA_ZA_OTOCENIE;
            if(![self.vysledokPoslednehoOtocenia length])
                self.vysledokPoslednehoOtocenia = [NSString stringWithFormat:@"Otocil si %@",karta.obsah];
        }
        karta.otocenaCelnouStranou = !karta.otocenaCelnouStranou;
    }
}

- (Karta *)kartaNaIndexe:(NSUInteger)index {
    return (index < [self.karty count]) ? self.karty[index] : nil;
}
@end

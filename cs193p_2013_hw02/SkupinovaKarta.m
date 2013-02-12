//
//  SkupinovaKarta.m
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/12/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "SkupinovaKarta.h"

@interface SkupinovaKarta ()

@end

@implementation SkupinovaKarta

- (NSString *)obsah {
    return [NSString stringWithFormat:@"%d %@ %@ %@",self.hodnota,self.tvar,self.farba,self.odtien];
}

+ (NSArray *)platneFarby {
    return  @[@"R", @"G", @"B"];
}

+ (NSArray *)platneTvary {
    return @[@"▲",@"●",@"■"];
}

+ (NSArray *)vsetkyOdtiene {
    return @[@"solid", @"striped", @"open"];
}


+ (NSArray *)vsetkyHodnoty {
    return @[@(1),@(2),@(3)];
}


- (int)porovnajSKartami:(NSArray *)ineKarty {
    
    int skore = 0;
    if ([ineKarty count] == 2) {
        SkupinovaKarta *inaKarta1 = ineKarty[0];
        SkupinovaKarta *inaKarta2 = ineKarty[1];
        if ([inaKarta1.farba isEqualToString:self.farba] &&
            [inaKarta2.farba isEqualToString:self.farba])
            skore = 6;
        else if (inaKarta1.hodnota == self.hodnota &&
                 inaKarta2.hodnota == self.hodnota)
            skore = 6;
        else if ([inaKarta1.tvar isEqualToString:self.tvar] &&
                 [inaKarta2.tvar isEqualToString:self.tvar])
            skore = 6;
        else if ([inaKarta1.odtien isEqualToString: self.odtien] &&
                 [inaKarta2.odtien isEqualToString: self.odtien ])
            skore = 6;
        else if (![inaKarta1.farba isEqualToString:self.farba] &&
                ![inaKarta2.farba isEqualToString:self.farba])
            skore = 6;
        else if (inaKarta1.hodnota != self.hodnota &&
                 inaKarta2.hodnota != self.hodnota)
            skore = 6;
        else if (![inaKarta1.tvar isEqualToString:self.tvar] &&
                 ![inaKarta2.tvar isEqualToString:self.tvar])
            skore = 6;
        else if (![inaKarta1.odtien isEqualToString: self.odtien] &&
                 ![inaKarta2.odtien isEqualToString: self.odtien ])
            skore = 6;
    }
    return skore;
}

- (void)nastavFarbu:(NSString *)farba {
    if ([[SkupinovaKarta platneFarby] containsObject:farba])
        _farba = farba;
}

- (void)nastavTvar:(NSString *)tvar {
    if ([[SkupinovaKarta platneTvary] containsObject:tvar])
        _tvar = tvar;
}

- (void)nastavOdtien:(NSString *)odtien {
    if ([[SkupinovaKarta vsetkyOdtiene] containsObject:odtien])
        _odtien = odtien;
}

- (void)nastavHodnotu:(int)hodnota {
    if([[SkupinovaKarta vsetkyHodnoty] containsObject:@(hodnota)])
        _hodnota = hodnota;
}

@end

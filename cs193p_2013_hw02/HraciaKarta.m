//
//  HraciaKarta.m
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/28/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "HraciaKarta.h"

@implementation HraciaKarta
@synthesize farba = _farba;
@synthesize hodnota = _hodnota;

- (NSString *)obsah {
    NSArray *vsetkyHodnoty = [HraciaKarta vsetkyHodnoty];
    return [vsetkyHodnoty[self.hodnota] stringByAppendingString:self.farba];
}

+(NSArray *) platneFarby {
    return @[@"♥",@"♦",@"♣",@"♠"];
}

- (NSString *)farba {
    return _farba ? _farba: @"?";
}

+ (NSArray *)vsetkyHodnoty {
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (int)porovnajSKartami:(NSArray *)ineKarty {
    
    int skore = 0;
    
    if ([ineKarty count] == 1) {
        HraciaKarta *inaKarta = [ineKarty lastObject];
        if ([inaKarta.farba isEqualToString:self.farba])
            skore = 1;
        else if (inaKarta.hodnota == self.hodnota)
            skore = 4;
    }
    
    if ([ineKarty count] == 2) {
        HraciaKarta *inaKarta1 = ineKarty[0];
        HraciaKarta *inaKarta2 = ineKarty[1];
        if ([inaKarta1.farba isEqualToString:self.farba] &&
            [inaKarta2.farba isEqualToString:self.farba])
            skore = 3;
        else if (inaKarta1.hodnota == self.hodnota &&
                 inaKarta2.hodnota == self.hodnota)
            skore = 6;
    }
    
    return skore;
}

- (void)nastavFarbu:(NSString *)farba {
    if ([[HraciaKarta platneFarby] containsObject:farba])
        _farba = farba;
}

+ (int) najvyssiaHodnota {
    return [HraciaKarta vsetkyHodnoty].count - 1;
}

- (void)nastavHodnotu:(int)hodnota {
    if(hodnota <= [HraciaKarta najvyssiaHodnota])
        self.hodnota = hodnota;
}

@end

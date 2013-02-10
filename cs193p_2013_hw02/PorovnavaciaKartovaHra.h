//
//  PorovnavaciaKartovaHra.h
//  cs193p_2013_hw01
//
//  Created by Marek Hrušovský on 2/4/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Karta.h"
#import "BalicekKariet.h"

@interface PorovnavaciaKartovaHra : NSObject

@property (readonly,nonatomic) int skore;
@property (strong,nonatomic,readonly) NSString *vysledokPoslednehoOtocenia;
@property (nonatomic)int pocetKarietNaZhodu;

- (id)initWithPocetKariet:(NSUInteger)pocetKariet
   pouzitimBalickahKariet:(BalicekKariet *) balicek;
- (void)otocKartuNaIndexe:(NSUInteger)index;
- (Karta *)kartaNaIndexe:(NSUInteger)index;

@end

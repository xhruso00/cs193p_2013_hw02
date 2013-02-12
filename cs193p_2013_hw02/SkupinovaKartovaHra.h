//
//  SkupinovaKartovaHra.h
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/12/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Karta.h"
#import "BalicekKariet.h"

@interface SkupinovaKartovaHra : NSObject

@property (readonly,nonatomic) int skore;
@property (nonatomic,strong,readonly) NSMutableArray *poslednyTah;
@property (nonatomic)int pocetKarietNaZhodu;

- (id)initWithPocetKariet:(NSUInteger)pocetKariet
   pouzitimBalickahKariet:(BalicekKariet *) balicek;
- (void)otocKartuNaIndexe:(NSUInteger)index;
- (Karta *)kartaNaIndexe:(NSUInteger)index;


@end

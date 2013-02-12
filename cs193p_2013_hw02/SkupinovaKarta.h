//
//  SkupinovaKarta.h
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/12/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "Karta.h"

@interface SkupinovaKarta : Karta

+ (NSArray *)platneFarby;
+ (NSArray *)platneTvary;
+ (NSArray *)vsetkyOdtiene;
+ (NSArray *)vsetkyHodnoty;
    
@property (nonatomic,setter = nastavHodnotu:) int hodnota;
@property (nonatomic,setter = nastavOdtien:) NSString *odtien;
@property (nonatomic,setter = nastavFarbu:) NSString *farba;
@property (nonatomic,copy,setter = nastavTvar:) NSString *tvar;

@end

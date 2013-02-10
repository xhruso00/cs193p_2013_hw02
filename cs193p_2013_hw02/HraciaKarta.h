//
//  HraciaKarta.h
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/28/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "Karta.h"

@interface HraciaKarta : Karta {
    NSString  *_farba;
    int _hodnota;
}

@property (strong,nonatomic,setter = nastavFarbu:) NSString* farba;
@property (nonatomic) int hodnota;

+(NSArray *) platneFarby;
+(int) najvyssiaHodnota;

@end

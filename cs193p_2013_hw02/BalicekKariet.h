//
//  BalicekKariet.h
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/28/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Karta.h"

@interface BalicekKariet : NSObject

- (void)pridajKartu:(Karta *)karta naVrch:(BOOL)naVrch;
- (Karta *)potiahniNahodnuKartu;

@end

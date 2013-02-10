//
//  Karta.h
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/28/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Karta : NSObject {
    NSString *_obsah;
    
}

@property (strong,nonatomic) NSString *obsah;
@property (nonatomic) BOOL nehratelna;
@property (nonatomic) BOOL otocenaCelnouStranou;

- (int)porovnajSKartami:(NSArray *)ineKarty;

@end

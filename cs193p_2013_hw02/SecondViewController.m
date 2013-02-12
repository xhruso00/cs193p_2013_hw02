//
//  SecondViewController.m
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/11/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "SecondViewController.h"
#import "PoslednyTah.h"

@interface SecondViewController()

@property (weak, nonatomic) IBOutlet UILabel *pocetOtoceniPopisok;
@property (nonatomic) int pocetOtoceni;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tlacitkaKariet;
@property (weak, nonatomic) IBOutlet UILabel *skorePopisok;
@property (weak, nonatomic) IBOutlet UILabel *poslednyTahPopisok;
@property (strong,nonatomic) SkupinovaKartovaHra *hra;
@end



@implementation SecondViewController

- (IBAction)novaHra:(UIButton *)sender {
    self.skorePopisok.text = @"Skore: 0";
    self.pocetOtoceniPopisok.text = @"Pocet otoceni: 0";
    self.pocetOtoceni = 0;
    self.poslednyTahPopisok.text = @"";
    for(UIButton *tlacitko in self.tlacitkaKariet) {
        tlacitko.enabled = YES;
        tlacitko.alpha = 1.0;
        tlacitko.selected = NO;
    }
    _hra = nil;
    [self obnovUI];
}

- (SkupinovaKartovaHra *)hra {
    if(!_hra) _hra = [[SkupinovaKartovaHra alloc] initWithPocetKariet:[self.tlacitkaKariet count]
                                                  pouzitimBalickahKariet:[[BalicekSkupinovychKariet alloc] init]];
    return _hra;
}

- (void)obnovUI {
    for (UIButton *tlacitko in self.tlacitkaKariet) {
        Karta *karta = [self.hra kartaNaIndexe:[self.tlacitkaKariet indexOfObject:tlacitko]];
        [tlacitko setTitle:@"x" forState:UIControlStateNormal];
        [tlacitko setAttributedTitle:[[self class] attributedstringForCard:(SkupinovaKarta *)karta] forState:UIControlStateSelected];
        [tlacitko setTitle:karta.obsah forState:UIControlStateSelected | UIControlStateDisabled];
        tlacitko.selected = karta.otocenaCelnouStranou;
        //tlacitko.enabled = !karta.hratelna;
        tlacitko.alpha = (karta.nehratelna ? 0.3 : 1.0);
        self.poslednyTahPopisok.attributedText = [self popisokPrePoslednyTah:[self.hra.poslednyTah lastObject]];
    }
}
//TODO attributed string
- (NSAttributedString *)popisokPrePoslednyTah:(PoslednyTah *)tah {
    if (!tah) {
        return nil;
    }
    NSMutableAttributedString *popisok = [[NSMutableAttributedString alloc] init];
    [popisok  appendAttributedString:[[NSAttributedString alloc] initWithString:tah.stav]];
    [popisok  appendAttributedString:[[NSAttributedString alloc] initWithString:@" : "]];
    for (Karta *karta in tah.karty){
        [popisok appendAttributedString:[[self class] attributedstringForCard:(SkupinovaKarta *)karta]];
        [popisok  appendAttributedString:[[NSAttributedString alloc] initWithString:@" , "]];
    }
    [popisok  appendAttributedString:[[NSAttributedString alloc] initWithString:@" za "]];
    [popisok  appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", tah.body]]];
    [popisok  appendAttributedString:[[NSAttributedString alloc] initWithString:@" body "]];
    return [[NSAttributedString alloc] initWithAttributedString:popisok];
}


+ (NSMutableAttributedString *)attributedstringForCard:(SkupinovaKarta *)karta {
    
    UIColor *farba;
    
    NSString *numberAndSymbolstring = [[NSString alloc] init];
    numberAndSymbolstring = [numberAndSymbolstring stringByPaddingToLength:karta.hodnota
                                                                withString:karta.tvar
                                                           startingAtIndex:0];
    
    NSMutableAttributedString *obsahKarty = [[NSMutableAttributedString alloc] initWithString:numberAndSymbolstring];
    NSRange rozsah = NSMakeRange(0, [obsahKarty length]);
    
    if ([karta.farba isEqualToString:@"R"])
    {
        farba = [UIColor redColor];
    }
    else if ([karta.farba isEqualToString:@"G"])
    {
        farba = [UIColor greenColor];
    }
    else if ([karta.farba isEqualToString:@"B"])
    {
        farba = [UIColor blueColor];
    }
    
    
    //shading
    if ([karta.odtien isEqualToString:@"solid"])
    {
        farba = [farba colorWithAlphaComponent:1.0f];
        [obsahKarty addAttribute:NSForegroundColorAttributeName
                           value:farba
                           range:rozsah];
    }
    else if ([karta.odtien isEqualToString:@"striped"])
    {
        farba = [farba colorWithAlphaComponent:0.3f];
        [obsahKarty addAttribute:NSForegroundColorAttributeName
                           value:farba
                           range:rozsah];
    }
    else if ([karta.odtien isEqualToString:@"open"])
    {
        [obsahKarty addAttribute:NSForegroundColorAttributeName
                                value:[UIColor clearColor]
                                range:rozsah];
        [obsahKarty addAttribute:NSStrokeColorAttributeName
                                value:farba
                                range:rozsah];
        [obsahKarty addAttribute:NSStrokeWidthAttributeName
                                value:@3.0f
                                range:rozsah];
    }
    
    
    return obsahKarty;
}


- (void)setTlacitkaKariet:(NSArray *)tlacitkaKariet {
    _tlacitkaKariet = tlacitkaKariet;
    [self obnovUI];
}


- (IBAction)otocKartu:(UIButton *)tlacitko {
    tlacitko.selected = !tlacitko.selected;
    [self.hra otocKartuNaIndexe:[self.tlacitkaKariet indexOfObject:tlacitko]];
    self.pocetOtoceni++;
    
    [self obnovUI];
    self.skorePopisok.text = [NSString stringWithFormat:@"Skore: %d",self.hra.skore];
}



-(void)setPocetOtoceni:(int)pocetOtoceni {
    _pocetOtoceni = pocetOtoceni;
    self.pocetOtoceniPopisok.text = [NSString stringWithFormat:@"Pocet otoceni: %d",self.pocetOtoceni];
}


@end

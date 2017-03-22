//
//  Ginasio.m
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Ginasio.h"

@implementation Ginasio

- (instancetype)initWithNome: (NSString*)newNome
{
    self = [super init];
    if (self) {
        self.nome = newNome;
    }
    return self;
}

@synthesize nome =_nome;
@synthesize jogador=_jogador;

-(void)mudaJogadorLider:(Jogador *)lider{
    self.jogador = lider;
}


@end

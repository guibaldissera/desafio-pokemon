//
//  Ginasio.m
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Ginasio.h"

@implementation Ginasio

- (instancetype)initWithNome: (NSString*)newNome Jogador:(Jogador*)newJogador
{
    self = [super init];
    if (self) {
        self.nome = newNome;
        self.jogador = newJogador;
    }
    return self;
}

@synthesize nome =_nome;
@synthesize jogador=_jogador;


//Troca o lider do ginasio
-(void)mudaJogadorLider:(Jogador *)lider{
    self.jogador = lider;
}


@end

//
//  Ginasio.m
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Ginasio.h"

@implementation Ginasio


@synthesize nome =_nome;
@synthesize jogador=_jogador;

#pragma mark - Constructor
- (instancetype)initWithNome: (NSString*)newNome Jogador:(Jogador*)newJogador
{
    self = [super init];
    if (self) {
        _nome = newNome;
        self.jogador = newJogador;
    }
    return self;
}

#pragma mark - Other Methods

//Troca o lider do ginasio
-(void)mudaJogadorLider:(Jogador *)lider{
    self.jogador = lider;
}


@end

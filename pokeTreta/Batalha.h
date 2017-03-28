//
//  Batalha.h
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ginasio.h"
#include "Jogador.h"
#include "Pokemon.h"

@interface Batalha : NSObject

@property(retain) Ginasio *ginasio;
@property(retain) Jogador *desafiante;

#pragma mark - Constructor
- (instancetype)initWithGinasio: (Ginasio*) newGinasio Desafiante: (Jogador*) newJogador;

#pragma mark - Other Methods
-(Jogador*)batalharJogador;
-(Pokemon*)dueloPokemon: (Pokemon*)poke1 desafiante:(Pokemon*)poke2;
-(int)tipoPokemon: (NSString*)tipo1 ganhaDe:(NSString*)tipo2;

@end

//
//  Jogador.h
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"


@interface Jogador : NSObject

@property NSString *nome;
@property NSMutableArray *pokemons;

#pragma mark - Constructor
-(instancetype)initWithNome:(NSString *)nome;

#pragma mark - Other Methods
-(void)consultarPokemons;
-(BOOL)capturarPokemon: (Pokemon*)poke;
-(NSMutableArray*)getMelhoresPokemons;
-(void)apresentaJogadores;

//-(void)timerAction: (int)valor;


@end

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
@property NSString *time;


-(instancetype)initWithNome:(NSString *)nome withTime:(NSString *)time;

//Setters
-(void)nome:(NSString*)currentNome;
-(void)pokemons: (NSMutableArray*)currentPokemons;
-(void)time: (NSString*)currentTime;

//Getters
-(NSString*)getNome;

-(void)consultarPokemons;
-(BOOL)capturarPokemon: (Pokemon*)poke;
-(NSMutableArray*)getMelhoresPokemons;
//-(void)timerAction: (int)valor;


@end

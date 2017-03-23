//
//  Jogador.h
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"


@interface Jogador : NSObject{
    NSString *nome;
    NSMutableArray *pokemons;
    NSString *time;
    
}

//Getters
-(NSString*)nome;
-(NSMutableArray*)pokemons;
-(NSString*)time;

//Setters
-(void)nome:(NSString*)currentNome;
-(void)pokemons: (NSMutableArray*)currentPokemons;
-(void)time: (NSString*)currentTime;


-(void)consultarPokemons;
-(BOOL)capturarPokemon: (Pokemon*)poke;
-(NSMutableArray*)getMelhoresPokemons;
//-(void)timerAction: (int)valor;


@end

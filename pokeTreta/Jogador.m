//
//  Jogador.m
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Jogador.h"

@implementation Jogador

@synthesize nome = _nome;
@synthesize time = _time;
@synthesize pokemons = _pokemons;

-(instancetype)initWithNome:(NSString *)nome withTime:(NSString *)time {
	self = [super init];
	if (self) {
		_nome = nome;
		_time = time;
		_pokemons = NULL;
	}
	return self;
}

//Setters
-(void)nome:(NSString*)currentNome{
    _nome = currentNome;
}
-(void)pokemons: (NSMutableArray*)currentPokemons{
    _pokemons = currentPokemons;
}
-(void)time: (NSString*)currentTime{
    _time = currentTime;
}


//Chama o metodo que apresenta os atributos do pokemon para cada pokemon do jogador
-(void)consultarPokemons{
    for (int i = 0; i < self.pokemons.count; i++) {
        [self.pokemons[i] apresentaPokemon];
    }
}

//Retorna um boolean idicando se o pokemon passado como parametro foi capturado, ou nao. Se ele foi capturado, o mesmo e adicionado
//a lista de pokemons do jogador
-(BOOL)capturarPokemon:(Pokemon *)poke{
    int rand = arc4random_uniform(100);
    if(rand % 2 == 0){
        [_pokemons addObject:poke];
        return YES;
    }
    return NO;
}


//Retorna um array com os 3 melhores pokemons do jogador
-(NSMutableArray*)getMelhoresPokemons{
    NSSortDescriptor* sorter = [[NSSortDescriptor alloc] initWithKey:@"exp" ascending:NO];
    NSArray* sortDescriptors = @[ sorter ];
    NSArray *sortedArray = [self.pokemons sortedArrayUsingDescriptors:sortDescriptors];
    NSMutableArray *melhores = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        [melhores addObject:[sortedArray objectAtIndex:i]];
    }
    return melhores;
}

//Apresenta textualmente todos os atributos do objeto jogador
-(void)apresentaJogadores{
	NSLog(@"Nome: %@\nTime: %@\n", self.nome, self.time);
	NSLog(@"Pokemons: \n");
	[self consultarPokemons];
	
}

@end

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
@synthesize pokemons = _pokemons;

#pragma mark - Constructor
-(instancetype)initWithNome:(NSString *)nome {
	self = [super init];
	if (self) {
		_nome = nome;
		_pokemons = [[NSMutableArray alloc]init];
	}
	return self;
}

#pragma mark - Other Methods
//Chama o metodo que apresenta os atributos do pokemon para cada pokemon do jogador
-(void)consultarPokemons{
    for (int i = 0; i < self.pokemons.count; i++) {
        [self.pokemons[i] apresentaPokemon];
    }
}

//Retorna um boolean idicando se o pokemon passado como parametro foi capturado, ou nao. Se ele foi capturado, o mesmo e adicionado
//a lista de pokemons do jogador
-(BOOL)capturarPokemon:(Pokemon *)poke{
    if([self.pokemons count] >= 5){
        return NO;
    }
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
	NSLog(@"Nome: %@\n", _nome);
	NSLog(@"Pokemons: \n");
	[self consultarPokemons];
	
}

@end

//
//  Jogo.m
//  pokeTreta
//
//  Created by Guilherme Baldissera on 23/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Jogo.h"
#import "Pokemon.h"
#import "Jogador.h"

@implementation Jogo

@synthesize pokemons = _pokemons;
@synthesize jogadores = _jogadores;
@synthesize ginasios = _ginasios;
@synthesize batalhas = _batalhas;

-(instancetype)initWithInformacoes {
	self = [super init];
	if (self) {
		[self criarPokemons];
		[self criarJogadores];
	}
	return self;
}

-(void) jogar {
	int opcao = 0;
	do {
		switch (opcao) {
			case 1:
				
//				[self controlarPokemon];
				break;
			case 2:
//				[self controlarJogador];
				break;
			case 3:
//				[self controlarGinasio];
				break;
			case 4:
				//				gerarAcaoBatalha();
				break;
				
			default:
				break;
		}
		
//		opcao = [self selecionaOpcaoMenu];
	} while (opcao != 5);
}


// Criar um array de pokemons
-(void) criarPokemons {
	
	const NSArray * pokemonsNames = @[
									  @"Pikachu",
									  @"Chalizard"
									 ];
	
	const NSArray * pokemonsTypes = @[
									  @TIPO_VENTO,
									  @TIPO_AGUA
									 ];
	
	_pokemons = [[NSMutableArray alloc]init];
	
	for (int index = 0; index < [pokemonsNames count]; index++) {
		Pokemon * p = [[Pokemon alloc]initWithNome:pokemonsNames[index] withExp:0 withTipo:pokemonsTypes[index]];
		[_pokemons addObject:p];
	}
}


// Criar um array de jogadores
-(void) criarJogadores {
	
	const NSArray * jogadoresNames = @[
									   @"José Silva",
									   @"Maria Eliza",
									   @"Gabriel Souza"
									   ];
	
	const NSArray * jogadoresTimes = @[
									   @TIME_AMARELO,
										@TIME_VERMELHO,
										@TIME_AZUL
										];
	
	_jogadores = [[NSMutableArray alloc]init];
	
	for (int index = 0; index < [jogadoresNames count]; index++) {
		Jogador * j = [[Jogador alloc]initWithNome:jogadoresNames[index] withTime:jogadoresTimes[index]];
		
		NSMutableArray * pokemonsDoJogador = [[NSMutableArray alloc]initWithArray:_pokemons];
		
		[j pokemons:pokemonsDoJogador];
		
		[_jogadores addObject:j];
	}
}

@end

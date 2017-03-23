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
#import "View.h"

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

-(NSString *) textoMenuJogador {
	return @"\n1-Para criar jogador.\n2-capturar pokemon.\n3-Listar jogadores.\n0-para sair.\nInforme uma opcao:\n";
}

//Objetivo: menu de jogadores.
//Parametro: array de jogadores.
//Retorna: nada.
-(void) menuJogador {
	
	int opcao;
	
	do{
		opcao = [View lerInteiro:[self textoMenuJogador]];
		
		switch (opcao) {
			case 1:
				[self cadastrarJogador];
				break;
			case 2:
//                aux = [self];
                
				break;
			case 3:
				[self listarJogadores];
				break;
			default:
				break;
		}
	}while(opcao != 0);
	
}

-(NSString *) textoMenu {
	return @"1 - Menu Jogador\n2 - Listar Pokemons\n3 - Batalha\n0 - Sair\nInforme a opção: ";
}

-(void) jogar {
	int opcao = 0;
	do {
		opcao = [View lerInteiro:[self textoMenu]];
		switch (opcao) {
			case 1:
                [self menuJogador];
				break;
			case 2:
                  [self listarPokemons];
				break;
			case 3:
                //batalha.
//				gerarAcaoBatalha();
				break;
			default:
				break;
		}
	} while (opcao != 0);
}


/*
 ------------FUNCAO CRIAR JOGADOR-----------
 //Objetivo: criar objeto jogador.
 //Parametro: nenhum.
 //Retorna: objeto instanciado.
 +(Jogador*)createJogador{
 
 Jogador *currentJogador = [[Jogador alloc]initWithNome:[View lerString:@"Informe o nome do jogador:\n"] time: [Utils geraTimeJogador]];
 
 return currentJogador;
 }
 
 //Objetivo: gerar time do jogador.
 //Parametro: nenhum.
 //Retorna: time escolhido.
 +(NSString*)geraTimeJogador{
 
 NSString*retorna;
 int opcao;
 
 opcao = [Utils randomicoComValorMin:1 valorMax:3];
 switch (opcao) {
 case 1:
 retorna = @"Azul";
 break;
 case 2:
 retorna = @"Vermelho";
 break;
 case 3:
 retorna = @"Amarelo";
 break;
 }
 return retorna;
 }

 
 
*/



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
	
	_jogadores = [[NSMutableArray alloc]init];
	
	for (int index = 0; index < [jogadoresNames count]; index++) {
		Jogador * j = [[Jogador alloc]initWithNome:jogadoresNames[index]];
		
		NSMutableArray * pokemonsDoJogador = [[NSMutableArray alloc]initWithArray:_pokemons];
		
		[j pokemons:pokemonsDoJogador];
		
		[_jogadores addObject:j];
	}
}

-(void) cadastrarJogador {
	
	NSString * nome = [View lerString:@"Insira o nome do jogador: "];
	
	while ([nome length] == 0) {
		nome = [View lerString:@"É necessário o nome para o Jogador.\nInsira o nome do jogador: "];
	}
	
	[_jogadores addObject: [[Jogador alloc]initWithNome:nome]];
}

-(void) listarPokemons {
	for (Pokemon * p in _pokemons) {
		[p apresentaPokemon];
	}
}

-(void) listarJogadores {
	for (Jogador * j in _jogadores) {
		[j apresentaJogadores];
	}
}

@end

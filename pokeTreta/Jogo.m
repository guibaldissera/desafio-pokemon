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
#import "Batalha.h"

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

NSString * menuJogador2 () {
	return @"\n1-Para criar jogador.\n2-capturar pokemon.\n3-Listar pokemons de um jogador.\n0-para sair.\nInforme uma opcao:\n";
}

//Objetivo: menu de jogadores.
//Parametro: array de jogadores.
//Retorna: nada.
void menuJogador() {
	
	int opcao;
	
	do{
		opcao = [View lerInteiro:menuJogador2()];
		
		switch (opcao) {
			case 1:
				//criarJogador();
				//jogador = @[[Utils createJogador]];
				break;
			case 2:
				//capturarPokemon();
				break;
			case 3:
				//ListarJogador.();
				break;
			default:
				break;
		}
	}while(opcao != 0);
	
}

-(void) listarPokemons {
	for (Pokemon * p in _pokemons) {
		[p apresentaPokemon];
	}
}

NSString * menu () {
	return @"1 - Menu Jogador\n2 - Listar Pokemons\n3 - Batalha\n0 - Sair\nInforme a opção: ";
}

-(void) jogar {
	int opcao = 0;
    Batalha* batalha;
    Jogador* jogadorVencedor;
	do {
		opcao = [View lerInteiro:menu()];
		switch (opcao) {
			case 1:
                menuJogador();
				break;
			case 2:
                  [self listarPokemons];
				break;
			case 3:
                batalha = [self preparaBatalha];
                jogadorVencedor = [batalha batalharJogador];
                NSLog(@"O jogador vencedor e: %@", [jogadorVencedor nome]);
				break;
			default:
				break;
		}
	} while (opcao != 0);
}


-(Batalha*)preparaBatalha{
    int optionJogador = -1;
    int optionGinasio = -1;
    do{
        optionJogador = [View lerInteiro:@"Informe o jogador que vai desafiar um ginasio:"];
        for(int i = 0; i < [_jogadores count]; i++){
            NSLog(@"%d Jogador : %@", i, [_jogadores[i] nome]);
        }
        
    }while(optionJogador < 0 || optionJogador >= [_jogadores count]);
    NSLog(@"Informe o ginasio que deseja batalhar");
    
    do{
        optionGinasio = [View lerInteiro:@"Informe o ginasio que vai desafiar:"];
        for(int i = 0; i < [_ginasios count]; i++){
            NSLog(@"%d Ginasio : %@", i, [_ginasios[i] nome]);
        }
        scanf("%d",&optionGinasio);
    }while(optionGinasio < 0 || optionGinasio >= [_ginasios count]);
    
    Batalha *batalha = [[Batalha alloc]initWithGinasio:_ginasios[optionGinasio] Desafiante:_jogadores[optionJogador]];
    
    return batalha;
    
    
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

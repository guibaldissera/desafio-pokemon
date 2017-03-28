//
//  Jogo.h
//  pokeTreta
//
//  Created by Guilherme Baldissera on 23/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"
#import "Jogador.h"
#import "Batalha.h"

#define TIPO_AGUA "agua"
#define TIPO_FOGO "fogo"
#define TIPO_VENTO "vento"

#define TIME_VERMELHO "vermelho"
#define TIME_AZUL "azul"
#define TIME_AMARELO "amarelo"

@interface Jogo : NSObject

@property NSMutableArray * pokemons;
@property NSMutableArray * jogadores;
@property NSMutableArray * ginasios;
@property NSMutableArray * batalhas;

#pragma mark - Constructor
- (instancetype)initWithInformacoes;

#pragma mark - Menu Methods
-(NSString *) textoMenuJogador;
-(NSString *) textoMenu;

#pragma mark - Control Menu Methods
-(void) menuJogador;
-(void) jogar;

#pragma mark - List Methods
-(void) listarPokemons;
-(void)listarJogadores;
-(void) listarJogadores2;

#pragma mark - Create Itens Methods
-(void) criarPokemons;
-(void) criarJogadores;
-(void) criarGinasios;
-(void) cadastrarJogador;
-(Batalha* )preparaBatalha;

#pragma mark - Other Methods
-(Pokemon*)geraPokemonRandom;
-(Jogador*) selecionaJogador;
+(int)randomicoComValorMin:(int)valorMin valorMax:(unsigned long)valorMax;

@end

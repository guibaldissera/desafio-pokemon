//
//  Jogo.h
//  pokeTreta
//
//  Created by Guilherme Baldissera on 23/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>

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


- (instancetype)initWithInformacoes;

-(void) jogar;

-(void) criarPokemons;
-(void) criarJogadores;

@end

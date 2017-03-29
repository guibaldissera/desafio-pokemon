//
//  ProtocoloJogo.h
//  pokeTreta
//
//  Created by Guilherme Baldissera on 28/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TIPO_AGUA "agua"
#define TIPO_FOGO "fogo"
#define TIPO_VENTO "vento"

#define TIME_VERMELHO "vermelho"
#define TIME_AZUL "azul"
#define TIME_AMARELO "amarelo"

#define XP_VENCEDOR 35
#define XP_PERDEDOR 10

@protocol ProtocoloJogo <NSObject>

#pragma mark - Optional Itens
@optional
@property NSMutableArray * jogadores;
@property NSMutableArray * ginasios;
@property NSMutableArray * batalhas;

#pragma mark Methods
-(void) listarJogadores;

-(void) criarPokemons;
-(void) criarJogadores;
-(void) criarGinasios;

#pragma mark - Required Itens
@required
@property NSMutableArray * pokemons;

#pragma mark Methods
-(void) jogar;
-(void) listarPokemons;


@end

//
//  Jogo.h
//  pokeTreta
//
//  Created by Guilherme Baldissera on 23/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProtocoloJogo.h"
#import "Pokemon.h"
#import "Jogador.h"
#import "Batalha.h"
#import "View.h"

@interface Jogo : NSObject <ProtocoloJogo>

#pragma mark - Constructor
- (instancetype)initWithInformacoes;

#pragma mark - Menu Methods
-(NSString *) textoMenuJogador;
-(NSString *) textoMenu;

#pragma mark - Control Menu Methods
-(void) menuJogador;

#pragma mark - List Methods
-(void) listarOpcaoJogadores;

#pragma mark - Create Itens Methods
-(void) cadastrarJogador;
-(Batalha* )preparaBatalha;

#pragma mark - Other Methods
-(Pokemon*)geraPokemonRandom;
-(Jogador*) selecionaJogador;
+(int)randomicoComValorMin:(int)valorMin valorMax:(unsigned long)valorMax;

@end

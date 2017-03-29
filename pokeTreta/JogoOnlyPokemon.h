//
//  JogoOnlyPokemon.h
//  pokeTreta
//
//  Created by Guilherme Baldissera on 29/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProtocoloJogo.h"
#import "View.h"
#import "Pokemon.h"

@interface JogoOnlyPokemon : NSObject <ProtocoloJogo>

-(instancetype)initWithPokemons;

#pragma mark - Menu Methods
-(NSString *) textoMenu;

#pragma mark - Control Menu Methods
-(void) jogar;

#pragma mark - List Methods
-(void) listarPokemons;

#pragma mark - Array Populate Methods
-(void) criarPokemons;

@end

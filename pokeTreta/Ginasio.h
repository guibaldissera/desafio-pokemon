//
//  Ginasio.h
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Jogador.h"

@interface Ginasio : NSObject

@property(retain) Jogador* jogador;
@property(retain) NSString* nome;

-(void)mudaJogadorLider: (Jogador*)lider;


@end

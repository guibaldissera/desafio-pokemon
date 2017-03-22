//
//  Batalha.m
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Batalha.h"

@implementation Batalha



@synthesize ginasio;
@synthesize desafiante;


-(Jogador*)batalharJogador{
    NSMutableArray* melhoresPokemonsDesafiante = [desafiante getMelhoresPokemons];
    NSMutableArray* melhoresPokemonsLider = [ginasio.jogador getMelhoresPokemons];
    NSMutableArray* pokemonsVencedores = [[NSMutableArray alloc] init];
    int pontos = 0;
    for (int i =0; i<3; i++) {
        [pokemonsVencedores addObject:[self dueloPokemon:melhoresPokemonsLider[i] desafiante:melhoresPokemonsDesafiante[i]]];
        if([pokemonsVencedores[i] isEqual: desafiante.pokemons[i]])
            pontos++;
        else{
            pontos--;
        }
    }
    
    if(pontos > 0){
        [[self ginasio] mudaJogadorLider:desafiante];
        return desafiante;
    }
    return ginasio.jogador;
}

-(Pokemon*)dueloPokemon:(Pokemon *)poke1 desafiante:(Pokemon *)poke2{
    int diferencaDeLevel = [poke1 getLevel:poke1.exp]-[poke2 getLevel:poke2.exp];
    if(diferencaDeLevel >= 3){
        return poke1;
    }else{
        if(diferencaDeLevel <= -3){
            return poke2;
        }
        else{
            if(diferencaDeLevel < 3 && diferencaDeLevel >-3 && [self tipoPokemon:poke1.tipo ganhaDe:poke2.tipo] == -1){
                return poke2;
            }else{
                if(diferencaDeLevel < 3 && diferencaDeLevel >-3 && [self tipoPokemon:poke1.tipo ganhaDe:poke2.tipo] == 1){
                    return poke1;
                }
                else
                    if(arc4random_uniform(100)%2 == 0){
                        return poke1;
                    }else
                        return poke2;
            }
        }
    }
}

-(int)tipoPokemon:(NSString *)tipo1 ganhaDe:(NSString *)tipo2{
    if([tipo1  isEqualToString: @"fogo"] && [tipo2 isEqualToString:@"agua"])
        return -1;
    if([tipo1  isEqualToString: @"fogo"] && [tipo2 isEqualToString:@"vento"])
        return 1;
    if([tipo1  isEqualToString: @"agua"] && [tipo2 isEqualToString:@"vento"])
        return -1;
    if([tipo1  isEqualToString: @"agua"] && [tipo2 isEqualToString:@"fogo"])
        return 1;
    if([tipo1  isEqualToString: @"vento"] && [tipo2 isEqualToString:@"fogo"])
        return -1;
    if([tipo1  isEqualToString: @"vento"] && [tipo2 isEqualToString:@"agua"])
        return 1;
    return 0;
    
}

@end

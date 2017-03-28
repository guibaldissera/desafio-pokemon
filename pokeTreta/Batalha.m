//
//  Batalha.m
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Batalha.h"

//defines
#define XP_VENCEDOR 35
#define XP_PERDEDOR 10

@implementation Batalha

@synthesize ginasio;
@synthesize desafiante;

#pragma mark - Constructor
- (instancetype)initWithGinasio: (Ginasio*) newGinasio Desafiante: (Jogador*) newJogador
{
    self = [super init];
    if (self) {
        self.ginasio = newGinasio;
        self.desafiante = newJogador;
    }
    return self;
}

#pragma mark - Other Methods

//Inicia uma batalha entre um jogador desafiante e um jogador que e lider do ginasio
-(Jogador*)batalharJogador{
    if([ginasio jogador] == NULL){
        [ginasio mudaJogadorLider:self.desafiante];
        return desafiante;
    }
    NSMutableArray* melhoresPokemonsDesafiante = [desafiante getMelhoresPokemons];
    NSMutableArray* melhoresPokemonsLider = [ginasio.jogador getMelhoresPokemons];
    NSMutableArray* pokemonsVencedores = [[NSMutableArray alloc] init];
    //variavel que guarda o placar da partida
    int pontos = 0;
    //Inicia os 3 rounds dos melhores pokemons
    for (int i =0; i<3; i++) {
        //salva os melhores pokemons num array;
        [pokemonsVencedores addObject:[self dueloPokemon:melhoresPokemonsLider[i] desafiante:melhoresPokemonsDesafiante[i]]];
        //se o pokemon do desafiante estiver no array dos vencedores, aumenta o placar
        if([pokemonsVencedores[i] isEqual: desafiante.pokemons[i]])
            pontos++;
        else{
            pontos--;
        }
    }
    //se o placar for positivo o desafiante ganhou, senao, o lider ganhou.
    if(pontos > 0){
        [[self ginasio] mudaJogadorLider:desafiante];
        return desafiante;
    }
    return ginasio.jogador;
}


//Faz o duelo entre 2 pokemons
-(Pokemon*)dueloPokemon:(Pokemon *)poke1 desafiante:(Pokemon *)poke2{
    
    if([poke1 isEqual: poke2]){
        NSLog(@"ERRO POKEMON, OS POKEMONS TEM A MESMA REFERENCIA");
        return NULL;
    }
    
    int diferencaDeLevel = [poke1 getLevel:poke1.exp]-[poke2 getLevel:poke2.exp];
    //Se a diferenca de level for maior que 3, o que tiver maior level ganha
    //A experiencia tambem e alterada
    if(diferencaDeLevel >= 3){
        [poke1 ganhaXp:XP_VENCEDOR];
        [poke2 ganhaXp:XP_PERDEDOR];
        return poke1;
    }else{
        if(diferencaDeLevel <= -3){
            [poke2 ganhaXp:XP_VENCEDOR];
            [poke1 ganhaXp:XP_PERDEDOR];
            return poke2;
        }
        else{
            //Se a diferenca de level nao for maior que tres ganha quem tiver o tipo dominante
            if(diferencaDeLevel < 3 && diferencaDeLevel >-3 && [self tipoPokemon:poke1.tipo ganhaDe:poke2.tipo] == -1){
                [poke2 ganhaXp:XP_VENCEDOR];
                [poke1 ganhaXp:XP_PERDEDOR];
                return poke2;
            }else{
                if(diferencaDeLevel < 3 && diferencaDeLevel >-3 && [self tipoPokemon:poke1.tipo ganhaDe:poke2.tipo] == 1){
                    [poke1 ganhaXp:XP_VENCEDOR];
                    [poke2 ganhaXp:XP_PERDEDOR];
                    return poke1;
                }
                else
                    //se o tipo for igual e a diferenca menor que 3, o pokemon vencedor e decidido aleatoriamente
                    if(arc4random_uniform(100)%2 == 0){
                        [poke1 ganhaXp:XP_VENCEDOR];
                        [poke2 ganhaXp:XP_PERDEDOR];
                        return poke1;
                    }else{
                        [poke2 ganhaXp:XP_VENCEDOR];
                        [poke1 ganhaXp:XP_PERDEDOR];
                        return poke2;
                    }
            }
        }
    }
}
//Define os tipos de pokemons
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

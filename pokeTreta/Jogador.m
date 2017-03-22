//
//  Jogador.m
//  pokeTreta
//
//  Created by Leonel Menezes on 17/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Jogador.h"

@implementation Jogador


//Getters
-(NSString*)nome{
    return nome;
}
-(NSArray*)pokemons{
    return pokemons;
}
-(NSString*)time{
    return time;
}

//Setters
-(void)nome:(NSString*)currentNome{
    nome = currentNome;
}
-(void)pokemons: (NSArray*)currentPokemons{
    pokemons = currentPokemons;
}
-(void)time: (NSString*)currentTime{
    time = currentTime;
}

-(void)consultarPokemons{
    for (int i = 0; i < self.pokemons.count; i++) {
        [self.pokemons[i] apresentaPokemon];
    }
}

-(BOOL)capturarPokemon:(Pokemon *)poke{
    int rand = arc4random_uniform(100);
    if(rand % 2 == 0)
        return YES;
    
    return NO;
}

-(NSArray*)getMelhoresPokemons{
    NSSortDescriptor* sorter = [[NSSortDescriptor alloc] initWithKey:@"exp" ascending:NO];
    NSArray* sortDescriptors = @[ sorter ];
    NSArray *sortedArray = [self.pokemons sortedArrayUsingDescriptors:sortDescriptors];
    NSMutableArray *melhores = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        [melhores addObject:[sortedArray objectAtIndex:i]];
    }
    return melhores;
}

@end

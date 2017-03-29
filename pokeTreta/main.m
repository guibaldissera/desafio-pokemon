//
//  main.m
//  pokeTreta
//
//  Created by Leonel Menezes on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jogo.h"
#import "JogoOnlyPokemon.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
		
		NSLog(@"------------------ Jogos de Pokemon ------------------");
		NSLog(@"1 - Pokemon com jogadores");
		NSLog(@"2 - Somente pokemons");
		NSLog(@"Escolha o modo de jogo: ");
		int opcao = 0;
		scanf("%d", &opcao);
		
		if (opcao == 1) {
			Jogo * j = [[Jogo alloc]initWithInformacoes];
			
			[j jogar];
		} else if (opcao == 2) {
			JogoOnlyPokemon * j = [[JogoOnlyPokemon alloc]initWithPokemons];
			
			[j jogar];
		}
    }
    return 0;
}

//
//  JogoOnlyPokemon.m
//  pokeTreta
//
//  Created by Guilherme Baldissera on 29/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "JogoOnlyPokemon.h"

@implementation JogoOnlyPokemon

@synthesize pokemons = _pokemons;

#pragma mark - Constructor
-(instancetype)initWithPokemons {
	self = [super init];
	if (self) {
		[self criarPokemons];
	}
	return self;
}

-(NSString *) textoMenu {
	return @"1 - Listar Pokemons\n2 - Batalhar\n0 - Sair\nInforme a opção: ";
}

-(void) jogar {
	int opcao = 0;
	do {
		opcao = [View lerInteiro:[self textoMenu]];
		switch (opcao) {
			case 1:
				[self listarPokemons];
				break;
			case 2:
				[self batalhar];
				break;
				
			default:
				break;
		}
	} while (opcao != 0);
}

-(void) batalhar {
	[self listarPokemonsBatalha];
	int indexPokemon1 = [View lerInteiro:@"Selecione o pokemon: "];
	
	[self listarPokemonsBatalha];
	int indexPokemon2 = [View lerInteiro:@"Selecione o outro pokemon: "];
	
	Pokemon * pokemon1 = _pokemons[indexPokemon1];
	Pokemon * pokemon2 = _pokemons[indexPokemon2];
	
	Pokemon * pokemonVencedor = [self dueloPokemon:pokemon1 desafiante:pokemon2];
	
	NSLog(@"O pokemon vencedor foi: %@", pokemonVencedor.nome);
}


//Faz o duelo entre 2 pokemons
-(Pokemon*)dueloPokemon:(Pokemon *)poke1 desafiante:(Pokemon *)poke2{
	
	if([poke1 isEqual: poke2]){
		NSLog(@"ERRO POKEMON, POKEMONS IGUAIS FORAM SELECIONADOS.");
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

#pragma mark - Create Itens Methods
// Criar um array de pokemons
-(void) criarPokemons {
	
	const NSArray * pokemonsNames = @[
									  @"Pikachu",
									  @"Charizard",
									  @"Entei",
									  @"Blastoise",
									  @"pidgey"
									 ];
	
	const NSArray * pokemonsTypes = @[
									  @TIPO_VENTO,
									  @TIPO_AGUA,
									  @TIPO_FOGO,
									  @TIPO_AGUA,
									  @TIPO_VENTO
									 ];
	
	_pokemons = [[NSMutableArray alloc]init];
	
	for (int index = 0; index < [pokemonsNames count]; index++) {
		Pokemon * p = [[Pokemon alloc]initWithNome:pokemonsNames[index] withExp:0 withTipo:pokemonsTypes[index]];
		[_pokemons addObject:p];
	}
}

#pragma mark - List Methods
-(void) listarPokemons {
	for (Pokemon * p in _pokemons) {
		[p apresentaPokemon];
	}
}

-(void) listarPokemonsBatalha {
	int i = 0;
	for (Pokemon * p in _pokemons) {
		[p apresentaPokemonBatalha:i++];
	}
}

@end

//
//  Pokemon.m
//  pokeTreta
//
//  Created by Leonel Menezes on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

@synthesize nome = _nome;
@synthesize tipo = _tipo;
@synthesize exp = _exp;

#pragma mark - Constructor
- (instancetype)initWithNome: (NSString*)newNome withExp:(int) newExp withTipo: (NSString*) newTipo{
    self = [super init];
    if (self) {
        self.nome = newNome;
        self.tipo = newTipo;
        self.exp = newExp;
    }
    return self;
}

#pragma mark - Other Methods
//Incrementa a xp definida ao pokemon
-(void)ganhaXp:(int)xpBatalha{
    self.exp += xpBatalha;
}

//Retorna o level do pokemon baseado na experiencia do mesmo
-(int)getLevel:(int)xpTotal{
    
    return xpTotal/100;
}


//Apresenta textualmente todos os atributos do objeto pokemon
-(void)apresentaPokemon {
    printf("Nome: %s\nExperiencia: %d\nTipo: %s\nLevel: %d\n", [self.nome cStringUsingEncoding:NSUTF8StringEncoding], self.exp, [self.tipo cStringUsingEncoding:NSUTF8StringEncoding], [self getLevel:self.exp]);
}
-(void)apresentaPokemonBatalha:(int)index {
	printf("Pokemon %d - %s - %s - level %d\n", index, [self.nome cStringUsingEncoding:NSUTF8StringEncoding], [self.tipo cStringUsingEncoding:NSUTF8StringEncoding], [self getLevel:self.exp]);
}

@end

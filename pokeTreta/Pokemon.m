//
//  Pokemon.m
//  pokeTreta
//
//  Created by Leonel Menezes on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

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


#pragma mark - Get Methods
-(NSString*)nome{
    return nome;
}
-(int)exp{
    return exp;
}
-(NSString*)tipo{
    return tipo;
}

#pragma mark - Set Methods
-(void)setNome: (NSString*)currentNome{
    nome = currentNome;
}
-(void)setExp: (int)currentExp{
    exp = currentExp;
}
-(void)setTipo: (NSString*)currentTipo{
    tipo = currentTipo;
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
-(void)apresentaPokemon{
    NSLog(@"Nome: %@\nExperiencia: %d\nTipo: %@\nLevel: %d", self.nome, self.exp, self.tipo, [self getLevel:self.exp]);
}

@end

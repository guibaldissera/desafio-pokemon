//
//  Pokemon.h
//  pokeTreta
//
//  Created by Leonel Menezes on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject{
    NSString *nome;
    int exp;
    NSString *tipo;
    
    
}

- (instancetype)initWithNome: (NSString*)newNome withExp:(int) newExp withTipo: (NSString*) newTipo;

//Getters
-(NSString*)nome;
-(int)exp;
-(NSString*)tipo;

//Setters
-(void)setNome: (NSString*)currentNome;
-(void)setExp: (int)currentExp;
-(void)setTipo: (NSString*)currentTipo;

//METODOS
-(void)ganhaXp:(int)xpBatalha;
-(int)getLevel:(int)xpTotal;
-(void) apresentaPokemon;

@end

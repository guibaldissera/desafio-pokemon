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

#pragma mark - Constructor
- (instancetype)initWithNome: (NSString*)newNome withExp:(int) newExp withTipo: (NSString*) newTipo;

#pragma mark - Get Methods
-(NSString*)nome;
-(int)exp;
-(NSString*)tipo;

#pragma mark - Set Methods
-(void)setNome: (NSString*)currentNome;
-(void)setExp: (int)currentExp;
-(void)setTipo: (NSString*)currentTipo;

#pragma mark - Other Methods
-(void)ganhaXp:(int)xpBatalha;
-(int)getLevel:(int)xpTotal;
-(void) apresentaPokemon;

@end

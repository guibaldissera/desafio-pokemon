//
//  Pokemon.h
//  pokeTreta
//
//  Created by Leonel Menezes on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject

@property NSString *nome;
@property int exp;
@property NSString *tipo;

#pragma mark - Constructor
- (instancetype)initWithNome: (NSString*)newNome withExp:(int) newExp withTipo: (NSString*) newTipo;

#pragma mark - Other Methods
-(void)ganhaXp:(int)xpBatalha;
-(int)getLevel:(int)xpTotal;
-(void)apresentaPokemon;
-(void)apresentaPokemonBatalha:(int)index;

@end

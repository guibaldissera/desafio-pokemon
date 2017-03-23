//
//  main.m
//  pokeTreta
//
//  Created by Leonel Menezes on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jogo.h"

#define XP_VENCEDOR 35
#define XP_PERDEDOR 10

int main(int argc, const char * argv[]) {
    @autoreleasepool {
		Jogo * j = [[Jogo alloc]initWithInformacoes];
		
		[j jogar];
    }
    return 0;
}

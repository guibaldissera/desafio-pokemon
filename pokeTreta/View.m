//
//  View.m
//  chalangePokemon
//
//  Created by Renan Alves on 21/03/17.
//  Copyright © 2017 Renan Alves. All rights reserved.
//

#import "View.h"

@implementation View

//Objetivo: ler string.
//Parametro: mensagem.
//Retorna: string.
+(NSString*)lerString:(NSString*)msg{
    
    char str[20];
    
    NSLog(@"%@", msg);
    fgets(str,20,stdin);
    
    
    return [NSString stringWithUTF8String:str];
}


//Objetivo: ler inteiro.
//Parametro: mensagem.
//Retorna: inteiro nao validado.
+(int)lerInteiro:(NSString*) msg{
    
    int valor;
    NSLog(@"%@",msg);
    fflush(stdin);
    scanf("%d",&valor);
    fflush(stdin);
    return valor;
}

@end

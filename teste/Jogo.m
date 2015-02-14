//
//  Jogo.m
//  Genius
//
//  Created by Rafael  Hieda on 13/02/15.
//  Copyright (c) 2015 Rafael Hieda. All rights reserved.
//

#import "Jogo.h"

@implementation Jogo

@synthesize fila;

-(instancetype) init
{
    self = [super init];
    if(self)
        fila =[[Fila alloc]init];
    return self;
}

-(void)clearScreen{
    NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
}

-(NSUInteger)createRandomNumber
{
   NSUInteger r = arc4random_uniform(4)+1;
    return r;
}

-(void)run
{ // lembrar que ta enfileirando  unsigned long e comparando com int
    // acho que a logica dele esta implementado errado, to achando que ele não está comparando direito. rever o ponto
    //funcionando, mas precisei implementar dois metodos em especial, o imprimirOverride pra corrigir a conversão
    //removerTudo que remove a lista inteira para ser preenchida pelo jogador na filaPlayer
    NSInteger choice;
    Fila *filaPlayer = [[Fila alloc] init];
    do
    {   if([fila elementos] == nil)
        {
            [fila enfileirar: [NSNumber numberWithUnsignedLong:[self createRandomNumber]]];
            [NSThread sleepForTimeInterval:2.0f];
            [self clearScreen];
            printf("\n Sua escolha: \n");
            scanf("%lu", &choice);
            [filaPlayer enfileirar: [NSNumber numberWithUnsignedLong: choice]];
        }
        else{
            [filaPlayer desenfileirarTudo];
            [fila enfileirar: [NSNumber numberWithUnsignedLong:[self createRandomNumber]]];
            [fila imprimirOverride];
            [NSThread sleepForTimeInterval:2.0f];
            [self clearScreen];
            printf("\n Sua escolha: \n");
            int count = (int) [[fila elementos]count];
            for(int i = 0; i < count; i++)
            {
                scanf("%lu", &choice);
                [filaPlayer enfileirar: [NSNumber numberWithUnsignedLong: choice]];
            }
        }
    } while([self check:filaPlayer] == true);
    NSLog(@"Game over!!!!");
}

-(bool) check:(Fila *) playerFila
{
    if([[fila elementos]isEqualToArray: [playerFila elementos]])
        return true;
    else
        return false;
}

@end

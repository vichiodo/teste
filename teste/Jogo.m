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
    //aloca uma fila para as jogadas do jogador.
    Fila *filaPlayer = [[Fila alloc] init];
    do
    {   // primeiro elemento do jogo roda este if
        if([fila elementos] == nil) 
        {
            [fila enfileirar: [NSNumber numberWithUnsignedLong:[self createRandomNumber]]];
            [NSThread sleepForTimeInterval:2.0f];
            [self clearScreen];
            printf("\n Sua escolha: \n");
            scanf("%lu", &choice);
            [filaPlayer enfileirar: [NSNumber numberWithUnsignedLong: choice]];
        }
        else{ 
            // os proximos numeros a serem jogados rodam neste else aqui
            
            //  a fila do jogador tem que ser desenfileirada a cada jogada para ser comparada com a fila do jogo, pois há um metodo de comparação entre elas
            [filaPlayer desenfileirarTudo];
            
            // enfileira a sequencia de jogadas geradas
            [fila enfileirar: [NSNumber numberWithUnsignedLong:[self createRandomNumber]]]; 
            
             // converte cada unsigned long em um numero que corresponde a jogada e imprime a sequencia da fila do jogo
            [fila imprimirOverride];
            
            //dá aquele tempo para memorizar a jogada e limpa a tela
            [NSThread sleepForTimeInterval:2.0f];
            [self clearScreen];
            
            // pede para informar a sua escolha, conta a quantidade de elementos da fila do jogo para que possamos preencher a fila de jogadas do jogador.
            printf("\n Sua escolha: \n");
            int count = (int) [[fila elementos]count];
            for(int i = 0; i < count; i++)
            {
                scanf("%lu", &choice);
                [filaPlayer enfileirar: [NSNumber numberWithUnsignedLong: choice]];
            }
        }
        //compara se o a sequencia de jogadas geradas pelo jogo é igual a fila de jogadas do jogador , se sim, cria-se mais uma rodada e incrementa-se de mais uma jogada.
    } while([self check:filaPlayer] == true);
    NSLog(@"Game over!!!!");
}
//uma função de checagem da fila
-(bool) check:(Fila *) playerFila
{
    if([[fila elementos]isEqualToArray: [playerFila elementos]])
        return true;
    else
        return false;
}

@end

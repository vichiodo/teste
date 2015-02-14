//
//  Jogo.h
//  Genius
//
//  Created by Rafael  Hieda on 13/02/15.
//  Copyright (c) 2015 Rafael Hieda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fila.h"

@interface Jogo : NSObject
{
Fila  *fila;
}

@property Fila* fila;

-(instancetype) init;

-(void)clearScreen;
-(NSUInteger)createRandomNumber;
-(void)run;
-(bool)check:(Fila *) filaPlayer;

@end

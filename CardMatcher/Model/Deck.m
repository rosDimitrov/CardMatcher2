//
//  Deck.m
//  CardMatcher
//
//  Created by Ross Whyte on 4/6/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property(strong,nonatomic) NSMutableArray *cards; //of Card
@end

@implementation Deck

-(NSMutableArray *) cards{
    
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
    
    
}

-(Card *)drawRandomCard{
    
    Card * randomCard = nil;
    
    if(self.cards){
    unsigned cardNumber = arc4random() % [self.cards count];
    randomCard = self.cards[cardNumber];
    [self.cards removeObjectAtIndex:cardNumber];
    }
    
    return randomCard;
    
    
    
    
}


-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }
    else{
        [self.cards addObject:card];
    }
    
}

-(void)addCard:(Card *)card{
    
    [self addCard:card atTop:NO];
    
}

@end

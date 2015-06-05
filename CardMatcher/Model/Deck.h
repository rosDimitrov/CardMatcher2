//
//  Deck.h
//  CardMatcher
//
//  Created by Ross Whyte on 4/6/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card *) card atTop:(BOOL) atTop;
-(void) addCard:(Card *) card;

-(Card *)drawRandomCard;



@end

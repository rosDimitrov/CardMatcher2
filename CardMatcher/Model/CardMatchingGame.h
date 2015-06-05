//
//  CardMatchingGame.h
//  CardMatcher
//
//  Created by Ross Whyte on 4/8/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) BOOL threeCardGame;
@property (strong,nonatomic) NSMutableString * lastMatch;

//designated initializer
-(instancetype)initWithCardCount:(NSUInteger) count
                       usingDeck:(Deck *) deck;

-(void)chooseCardAtIndex:(NSUInteger) index;
-(Card *) cardAtIndex:(NSUInteger) index;


@end

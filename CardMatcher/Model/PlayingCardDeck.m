//
//  PlayingCardDeck.m
//  CardMatcher
//
//  Created by Ross Whyte on 4/6/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck


-(instancetype)init{
    
    self= [super init];
    if(self) {
        for (NSString * suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank<=[PlayingCard maxRank] ;rank++) {
                PlayingCard * card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
        
    }
    return self;
    
}
@end

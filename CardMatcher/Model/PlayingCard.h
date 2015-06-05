//
//  PlayingCard.h
//  CardMatcher
//
//  Created by Ross Whyte on 4/6/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong, nonatomic) NSString * suit; //(kupa,pika - ikonki като стринг)
@property (nonatomic) NSUInteger rank; //2,3,King,Ace i t.n.

+(NSArray *) validSuits;

+(NSUInteger) maxRank;

@end

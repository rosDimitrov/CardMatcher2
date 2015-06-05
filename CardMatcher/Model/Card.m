//
//  Card.m
//  CardMatcher
//
//  Created by Ross Whyte on 4/6/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards{

    int score = 0;
    
    for (Card * card in otherCards) {
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    
    return score;
}


@end

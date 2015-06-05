//
//  PlayingCard.m
//  CardMatcher
//
//  Created by Ross Whyte on 4/6/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit=_suit;


-(int)match:(NSArray *)otherCards{
    
    int score = 0;
    if([otherCards count] ==1){
        
        PlayingCard * otherCard = [otherCards firstObject];
        if(otherCard.rank == self.rank){
            score =4;
        }
        else if ([otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
        
    }
    else{// 2 cards in the array
        
        PlayingCard * first = [otherCards firstObject];
        PlayingCard * second = [otherCards lastObject];
        
        if(first.rank == second.rank && first.rank == self.rank){ //3 ranks the same
            score = 30;
        }
        else if([first.suit isEqualToString:second.suit] && [first.suit isEqualToString:self.suit]){ //3 suits are the same
            score = 15;
        }
        
        else if(first.rank == second.rank || first.rank ==self.rank || second.rank== self.rank){  //2 ranks match
            score = 3;
        }
        else if([first.suit isEqualToString:second.suit] || [first.suit isEqualToString:self.suit] || [second.suit isEqualToString:self.suit]){
            score = 3;
        }
        
    }
    
    
    return score;
}


-(NSString *)contents{
    
    NSArray * rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

-(NSString *)suit{
    return _suit ? _suit : @"?";
}

-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
    
}


-(void)setRank:(NSUInteger)rank{
    if(rank<=[PlayingCard maxRank]){
        _rank=rank;
    }
}


+(NSArray *) validSuits{
    
    return @[@"♥︎",@"♣︎",@"♦︎",@"♠︎"];
}

+(NSArray *) rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank{
    return [[self rankStrings] count]-1;
}

@end

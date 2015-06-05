//
//  CardMatchingGame.m
//  CardMatcher
//
//  Created by Ross Whyte on 4/8/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray * cards; //of Card

@end

@implementation CardMatchingGame
{
    
    int cardsTurned;
    Card * first;
    Card * second;
}

-(NSMutableArray *) cards{
    
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    
    self=[super init];  //super's designated initializer
    if(self){
        self.threeCardGame= YES;
        for(int i=0;i<count; i++){
            Card * card =[deck drawRandomCard];
            if(card){
            [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
        }
        
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    
    return (index<[self.cards count]) ?self.cards[index] : nil;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
static const int THREE_CARD_BONUS = 25;
static const int TWO_CARD_BONUS = 14;


-(void)chooseCardAtIndex:(NSUInteger)index{
    
    Card *card = [self cardAtIndex:index];
    self.lastMatch = [NSMutableString stringWithFormat:@"You turned %@",card.contents];
    
    //3 cards game set-up
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    
        
    
    
    
    
    
    
    if(self.threeCardGame == NO){
        
        if(!card.isMatched){
            if(card.isChosen){
                card.chosen = NO;
                self.lastMatch = [NSMutableString stringWithFormat:@"You toggled %@",card.contents];
            } else{
                //match against other chosen card
                for(Card * otherCard in self.cards){
                    if(otherCard.isChosen && !otherCard.isMatched){
                        int matchScore = [card match:@[otherCard]];
                        if(matchScore){
                            self.score += matchScore * MATCH_BONUS;
                            self.lastMatch = [NSMutableString stringWithFormat:@"You have a match.%@ & %@.",otherCard.contents,card.contents];
                            otherCard.matched = YES;
                            card.matched = YES;
                        }
                        else{
                            self.score -= MISMATCH_PENALTY;
                            self.lastMatch = [NSMutableString stringWithFormat:@"You don't have a match.%@ & %@.",otherCard.contents,card.contents];
                            otherCard.chosen = NO;
                            //page 53 - read more when more than 2 cards are needed
                        }
                        break;//can only choose 2 cards for now
                                      
                    }
                }
                self.score -=COST_TO_CHOOSE;
                NSLog(@"Cost to choose");
                card.chosen = YES;
            }
        }
    }
    else{
       NSLog(@"Three card game is on");
        
        

        if(!card.isMatched){
            if(card.isChosen){
                card.chosen = NO;
                if([card.contents isEqualToString:first.contents]){
                    first = nil;
                    cardsTurned--;
                }
                if([card.contents isEqualToString:second.contents]){
                    second = nil;
                    cardsTurned--;
                }
                self.lastMatch = [NSMutableString stringWithFormat:@"You toggled %@",card.contents];
            } else{
                //match against other chosen card
                if(cardsTurned==0){
                    if(!first){
                       first = [self cardAtIndex:index];
                    }
                    else{
                        second=[self cardAtIndex:index];
                    }
                    
                    cardsTurned++;
                    NSLog(@"collected 1st");
                }
                 else if(cardsTurned ==1){
                     
                     if(!second){
                         second = [self cardAtIndex:index];
                     }
                     else{
                         first=[self cardAtIndex:index];
                     }
                    cardsTurned++;
                    NSLog(@"Collected 2nd");
                }
                 else if(cardsTurned ==2){
                    int matchScore = [card match:@[first,second]];
                    
                    cardsTurned =0;
                     if(matchScore){
                       NSLog(@"There is a match");
                     //tuk slagam ve4e rezultata dali ima 3 match)
                        first.matched=YES;
                        second.matched=YES;
                        card.matched=YES;
                         self.score+=matchScore;
                     }
                     else{
                         first.chosen =NO;
                         second.chosen=NO;
                         card.chosen = NO;
                     }
                    
                
                }
            
//
//                       //                        if(matchScore){
//                            self.score += matchScore * MATCH_BONUS;
//                            self.lastMatch = [NSMutableString stringWithFormat:@"You have a match.%@ & %@.",otherCard.contents,card.contents];
//                            otherCard.matched = YES;
//                            card.matched = YES;
//                        }
//                        else{
//                            self.score -= MISMATCH_PENALTY;
//                            self.lastMatch = [NSMutableString stringWithFormat:@"You don't have a match.%@ & %@.",otherCard.contents,card.contents];
//                            otherCard.chosen = NO;
//                            //page 53 - read more when more than 2 cards are needed
//                        }
//                        break;//can only choose 2 cards for now
//                        
//                    }
//                }
                self.score -=COST_TO_CHOOSE;
                NSLog(@"Cost to choose");
                card.chosen = YES;
            }
        }

        
        
        //here
        
        
        
    
    }
}
@end

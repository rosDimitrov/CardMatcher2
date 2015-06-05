//
//  ViewController.m
//  CardMatcher
//
//  Created by Ross Whyte on 4/6/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *matchLabel;

@property (weak, nonatomic) IBOutlet UISwitch *cardGameSwitch;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end


@implementation ViewController

- (IBAction)changeGameSwitch:(id)sender {
    
    if([sender isOn]){
        self.game.threeCardGame = YES;
    }
    else{
        self.game.threeCardGame = NO;
    }
}


- (IBAction)redealButton:(id)sender {
    
    _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    self.scoreLabel.text = [NSString stringWithFormat: @"Score: %ld", (long)self.game.score ];
    self.cardGameSwitch.enabled = YES;

    [self updateUI];

    
}

-(CardMatchingGame *)game{
    if(!_game){
        _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}


-(Deck * ) createDeck{
    return [[PlayingCardDeck alloc]init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    self.cardGameSwitch.enabled = NO;
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    

}

-(void) updateUI{

    
    for(UIButton * cardButton in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        self.matchLabel.text =self.game.lastMatch;
        
    
    }

}

-(NSString *) titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *) backgroundImageForCard:(Card *) card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}



@end

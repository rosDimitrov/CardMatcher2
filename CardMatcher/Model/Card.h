//
//  Card.h
//  CardMatcher
//
//  Created by Ross Whyte on 4/6/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString * contents;

@property(nonatomic,getter=isChosen) BOOL chosen;
@property(nonatomic,getter=isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;

@end

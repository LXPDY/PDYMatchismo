//
//  PlayingCardDeck.m
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/10/31.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
@implementation PlayingCardDeck
- (instancetype)init{
    self = [super init];
    if(self){
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [PlayingCard cardWithSuit:suit atRank:rank];
                [self addCard:card];
                
            }
        }
    }
    return self;
}
@end

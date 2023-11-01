//
//  CardMatchingGame.m
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/11/1.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;// of Card
@end

@implementation CardMatchingGame
- (NSMutableArray *)cards{
    if(!_cards)_cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if(self){
        for(int i = 0; i < count; i++){
            Card* card = [deck drawRandomCard];
            if(card){
                self.cards[i] = card;
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
    return (index < [self.cards count]) ? self.cards[index]:nil;
}
//#define MISMATHC_PENALTY 2
static const int MISMATHC_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }
        else{
            //match
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchSocre = [card match:@[otherCard]];
                    if(matchSocre){
                        self.score += matchSocre * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }
                    else{
                        self.score -= MISMATHC_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

-(instancetype) init{
    return nil;
}

@end

//
//  PlayingCard.m
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/10/31.
//

#import "PlayingCard.h"

@implementation PlayingCard

+ (PlayingCard *)cardWithSuit:(NSString *)suit atRank:(NSUInteger)rank{
    PlayingCard* card = [[PlayingCard alloc] init];
    card.suit = suit;
    card.rank = rank;
    return card;
}

- (NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;
+ (NSArray *)validSuits{
    return @[@"♥︎",@"♦︎",@"♠︎",@"♣︎"];
}
- (void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
-(NSString *)suit{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",
             @"9",@"10",@"J",@"Q",@"K"];
}
+ (NSUInteger)maxRank{
    return [[self rankStrings] count]-1;
}

- (void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

- (int)match:(NSArray *)otherCards{
    /*
    int score = 0;
    
    if([otherCards count] >= 1){
        PlayingCard *otherCard = [otherCards firstObject];
        if([self.suit isEqualToString:otherCard.suit]){
            score = 1;
        }else if(self.rank == otherCard.rank){
            score = 4;
        }
    }
    if([otherCards count] == 2){
        PlayingCard *otherCard = otherCards[1];
        if([self.suit isEqualToString:otherCard.suit]){
            score = score == 1 ? score + 1 : 1;
        }else if(self.rank == otherCard.rank){
            score = score == 4 ? score + 4: 4;
        }
        
        PlayingCard *card1 =otherCards[0];
        int n = [card1 match:@[otherCard]];
        score = score > n ? score :n;
        
    }
    
    unsigned long numOtherCards = [otherCards count];
        if (numOtherCards) {
            for (PlayingCard *card in otherCards) {
                if([self.suit isEqualToString:card.suit]){
                    score += 1;
                }
                else if(self.rank == card.rank){
                    score += 4;
                }
            }
        }
        if (numOtherCards > 1) {
            score += [[otherCards firstObject] match:
                [otherCards subarrayWithRange:NSMakeRange(1, numOtherCards - 1)]];
        }
    return score;
    */
    int score = 0;
    unsigned long numOtherCards = [otherCards count];
    
    if (numOtherCards) {
        for (Card *card in otherCards) {
            if ([card isKindOfClass:[PlayingCard class]]) {
                PlayingCard *otherCard = (PlayingCard *)card;
                if ([self.suit isEqualToString:otherCard.suit]) {
                    score += 1;
                } else if (self.rank == otherCard.rank) {
                    score += 4;
                }
            }
        }
    }
    if (numOtherCards > 1) {
        score += [[otherCards firstObject] match:[otherCards subarrayWithRange:NSMakeRange(1, numOtherCards - 1)]];
    }
    return score;
}

@end

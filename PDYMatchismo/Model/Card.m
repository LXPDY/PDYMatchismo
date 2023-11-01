//
//  Card.m
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/10/31.
//

#import "Card.h"

@interface Card()

@end

@implementation Card
- (int)match:(NSArray *)otherCards{
    int score = 0;
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}

@end

//
//  PlayingCard.h
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/10/31.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card
@property (strong,nonatomic)NSString *suit;
@property (nonatomic) NSUInteger rank;
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
+ (PlayingCard *)cardWithSuit:(NSString *)suit atRank:(NSUInteger) rank;
@end

NS_ASSUME_NONNULL_END

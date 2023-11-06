//
//  CardMatchingGame.h
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/11/1.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly)NSInteger score;
@property (nonatomic) NSInteger matchType;
@property (nonatomic, readonly) NSArray *lastChosenCards;
@property (nonatomic, readonly) NSInteger lastScore;

@end

NS_ASSUME_NONNULL_END

//
//  Deck.h
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/10/31.
//

#import <Foundation/Foundation.h>
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;
@end

NS_ASSUME_NONNULL_END

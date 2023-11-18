//
//  ViewController.h
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/10/31.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
//Abstract class
@interface ViewController : UIViewController
//for sub class
- (Deck *)createDeck; //abstract
@end


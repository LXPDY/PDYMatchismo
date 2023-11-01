//
//  ViewController.m
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/10/31.
//

#import "ViewController.h"
#import "Deck.h"
# import "playingCardDeck.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *filpsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic,strong) Deck *deck;
@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@end

@implementation ViewController

-(void)setFlipCount:(int)filpCount{
    _flipCount = filpCount;
    self.filpsLabel.text = [NSString stringWithFormat:@"Filps:%d",self.flipCount];
    NSLog(@"filpCount = %d",self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if([sender.currentTitle length]){
        Card* nextCard = [self.deck drawRandomCard];
        if(!nextCard){
            sender.hidden = YES;
        }
        else{
            [self.deck addCard:nextCard];
            [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                              forState:UIControlStateNormal];
            [sender setTitle:@"" forState:UIControlStateNormal];
        }
    }else{
        Card* card = [self.deck drawRandomCard];
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfrount"]
                              forState:UIControlStateNormal];
        [sender setTitle: card.contents forState:UIControlStateNormal];
    }
    self.flipCount++;
}

- (Deck *)deck{
    if(!_deck){
        _deck = [[PlayingCardDeck alloc]init];
    }
    return _deck;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.flipCount = 0;
}

@end

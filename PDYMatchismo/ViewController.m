//
//  ViewController.m
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/10/31.
//

#import "ViewController.h"
#import "Deck.h"
#import "CardMatchingGame.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic, strong) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gamemodSwicthButton;
@property (weak, nonatomic) IBOutlet UILabel *flipDescription;
@property (strong, nonatomic) NSMutableArray *flipHistory;
@property (weak, nonatomic) IBOutlet UISlider *historySlider;
@end

@implementation ViewController

- (CardMatchingGame *)game{
    if(!_game)
    {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck: [self createDeck]];
       [self gameModelSwitch:self.gamemodSwicthButton];
    }
    return _game;
}


- (IBAction)touchCardButton:(UIButton *)sender {
    unsigned long cardIndex = [self.cardButtons indexOfObject:sender];
    self.gamemodSwicthButton.enabled = NO;
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
}

-(void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        unsigned long cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle: [self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]  forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%ld",self.game.score];
    if (self.game) {
            NSString *description = @"";
            if ([self.game.lastChosenCards count]) {
                NSMutableArray *cardContents = [NSMutableArray array];
                for (Card *card in self.game.lastChosenCards) {
                    [cardContents addObject:card.contents];
                }
                description = [cardContents componentsJoinedByString:@" "];
            }
            if (self.game.lastScore > 0) {
                description = [NSString stringWithFormat:@"Matched %@ for %ld points.", description, self.game.lastScore];
            } else if (self.game.lastScore < 0) {
     
                description = [NSString stringWithFormat:@"%@ don’t match! %ld point penalty!", description, -self.game.lastScore];
            }
            self.flipDescription.text = description;
            
            self.flipDescription.alpha = 1;
            if (![description isEqualToString:@""]
                && ![[self.flipHistory lastObject] isEqualToString:description]) {
                [self.flipHistory addObject:description];
                [self setSliderRange];
            }
    }
}
    

- (void)setSliderRange
{
    long maxValue = [self.flipHistory count] - 1;
    self.historySlider.maximumValue = maxValue;
    [self.historySlider setValue:maxValue animated:YES];
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfrount": @"cardback"];
}



- (Deck *)createDeck    //abstract
{
    return nil;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}
- (IBAction)dealButtonAction:(UIButton *)sender {
    self.game = nil;
    self.gamemodSwicthButton.enabled = YES;
    self.flipHistory = nil;
    [self updateUI];
}
- (IBAction)gameModelSwitch:(UISegmentedControl *)sender {
    self.game.matchType = [[sender titleForSegmentAtIndex:sender.selectedSegmentIndex] integerValue];
}
- (IBAction)changeSlider:(UISlider *)sender {
    long sliderValue;
    sliderValue = lroundf(self.historySlider.value);
    [self.historySlider setValue:sliderValue animated:NO];
    if ([self.flipHistory count]) {
        self.flipDescription.alpha =
            (sliderValue + 1 < [self.flipHistory count]) ? 0.6 : 1.0;
        self.flipDescription.text =
        [self.flipHistory objectAtIndex:sliderValue];
    }
}

- (NSMutableArray *)flipHistory
{
    if (!_flipHistory) {
        _flipHistory = [NSMutableArray array];
    }
    return _flipHistory;
}

@end

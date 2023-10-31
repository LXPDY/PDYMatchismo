//
//  ViewController.m
//  PDYMatchismo
//
//  Created by LX_PDY on 2023/10/31.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *filpsLabel;
@property (nonatomic) int filpCount;
@end

@implementation ViewController

-(void)setFilpCount:(int)filpCount{
    _filpCount = filpCount;
    self.filpsLabel.text = [NSString stringWithFormat:@"Filps:%d",self.filpCount];
    NSLog(@"filpCount = %d",self.filpCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfrount"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    self.filpCount++;
}

@end

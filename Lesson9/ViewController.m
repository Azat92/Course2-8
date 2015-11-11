//
//  ViewController.m
//  Lesson9
//
//  Created by Azat Almeev on 29.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(changeButtonPos) userInfo:nil repeats:YES];
}

- (IBAction)game:(id)sender {
    if(self.check !=1)
    self.score.text = [NSString stringWithFormat:@"%d",self.score.text.intValue + 1];
    self.check = 1;
    
}

-(void)changeButtonPos{
    CGRect screen = [[UIScreen mainScreen]bounds];
    CGSize size = screen.size;
    self.Y.constant = arc4random_uniform(size.width);
    self.X.constant = arc4random_uniform(size.height);
    self.clicks.text = [NSString stringWithFormat:@"%d",self.clicks.text.intValue + 1];
    self.check = 0;
}

@end



//
//  SecondViewController.m
//  Lesson9
//
//  Created by Никита Солдатов on 13.11.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UILabel *secondLabel;
@property (nonatomic,strong) UIButton *randomButton;
@property (nonatomic,strong) NSLayoutConstraint *leftBorder;
@property (nonatomic,strong) NSLayoutConstraint *upBorder;
@property (nonatomic,strong) NSLayoutConstraint *downBorder;
@property (nonatomic,strong) NSLayoutConstraint *rightBorder;
@property (nonatomic,strong) NSLayoutConstraint *height;
@property (nonatomic,strong) NSLayoutConstraint *weight;
@property (nonatomic) NSInteger counterForChangingPosition;
@property (nonatomic) NSInteger counterForTaps;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 100)];
    self.secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(390, 10, 50, 100)];
    self.randomButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.randomButton.translatesAutoresizingMaskIntoConstraints=NO;
    self.secondLabel.text = @"0";
    self.label.text=@"0";
    self.randomButton.backgroundColor = [UIColor redColor];
    self.randomButton.tintColor=[UIColor whiteColor];
    [self.view addSubview:self.label];
    [self.view addSubview:self.secondLabel];
    [self.randomButton setTitle:@"Catch me:)" forState:UIControlStateNormal];
    [self.view addSubview:self.randomButton];
//    self.height = [NSLayoutConstraint constraintWithItem:self.randomButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.randomButton attribute:NSLayoutAttributeHeight multiplier:1.0f constant:5.0f];
//    self.weight = [NSLayoutConstraint constraintWithItem:self.randomButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.label attribute:NSLayoutAttributeWidth multiplier:1.0f constant:100.0f];
    self.leftBorder = [NSLayoutConstraint constraintWithItem:self.randomButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:arc4random_uniform(500)];
    self.upBorder = [NSLayoutConstraint constraintWithItem:self.randomButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.label attribute:NSLayoutAttributeBottom multiplier:1.0f constant:arc4random_uniform(500)];
    self.downBorder = [NSLayoutConstraint constraintWithItem:self.randomButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-20.0f];
    self.rightBorder = [NSLayoutConstraint constraintWithItem:self.randomButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:-20.0f];
    [self.view addConstraints:@[self.leftBorder, self.upBorder, self.downBorder, self.rightBorder]];
    [self.randomButton addTarget:self action:@selector(randomButtonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self performSelector:@selector(changePossitionOfRandomButton) withObject:nil afterDelay:0.1];
}
-(void)changePossitionOfRandomButton{
    self.counterForChangingPosition ++;
    if (_counterForChangingPosition < 50){
    self.label.text=[NSString stringWithFormat:@"%ld",(long)self.counterForChangingPosition];
    self.leftBorder.constant=arc4random_uniform(400);
    self.upBorder.constant=arc4random_uniform(700);
    [self performSelector:@selector(changePossitionOfRandomButton) withObject:nil afterDelay:0.1];
    }else{
        self.label.text=[NSString stringWithFormat:@"%ld",(long)self.counterForChangingPosition];
        self.leftBorder.constant=arc4random_uniform(400);
        self.upBorder.constant=arc4random_uniform(700);
        [self performSelector:@selector(changePossitionOfRandomButton) withObject:nil afterDelay:1];
    }
    
}
-(IBAction)randomButtonDidPressed:(id)sender{
    self.counterForTaps ++;
    self.secondLabel.text=[NSString stringWithFormat:@"%ld",(long)self.counterForTaps];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

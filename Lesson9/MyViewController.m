//
//  MyViewController.m
//  Lesson9
//
//  Created by Никита Солдатов on 10.11.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View did load");
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    label.text=@"sad";
    self.label2.text=@"asd";
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSLog(@"View did Appear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

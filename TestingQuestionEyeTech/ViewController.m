//
//  ViewController.m
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 18/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    }
-(void)viewDidAppear:(BOOL)animated{
    [self performSelector:@selector(setup) withObject:self afterDelay:0.05];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setup{
    
    
    //MCQHoriz* ans1=[[MCQHoriz alloc]init];
    MultipleChoiceQuestion* ans1=[[MultipleChoiceQuestion alloc]init];

    
    self.hold=(NSObject*)ans1;
    NSArray* answerArray=[[NSArray alloc]initWithObjects:@"Most of the time",@"All of the time",@"Not all of the time but some of the time",@"guaranteed holiday", nil];
    UIView* toDisplay=[ans1 setupWithQuestion:@"where am i now?" questionNumber:@"2)" MultiAnswers:answerArray mode:MCMMulti];
    [self.view addSubview:toDisplay];
    [self.view setNeedsDisplay];
    
}

@end

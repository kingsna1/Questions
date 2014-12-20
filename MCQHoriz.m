//
//  MCQHoriz.m
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 20/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import "MCQHoriz.h"

@interface MCQHoriz ()

@end

@implementation MCQHoriz

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView*)setupWithQuestion:(NSString*)questionString questionNumber:(NSString*)questionNumber MultiAnswers:(NSArray*) answerStrings mode:(multipleChoiceMode)mode
{
    //----Set up dimensions----///
    [self setupDimensions];
    
    //-----set up question----///
    QuestionViewController* question=[[QuestionViewController alloc] init];
    questionViewController=question;
    UIView* questionView=[question setupWithQNumber:questionNumber andQ:questionString andQinstruct:@"Tap"];
    
    //--Set up answers------//
    mcHoriz=[[MCHorizViewController alloc]init];
    UIView* answerView=[mcHoriz setupWithMultiAnswers:answerStrings mode:mode];
    float yPos=questionView.center.y+(questionView.bounds.size.height/2.0)+hSpaceQtoAns;
    CGRect ansRect=CGRectMake(0, yPos, answerView.bounds.size.width, answerView.bounds.size.height);
    answerView.frame=ansRect;
    
    
    //----Create and fill a combined view-//
    UIView* encompassingView=[[UIView alloc] init];
    CGRect overAllRect=CGRectMake(0, 0, screenWidth,answerView.center.y+answerView.frame.size.height);
    encompassingView.frame=overAllRect;
    self.view=encompassingView;
    
    [encompassingView addSubview:questionView];
    [encompassingView addSubview:answerView];
    
    
    
    
    return encompassingView;
    
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

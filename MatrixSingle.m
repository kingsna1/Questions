//
//  MatrixSingle.m
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 22/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import "MatrixSingle.h"

@interface MatrixSingle ()

@end

@implementation MatrixSingle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView*)setupWithQuestion:(NSString*)questionString questionNumber:(NSString*)questionNumber MultiAnswers:(NSArray*) answerStrings mode:(MatrixMode)mode
{
    [self createQuestion:questionString AndQuestionNumber:questionNumber];
    return nil;
}


-(UIView*)createQuestion:(NSString*)questionString AndQuestionNumber:(NSString*)questionNumber
{
    //Set up fonts
    
    UIFont* fontNum=[UIFont boldSystemFontOfSize:19];
    UIFont* fontQ=[UIFont boldSystemFontOfSize:19];
    
    
    //Set up number Label
    UILabel* numLabel=[[UILabel alloc]init];
    
    numLabel=[[UILabel alloc] init];
    numLabel.font=fontNum;
    numLabel.lineBreakMode=NSLineBreakByWordWrapping;
    CGSize numMaxLabelSize=CGSizeMake(questionNumberWidth, FLT_MAX);
    CGSize numExpectLabelSize=[questionNumber sizeWithFont:fontNum constrainedToSize:numMaxLabelSize lineBreakMode:NSLineBreakByWordWrapping];
    CGRect numLabelRect =CGRectMake(0, 0, questionNumberWidth, numExpectLabelSize.height);
    numLabel.frame=numLabelRect;
    numLabel.text=questionNumber;
    numLabel.numberOfLines=0;
    
    
    
    //Set up question Label
    UILabel* questionLabel=[[UILabel alloc] init];

    questionLabel=[[UILabel alloc] init];
    questionLabel.font=fontQ;
    questionLabel.lineBreakMode=NSLineBreakByWordWrapping;
    CGSize qMaxLabelSize=CGSizeMake(questionTextWidth, FLT_MAX);
    CGSize qExpectLabelSize=[questionString sizeWithFont:fontQ constrainedToSize:qMaxLabelSize lineBreakMode:NSLineBreakByWordWrapping];
    CGRect qLabelRect =CGRectMake(0, 0, questionTextWidth, qExpectLabelSize.height);
    questionLabel.bounds=qLabelRect;
    questionLabel.text=questionString;
    questionLabel.numberOfLines=0;
    
    
    
    //---Place both number and question together--appropriately
    
    

    //Position number
    
    CGRect numRect=CGRectMake(wSpaceScrToNum, 0, numLabel.bounds.size.width, numLabel.bounds.size.height);
    numLabel.frame=numRect;
    
    
    //Position question
    
    CGRect qRect=CGRectMake(numLabel.center.x+(numLabel.bounds.size.width/2.0), 0, questionLabel.bounds.size.width, questionLabel.bounds.size.height);
    questionLabel.frame=qRect;
    
    
    // find the largest height
    
    float largestHeight;
    if (numLabel.bounds.size.height>questionLabel.bounds.size.height)
    {
        largestHeight=numLabel.bounds.size.height;
    }
    else
    {
            largestHeight=questionLabel.bounds.size.height;
    }
    
    UIView* encompassingView=[[UIView alloc] init];
    CGRect encompRect=CGRectMake(0, 0, questionLabel.center.x +(questionLabel.bounds.size.width/2.0), largestHeight);
    encompassingView.frame=encompRect;
    
    [encompassingView addSubview:numLabel];
    [encompassingView addSubview:questionLabel];
    
    
    
    return encompassingView;
}

-(void)setupDimensions
{
    //All of the major sizes of the elements
    screenWidth=768;
    screenHeight=1024;
    questionTextWidth=650;
    questionNumberWidth=40.0;
    answerBoxWidth=30;
    minTitleWidth=30;
    allAnswerWidth=500;
    
    //SpacingsBetweenElements
    wSpaceScrToNum=40;// width screen to number
    wSpaceNumToQ=20; // width number to question
    wSpaceQtoAns=10;
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

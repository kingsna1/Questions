//
//  QuestionViewController.m
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 18/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView*)setupWithQNumber:(NSString*)qNumber andQ:(NSString*)qText andQinstruct:(NSString*)qInstruct
{
    //Set up all dimensions
    [self setupDimensions];
    
    //setUp font
    
    UIFont* fontNum=[UIFont boldSystemFontOfSize:19];
    UIFont* fontQ=[UIFont boldSystemFontOfSize:19];
    UIFont* fontIns=[UIFont boldSystemFontOfSize:15];
    
    //Set up Number label
    _questionNumber=[[UILabel alloc] init];
    _questionNumber.font=fontNum;
    _questionNumber.lineBreakMode=NSLineBreakByWordWrapping;
    CGSize numMaxLabelSize=CGSizeMake(questionNumberWidth, FLT_MAX);
    CGSize numExpectLabelSize=[qNumber sizeWithFont:fontNum constrainedToSize:numMaxLabelSize lineBreakMode:NSLineBreakByWordWrapping];
    CGRect numLabelRect =CGRectMake(0, 0, questionNumberWidth, numExpectLabelSize.height);
    _questionNumber.frame=numLabelRect;
    _questionNumber.text=qNumber;
    _questionNumber.numberOfLines=0;
    
    
    //Set up Question Label
    _questionText=[[UILabel alloc] init];
    _questionText.font=fontQ;
    _questionText.lineBreakMode=NSLineBreakByWordWrapping;
    CGSize qMaxLabelSize=CGSizeMake(questionTextWidth, FLT_MAX);
    CGSize qExpectLabelSize=[qText sizeWithFont:fontQ constrainedToSize:qMaxLabelSize lineBreakMode:NSLineBreakByWordWrapping];
    CGRect qLabelRect =CGRectMake(0, 0, questionTextWidth, qExpectLabelSize.height);
    _questionText.bounds=qLabelRect;
    _questionText.text=qText;
    _questionText.numberOfLines=0;
    
    //Set up intstructionLabel
    _questionInstructions=[[UILabel alloc] init];
    _questionInstructions.font=fontIns;
    _questionInstructions.lineBreakMode=NSLineBreakByWordWrapping;
    CGSize insMaxLabelSize=CGSizeMake(questionInstructionWidth, FLT_MAX);
    CGSize insExpectLabelSize=[qInstruct sizeWithFont:fontIns constrainedToSize:insMaxLabelSize lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect insLabelRect =CGRectMake(0, 0, questionInstructionWidth, insExpectLabelSize.height);
    _questionInstructions.bounds=insLabelRect;
    _questionInstructions.text=qInstruct;
     _questionInstructions.numberOfLines=0;
    
    
    //--------------- Position all in a view ---------//
    

    
    //Position number
    NSLog(@" Before:%@",NSStringFromCGRect( _questionNumber.frame));

    _questionNumber.center=CGPointMake(_questionNumber.center.x+wSpaceScrToNum, _questionNumber.center.y);
    NSLog(@" After:%@",NSStringFromCGRect( _questionNumber.frame));
    
    //Position question
    float qTextXPos=_questionNumber.center.x+(_questionNumber.bounds.size.width/2.0)+wSpaceNumToQ;
    CGRect qTextFrame=CGRectMake(qTextXPos, 0, _questionText.bounds.size.width, _questionText.bounds.size.height);
    _questionText.frame=qTextFrame;
    //NSLog(@" Question frame:%@",NSStringFromCGRect( _questionText.frame));

    
    
    //Position Instructions
    float insYPos=_questionText.center.y+(_questionText.bounds.size.height/2.0)+hSpaceQtoIns;
    float insXpos=_questionText.center.x+(_questionText.bounds.size.width/2.0)-_questionInstructions.frame.size.width;
    CGRect insFrame=CGRectMake(insXpos, insYPos, _questionInstructions.bounds.size.width, _questionInstructions.bounds.size.height);
    _questionInstructions.frame=insFrame;
    _questionInstructions.textAlignment=NSTextAlignmentRight;
    //NSLog(@" Instruct frame:%@",NSStringFromCGRect( _questionInstructions.frame));

    
    
    
    
    // Put all in view
    UIView* encompassingView=[[UIView alloc]init];
    float encomHeight=_questionInstructions.center.y + (_questionInstructions.frame.size.height/2.0);
    encompassingView.frame= CGRectMake(0, 0, screenWidth, encomHeight);
    
    [encompassingView addSubview:_questionNumber];
    [encompassingView addSubview:_questionText];
    [encompassingView addSubview:_questionInstructions];
    
    return encompassingView;
    


}

-(void)setupDimensions{
    
    
    
    //All of the major sizes of the elements
     screenWidth=768;
     screenHeight=1024;
     questionTextWidth=650;
     questionNumberWidth=40.0;
     questionInstructionWidth=100;
    
    //SpacingsBetweenElements
     wSpaceScrToNum=40;// width screen to number
     wSpaceNumToQ=20; // width number to question
     hSpaceQtoIns=10; //height Q to ins
    
    
    
    
    
    
    
    
    
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

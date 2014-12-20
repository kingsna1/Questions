//
//  MultipleChoiceQuestion.h
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 19/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionViewController.h"
#import "MultipleChoiceViewController.h"
@interface MultipleChoiceQuestion : UIViewController
{
    @protected
    
    QuestionViewController* questionViewController;
    MultipleChoiceViewController* multipleChoiceViewController;
    float hSpaceQtoAns;
    float screenWidth;
    float screenHeight;
}


-(UIView*)setupWithQuestion:(NSString*)questionString questionNumber:(NSString*)questionNumber MultiAnswers:(NSArray*) answerStrings mode:(multipleChoiceMode)mode;
-(NSMutableArray*)results;
-(void)setupDimensions;

@end

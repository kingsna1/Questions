//
//  MCQHoriz.h
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 20/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import "MultipleChoiceQuestion.h"
#import "MCHorizViewController.h"

@interface MCQHoriz : MultipleChoiceQuestion
{
    MCHorizViewController* mcHoriz;

}
-(UIView*)setupWithQuestion:(NSString*)questionString questionNumber:(NSString*)questionNumber MultiAnswers:(NSArray*) answerStrings mode:(multipleChoiceMode)mode;
-(NSMutableArray*)results;


@end

//
//  MatrixSingle.h
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 22/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import "ViewController.h"



typedef enum MatrixMode{MMOne}MatrixMode;


@interface MatrixSingle : ViewController
{
    @protected
    //All of the major sizes of the elements
    float screenWidth;
    float screenHeight;
    
    //Width of elements
    float questionTextWidth;
    float questionNumberWidth;
    float questionInstructionWidth;
    float answerBoxWidth;
    float minTitleWidth;
    float allAnswerWidth; //Width associated with fitting in all answers
    
    
    //SpacingsBetweenElements
    float wSpaceScrToNum;// width screen to number
    float wSpaceNumToQ; // width number to question
    float wSpaceQtoAns;
}




-(UIView*)setupWithQuestion:(NSString*)questionString questionNumber:(NSString*)questionNumber MultiAnswers:(NSArray*) answerStrings mode:(MatrixMode)mode;

@end

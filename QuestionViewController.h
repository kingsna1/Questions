//
//  QuestionViewController.h
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 18/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import <UIKit/UIKit.h>

/*All of the major sizes of the elements
#define screenWidth 768.0
#define screenHeight 1024.0
#define questionTextWidth 650.0
#define questionNumberWidth 42.0
#define questionInstructionWidth 70.0

//SpacingsBetweenElements
#define wSpaceScrToNum 40.0// width screen to number
#define wSpaceNumToQ 40.0 // width number to question
#define hSpaceQtoIns 40.0 //height Q to ins
 */



@interface QuestionViewController : UIViewController
{
    @protected
    //All of the major sizes of the elements
    float screenWidth;
    float screenHeight;
    float questionTextWidth;
    float questionNumberWidth;
    float questionInstructionWidth;
    
    //SpacingsBetweenElements
    float wSpaceScrToNum;// width screen to number
    float wSpaceNumToQ; // width number to question
    float hSpaceQtoIns; //height Q to ins
    
}

@property(nonatomic,strong) UILabel* questionText;
@property(nonatomic,strong) UILabel* questionNumber;
@property(nonatomic,strong) UILabel* questionInstructions;

-(UIView*)setupWithQNumber:(NSString*)qNumber andQ:(NSString*)qText andQinstruct:(NSString*)qInstruct;



@end

//
//  MultipleChoiceViewController.h
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 19/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum multipleChoiceMode{MCMOne, MCMMulti, MCMZeroOrOne, MCMZeroOrMulti}multipleChoiceMode;

@interface MultipleChoiceViewController : UIViewController
{
    @protected
    //All of the major sizes of the elements
    
    float screenWidth;
    float screenHeight;
    float singleAnsWidth;
    
    float wSpaceScrToAns;
    float wSpaceAnsToBut;
    float hSpaceAnstoAns;
    
    float ansWidth;
    float butWidth;
    float butHeight;
    

}
@property(strong,nonatomic)UIView* encompassingView;
@property(strong,nonatomic)NSMutableArray* arrayOfViews; //where the views are kept
@property(strong,nonatomic)NSMutableArray* arrayOfBools; //Where the answers are kept

-(UIView*)setupWithMultiAnswers:(NSArray*) answerStrings mode:(multipleChoiceMode)mode
;
-(void)updateAllButtons;

@end

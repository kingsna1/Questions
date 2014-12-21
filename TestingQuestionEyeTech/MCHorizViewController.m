//
//  MCHorizViewController.m
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 20/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import "MCHorizViewController.h"

@interface MCHorizViewController ()

@end

@implementation MCHorizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupDimensions
{
    
    
    //All of the major sizes of the elements
    screenWidth=768;
    screenHeight=1024;

    
    wSpaceScrToAns=0;
    wSpaceAnsToBut=10;
    hSpaceAnstoAns=10;
    wSpaceAnsToAns=10;

    ansWidth=130;
    butWidth=30;
    butHeight=30;
    
    //New
    wSpaceScreenToFirst=60;
    noOfHorizAns=3;
    singleAnsWidth=wSpaceAnsToAns+ansWidth+wSpaceAnsToBut+butWidth;

}

-(UIView*)positionAllViews:(NSMutableArray*)arrayOfAnswerViews
{
    //---------- position the answers------//
    
    
    UIView* encompassingView=[[UIView alloc] init];
    float yPos=0;
    float currentHeight=0;
    float xPos=wSpaceScreenToFirst;
    for (int i=0; i<[arrayOfAnswerViews count]; i++)
    {
        UIView* currentAnswer=[arrayOfAnswerViews objectAtIndex:i];
        CGRect ansRect=CGRectMake(xPos, yPos, currentAnswer.bounds.size.width, currentAnswer.bounds.size.height);
        currentHeight=yPos+currentAnswer.bounds.size.height;
        
        currentAnswer.frame=ansRect;
        
        if (((i+1)%3)==0) {
            yPos=yPos+currentAnswer.bounds.size.height+hSpaceAnstoAns;
            xPos=wSpaceScreenToFirst;
        }
        else
        {
            xPos=xPos+currentAnswer.bounds.size.width+wSpaceAnsToAns;
            NSLog(@"currentAnswerWidth :%f",wSpaceAnsToAns);
        }
        
    }
    
    
    //----add answers to positioning view---///
    encompassingView.frame=CGRectMake(0, 0, screenWidth, currentHeight);
    
    
    for (int i=0; i<[arrayOfAnswerViews count]; i++)
    {
        [encompassingView addSubview:[arrayOfAnswerViews objectAtIndex:i]];
        
    }
    [self updateAllButtons];
    self.encompassingView=encompassingView;
    
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

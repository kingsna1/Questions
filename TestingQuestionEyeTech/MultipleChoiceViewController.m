//
//  MultipleChoiceViewController.m
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 19/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import "MultipleChoiceViewController.h"

@interface MultipleChoiceViewController ()

@end

@implementation MultipleChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView*)setupWithMultiAnswers:(NSArray*) answerStrings mode:(multipleChoiceMode)mode
{
    //Set up array which stores all of the answers views
    NSMutableArray* arrayOfAnswerViews=[[NSMutableArray alloc]init];
    self.arrayOfViews=arrayOfAnswerViews;
    UIView* singleChoice=[[UIView alloc] init];
    
    for (int i=0; i<[answerStrings count]; i++)
    {
        NSString* answerText=[answerStrings objectAtIndex:i];
        singleChoice=[self createSingleAnswer:answerText];
        [arrayOfAnswerViews addObject:singleChoice];
    }
    
    //---------- tagEachAnswer and make sure the IBAction comes back to self--------//
    //---Instigate data Storage---/
    self.arrayOfBools=[[NSMutableArray alloc] init];
    for (int i=0; i<[arrayOfAnswerViews count]; i++)
    {
        UIView* current=[arrayOfAnswerViews objectAtIndex:i];
        UIButton* currentButton=[[current subviews] objectAtIndex:1];
        currentButton.tag=i;
        [currentButton addTarget:self action:@selector(tickButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.arrayOfBools addObject:[NSNumber numberWithBool:NO]];
    }
    
    
    
    //---------- position the answers------//
    
    
    
    self.encompassingView=[self positionAllViews:arrayOfAnswerViews];
    
    return self.encompassingView;
}


-(void)setupDimensions
{

    
    //All of the major sizes of the elements
    singleAnsWidth=768;
    screenWidth=768;
    screenHeight=1024;
    wSpaceScrToAns=100;
    wSpaceAnsToBut=70;
    hSpaceAnstoAns=10;
    
    ansWidth=550;
    butWidth=30;
    butHeight=30;

}

-(UIView*)positionAllViews:(NSMutableArray*)arrayOfAnswerViews
{
    //---------- position the answers------//
    
    
    UIView* encompassingView=[[UIView alloc] init];
    float yPos=0;
    float currentHeight=0;
    for (int i=0; i<[arrayOfAnswerViews count]; i++)
    {
        UIView* currentAnswer=[arrayOfAnswerViews objectAtIndex:i];
        CGRect ansRect=CGRectMake(0, yPos, currentAnswer.bounds.size.width, currentAnswer.bounds.size.height);
        currentHeight=yPos+currentAnswer.bounds.size.height;

        currentAnswer.frame=ansRect;
        
        yPos=yPos+currentAnswer.bounds.size.height+hSpaceAnstoAns;
        
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

-(UIView*)createSingleAnswer:(NSString*)answerText
{
    //setup dimensions
    [self setupDimensions];
    
    //setUp font
    
    UIFont* fontAns=[UIFont systemFontOfSize:17];

    
    //Setup Answer label
    UILabel* answerLabel=[[UILabel alloc] init];
    
    answerLabel.font=fontAns;
    answerLabel.lineBreakMode=NSLineBreakByWordWrapping;
    CGSize ansMaxLabelSize=CGSizeMake(ansWidth, FLT_MAX);
    CGSize ansExpectLabelSize=[answerText sizeWithFont:fontAns constrainedToSize:ansMaxLabelSize lineBreakMode:NSLineBreakByWordWrapping];
    CGRect ansLabelRect=CGRectMake(0, 0, ansWidth, ansExpectLabelSize.height);
    answerLabel.frame=ansLabelRect;
    answerLabel.text=answerText;
    answerLabel.numberOfLines=0;
    answerLabel.textAlignment=NSTextAlignmentLeft;
    
    //Setup button
    UIButton* tickButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    tickButton.frame=CGRectMake(0, 0, butWidth, butHeight);
    
    
    //-----------------Position all in a view-------//
    UIView* encompassingView=[[UIView alloc] init];
    
    //-position answer--/
    CGRect ansRect=CGRectMake(wSpaceScrToAns, 0,answerLabel.frame.size.width, answerLabel.frame.size.height);
    answerLabel.frame=ansRect;
    
    //Position button---/
    
    float xPosBut=answerLabel.center.x+(answerLabel.bounds.size.width/2.0)+wSpaceAnsToBut;
    CGRect butRect=CGRectMake(xPosBut, 0, tickButton.bounds.size.width, tickButton.bounds.size.height);
    tickButton.frame=butRect;
    tickButton.hidden=NO;
    
    //Find out whether the answer or the button is bigger
    float yHeight;
    
    if (tickButton.bounds.size.height>answerLabel.bounds.size.height)
    {
        yHeight=tickButton.bounds.size.height;
    }
    else
    {
        yHeight=answerLabel.bounds.size.height;
    }
    
    CGRect encompRect=CGRectMake(0, 0,singleAnsWidth, yHeight);
    encompassingView.frame=encompRect;
    
    [encompassingView addSubview:answerLabel];
    [encompassingView addSubview:tickButton];
    
    return encompassingView;
}
-(void)tickButtonPressed:(id)object{
    
    // this configures how the mode affects the button display

    multipleChoiceMode myChoice=MCMMulti;
    
    UIButton* button=object;
    int tag=button.tag;
    
    if (myChoice==MCMOne)
    {
        
        for (int i=0; i<[self.arrayOfBools count]; i++)
        {
            [self.arrayOfBools replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:FALSE]];
        }
        
        [self.arrayOfBools replaceObjectAtIndex:tag withObject:[NSNumber numberWithBool:YES]];
    }
    else if (myChoice==MCMMulti)
    {
        NSNumber* num=[self.arrayOfBools objectAtIndex:tag];
        NSNumber* replace;
        if (num.boolValue==YES) {
            replace=[NSNumber numberWithBool:FALSE];
            
        }
        else
        {
            replace=[NSNumber numberWithBool:TRUE];
        }
        
        [self.arrayOfBools replaceObjectAtIndex:tag withObject:replace];
        
    }
    else if (myChoice==MCMZeroOrOne)
    {
        for (int i=0; i<[self.arrayOfBools count]; i++)
        {
            if (i==tag)
            {
                //Do nothing
            }
            else
            {
                [self.arrayOfBools replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:FALSE]];
            }
        }
        
        NSNumber* num=[self.arrayOfBools objectAtIndex:tag];
        NSNumber* replace;
        if (num.boolValue==YES) {
            replace=[NSNumber numberWithBool:FALSE];
            
        }
        else
        {
            replace=[NSNumber numberWithBool:TRUE];
        }
        
        [self.arrayOfBools replaceObjectAtIndex:tag withObject:replace];
    }
    
    [self updateAllButtons];
    
}
-(void)updateAllButtons{
    
    //---- for each potential answer , check the stored data and then displey
    // the right buttons
    
    for (int i=0; i<[self.arrayOfViews count]; i++)
    {
        UIButton* button=[[[self.arrayOfViews objectAtIndex:i] subviews] objectAtIndex:1];
        NSNumber* boolVal=[self.arrayOfBools objectAtIndex:i];
        
        if([boolVal boolValue]==TRUE)
        {
            [button setBackgroundImage:[UIImage imageNamed:@"tick_box@2x.png"] forState:UIControlStateNormal];
        }
        else
        {
            [button setBackgroundImage:[UIImage imageNamed:@"blank_box@2x.png"] forState:UIControlStateNormal];
        }

        
    }
  
    
    
}

@end

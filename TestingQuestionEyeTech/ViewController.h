//
//  ViewController.h
//  TestingQuestionEyeTech
//
//  Created by Kingsnorth, Alec (Student) on 18/12/2014.
//  Copyright (c) 2014 Kingsnorth, Alec (Student). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionViewController.h"
#import "MultipleChoiceViewController.h"
#import "MultipleChoiceQuestion.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (strong, nonatomic) NSObject* hold;


@end


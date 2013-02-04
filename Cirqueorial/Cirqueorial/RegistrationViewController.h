//
//  RegistrationViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 01/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "BSKeyboardControls.h"

@interface RegistrationViewController : UIViewController <UITextFieldDelegate, BSKeyboardControlsDelegate, UITextViewDelegate>

- (IBAction)confirmButton:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *inConfirmPassword;
@property (strong, nonatomic) IBOutlet UITextField *inPassword;
@property (strong, nonatomic) IBOutlet UITextField *inEmail;
@property (strong, nonatomic) IBOutlet UITextField *inSurname;
@property (strong, nonatomic) IBOutlet UITextField *inFirstName;

@property (nonatomic, strong) BSKeyboardControls *keyboardControls;
<<<<<<< HEAD
=======


@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
>>>>>>> Attempt at a scrollable reg page - not working



@property (strong, nonatomic) IBOutlet UIView *movingObj;


@end

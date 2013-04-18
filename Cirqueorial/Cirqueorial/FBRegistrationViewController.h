//
//  FBRegistrationViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 17/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BSKeyboardControls.h"

@interface FBRegistrationViewController : UIViewController <UITextFieldDelegate, BSKeyboardControlsDelegate, UITextViewDelegate>


@property (strong, nonatomic) IBOutlet UITextField *inFirstName;
@property (strong, nonatomic) IBOutlet UITextField *inSurname;
@property (strong, nonatomic) IBOutlet UITextField *inUsername;
@property (strong, nonatomic) IBOutlet UITextField *inEmail;

@property (strong, nonatomic) IBOutlet UITextField *inPassword;
@property (strong, nonatomic) IBOutlet UITextField *inConfirmPassword;

@property (strong, retain) NSString *vFirstName;
@property (strong, retain) NSString *vSurname;
@property (strong, retain) NSString *vUsername;
@property (strong, retain) NSString *vEmail;

- (IBAction)confirmButton:(id)sender;

@property (strong, nonatomic) IBOutlet FBProfilePictureView *fbProfile;

@property (nonatomic, strong) BSKeyboardControls *keyboardControls;


@end

//
//  AuthenticationViewController.h
//  Cirqueorial
//
//  Created by Tom Salu on 04/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AuthenticationViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *fPassword;
@property (strong, nonatomic) IBOutlet UITextField *fUsername;

- (IBAction)attemptLogin:(id)sender;

@end

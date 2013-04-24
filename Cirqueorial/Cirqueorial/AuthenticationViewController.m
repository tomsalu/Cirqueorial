//
//  AuthenticationViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 04/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "AuthenticationViewController.h"
#import "AnimationViewController.h"

@interface AuthenticationViewController ()

@end

@implementation AuthenticationViewController

bool authSuccess;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.fUsername.borderStyle = UITextBorderStyleRoundedRect;
    self.fPassword.borderStyle = UITextBorderStyleRoundedRect;
    
    //BSKeyboardControls//
    
    NSArray *fields = @[ self.fUsername, self.fPassword];
    
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:fields]];
    [self.keyboardControls setDelegate:self];
    
    //////////////////////
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.fPassword||self.fUsername) {
        [self.fPassword resignFirstResponder];
        [self.fUsername resignFirstResponder];
        
    }
    return YES;
}

// BSKeyBoard Controls Methods//
- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [keyboardControls.activeField resignFirstResponder];
}

- (void)keyboardControls:(BSKeyboardControls *)keyboardControls selectedField:(UIView *)field inDirection:(BSKeyboardControlsDirection)direction
{
    UIView *view = keyboardControls.activeField.superview.superview;
    //[self.tableView scrollRectToVisible:view.frame animated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.keyboardControls setActiveField:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}
////////////////////////////////


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Will query the credentials against the Parse database.

- (IBAction)attemptLogin:(id)sender {
    
    [PFUser logInWithUsernameInBackground:self.fUsername.text password:self.fPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"Success");
                                            
                                            NSString *message = [NSString stringWithFormat:@"Welcome back, %@", [user objectForKey:@"First_Name"]];
                                            
                                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful Login" message:message delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
                                            [alert show];
                                            
                                            [self performSegueWithIdentifier:@"authSegue" sender:sender];
                                            
                                            
                                        } else {
                                            // The login failed. Check error to see why.
                                            NSLog(@"Failure");
                                            
                                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unsuccessful Login" message:@"I'm sorry, you have supplied an incorrect username and/or password" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
                                            [alert show];
                                        }
                                    }];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    self.fUsername.text = nil;
    self.fPassword.text = nil;
}




@end

//
//  RegistrationViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 01/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "RegistrationViewController.h"
#import "UserViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController


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
    
    NSArray *fields = @[ self.inFirstName, self.inSurname,
    self.inEmail, self.inPassword,
    self.inConfirmPassword];
    
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:fields]];
    [self.keyboardControls setDelegate:self];
    
}

- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [keyboardControls.activeField resignFirstResponder];
}

- (void)keyboardControls:(BSKeyboardControls *)keyboardControls selectedField:(UIView *)field inDirection:(BSKeyboardControlsDirection)direction
{
    UIView *view = keyboardControls.activeField.superview.superview;
    //[self.tableView scrollRectToVisible:view.frame animated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.keyboardControls setActiveField:textField];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.keyboardControls setActiveField:textView];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.inFirstName||self.inSurname||self.inEmail||self.inPassword||self.inConfirmPassword) {
        [self.inFirstName resignFirstResponder];
        [self.inSurname resignFirstResponder];
        [self.inEmail resignFirstResponder];
        [self.inPassword resignFirstResponder];
        [self.inConfirmPassword resignFirstResponder];
        
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmButton:(id)sender {
    
    Database *db;
    db = [[Database alloc] init];
    [db newUser:self.inFirstName.text :self.inSurname.text :self.inEmail.text :self.inPassword.text];
    
    UserViewController *userView = [[UserViewController alloc] init];
    [userView reIndexTable];
    
    NSString *alertMessage = [NSString stringWithFormat:@"Congratulations %@, you have successfully registered. You are now free to use the app.", self.inFirstName.text];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful Registration" message:alertMessage delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
    [alert show];
     
    
}


@end

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
    
<<<<<<< HEAD
=======
    [self.scroller setScrollEnabled:YES];
    [self.scroller setContentSize:CGSizeMake(320, 1000)];

    
    
>>>>>>> Attempt at a scrollable reg page - not working
    NSArray *fields = @[ self.inFirstName, self.inSurname,
    self.inEmail, self.inPassword,
    self.inConfirmPassword];
    
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:fields]];
    [self.keyboardControls setDelegate:self];
    
<<<<<<< HEAD
=======
    
    
    
>>>>>>> Attempt at a scrollable reg page - not working
}

- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [keyboardControls.activeField resignFirstResponder];
<<<<<<< HEAD
=======
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
>>>>>>> Attempt at a scrollable reg page - not working
}

- (void)keyboardControls:(BSKeyboardControls *)keyboardControls selectedField:(UIView *)field inDirection:(BSKeyboardControlsDirection)direction
{
    UIView *view = keyboardControls.activeField.superview.superview;
    //[self.tableView scrollRectToVisible:view.frame animated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.keyboardControls setActiveField:textField];
    
    if (textField == self.inPassword) {
        
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:2.5 animations:^{
        
        self.movingObj.frame = CGRectMake(self.movingObj.frame.origin.x, self.movingObj.frame.origin.y-85, self.movingObj.frame.size.height, self.movingObj.frame.size.width);
            
        }];
        [UIView commitAnimations];
    }
    else if (textField == self.inConfirmPassword) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:2.5 animations:^{
        
        self.movingObj.frame = CGRectMake(self.movingObj.frame.origin.x, self.movingObj.frame.origin.y-145, self.movingObj.frame.size.height, self.movingObj.frame.size.width);
        
        }];
        [UIView commitAnimations];
    }
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField == self.inPassword) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:2.5 animations:^{

        self.movingObj.frame = CGRectMake(self.movingObj.frame.origin.x, self.movingObj.frame.origin.y+85, self.movingObj.frame.size.height, self.movingObj.frame.size.width);
            
        }];
        [UIView commitAnimations];
    }
    else if (textField == self.inConfirmPassword) {
        [UIView beginAnimations:@"Anim1" context:nil];
        [UIView animateWithDuration:2.5 animations:^{

        self.movingObj.frame = CGRectMake(self.movingObj.frame.origin.x, self.movingObj.frame.origin.y+145, self.movingObj.frame.size.height, self.movingObj.frame.size.width);
            
        }];
        [UIView commitAnimations];
    }
    
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

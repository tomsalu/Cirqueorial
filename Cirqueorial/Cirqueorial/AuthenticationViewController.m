//
//  AuthenticationViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 04/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "AuthenticationViewController.h"
#import "Database.h"
#import "UserList.h"
#import "AnimationViewController.h"

@interface AuthenticationViewController ()

@end

@implementation AuthenticationViewController

@synthesize authDB;

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
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.fPassword||self.fUsername) {
        [self.fPassword resignFirstResponder];
        [self.fUsername resignFirstResponder];
        
    }
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)attemptLogin:(id)sender {
    authDB = [[Database alloc] init];
   [authDB getUsers];
    
    int i = 0;
    authSuccess = NO;
    UserList *userObject;
    
    while (i < authDB.userArray.count && !authSuccess) {
        userObject = authDB.userArray[i];
        if ([userObject.password isEqualToString:self.fPassword.text] && [userObject.email isEqualToString:self.fUsername.text]) {
            NSLog(@"Correct Login");
            authSuccess = YES;
        }
        else{
            NSLog(@"Incorrect Login");
        }
        i++;
        
    }
    
    if (authSuccess) {
        
        NSString *message = [NSString stringWithFormat:@"Welcome back, %@", userObject.firstName];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful Login" message:message delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
        
        [self performSegueWithIdentifier:@"authSegue" sender:sender];
        
    }
    
    else{
        
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unsuccessful Login" message:@"I'm sorry, you have supplied an incorrect username and/or password" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
        
    }

    
}




@end

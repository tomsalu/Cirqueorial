//
//  FBRegistrationViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 17/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "FBRegistrationViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface FBRegistrationViewController ()

@end

@implementation FBRegistrationViewController

@synthesize fbProfile;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.inFirstName||self.inSurname||self.inUsername||self.inEmail||self.inPassword||self.inConfirmPassword) {
        [self.inFirstName resignFirstResponder];
        [self.inSurname resignFirstResponder];
        [self.inUsername resignFirstResponder];
        [self.inEmail resignFirstResponder];
        [self.inPassword resignFirstResponder];
        [self.inConfirmPassword resignFirstResponder];
        
    }
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
        
        //[activity startAnimating];
        
        NSLog(@"session state change");
    
    
        if (FBSession.activeSession.isOpen) {
            NSLog(@"IF");

            
            [FBRequestConnection
             startForMeWithCompletionHandler:^(FBRequestConnection *connection,
                                               id<FBGraphUser> user,
                                               NSError *error){
                 
                 self.inFirstName.text = user.first_name;
                 self.inSurname.text = user.last_name;
                 self.inUsername.text = user.username;
                 self.inEmail.text = [user objectForKey:@"email"];
                 fbProfile.profileID = user.id;
                 
                 
                     
             }];
        }
    
        else{
                NSLog(@"ELSE");

        }
}
    


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmButton:(id)sender {
    PFUser *user = [PFUser user];
    
    if ([self.inPassword.text isEqual:self.inConfirmPassword.text]) {
        //Passwords match up
        user.password = self.inPassword.text;
        
        user.email = self.inEmail.text;
        user.username = self.inUsername.text;
        [user setObject:self.inFirstName.text forKey:@"First_Name"];
        [user setObject:self.inSurname.text forKey:@"Surname"];
        if (![fbProfile.profileID isEqualToString:@""]) {
        [user setObject:fbProfile.profileID forKey:@"fbProfileID"];
        }
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                //Display Alert with Success message & name.
                NSString *alertMessage = [NSString stringWithFormat:@"Congratulations %@, you have successfully registered. You are now free to use the app.", self.inFirstName.text];
                
                [self performSegueWithIdentifier:@"FBRegSeg" sender:sender];
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful Registration" message:alertMessage delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
                [alert show];
                
                
            }
            
            
            else{
                NSString *errorString = [[error userInfo] objectForKey:@"error"];
                
                //Display Alert with ERROR message.
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unsuccessful Registration" message:errorString delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
                [alert show];
            }
        }];
        
        
        
        
        
        
    }
    else{
        //Passwords did not match up
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unsuccessful Registration" message:@"Passwords did not match up" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}
@end

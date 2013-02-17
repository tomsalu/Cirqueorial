//
//  FBRegistrationViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 17/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "FBRegistrationViewController.h"
#import "AppDelegate.h"

@interface FBRegistrationViewController ()

@end

@implementation FBRegistrationViewController

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
    
        
        //[activity startAnimating];
        
        NSLog(@"session state change");
        
        if (FBSession.activeSession.isOpen) {
            NSLog(@"IF");

            
            [FBRequestConnection
             startForMeWithCompletionHandler:^(FBRequestConnection *connection,
                                               id<FBGraphUser> user,
                                               NSError *error){
                 
                 self.inFirstName.text = user.name;
                 self.inUsername.text = user.username;
                 self.inEmail.text = [user objectForKey:@"email"];
                 
                     
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

@end

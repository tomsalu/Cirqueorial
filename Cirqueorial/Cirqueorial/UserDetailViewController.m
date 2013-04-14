//
//  UserDetailViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 22/02/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "UserDetailViewController.h"

@interface UserDetailViewController ()

@end

@implementation UserDetailViewController

@synthesize userDetailArray;
@synthesize userObject = _userObject;

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
    
    self.firstName.text = [_userObject objectForKey:@"First_Name"];
    self.surname.text = [_userObject objectForKey:@"Surname"];
    self.username.text = [_userObject objectForKey:@"username"];
    
    NSLog(@"Firstname: %@", self.userObject.objectId);
    
//    NSLog(@"User Detail Page Array: %i", userDetailArray.count);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)followButton:(id)sender {
    
    //Find out the current user //
    PFUser *currentUser = [PFUser currentUser];
    
    //Find out if already following//
    PFQuery *followQuery = [PFUser query];
    [followQuery whereKey:@"objectId" equalTo:currentUser.objectId];
    [followQuery whereKey:@"following" equalTo:self.userObject.objectId];
    
    NSLog(@"The Follow Query: %@", [followQuery findObjects]);
    
    NSArray *followArray = [followQuery findObjects];
    
    bool isFollowing = NO;
    
    for (int i = 0; i < followArray.count; i++) {
        NSLog(@"Follow Array: %@", followArray[i]);
        isFollowing = YES;
        
    }

    if (isFollowing) {
        NSLog(@"Is Following");
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Already Following" message:nil delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil , nil];
        [alert show];
        
        
    }
    else if (!isFollowing){
            NSLog(@"Not Following");
            //Add the open user's ID to the current users 'following' array
            [currentUser addObject:self.userObject.objectId forKey:@"following"];
            //Save
            [currentUser saveInBackground];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Now Following" message:nil delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil , nil];
        [alert show];
    }
    else{
            NSLog(@"Broke");
    }
    

    
    

    
    
    


    


     
    
    
    
    
    
    
    
    
    
}
@end

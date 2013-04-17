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

bool isFollowing;
PFUser *currentUser;
PFQuery *followQuery;

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
    
    /////////////Is the user already following this person? ////////////////
    
    //Find out the current user //
    currentUser = [PFUser currentUser];
    
    //Find out if already following//
    followQuery = [PFUser query];
    [followQuery whereKey:@"objectId" equalTo:currentUser.objectId];
    [followQuery whereKey:@"following" equalTo:self.userObject.objectId];
    NSArray *followArray = [followQuery findObjects];
    isFollowing = NO;
    
    for (int i = 0; i < followArray.count; i++) {
        isFollowing = YES;
    }
    
    if (isFollowing) {
        self.followLabel.title = @"Unfollow";
    }
    else{
        self.followLabel.title = @"Follow";
        
    }

    //////////////////How many tricks can they do?//////////////////
    
    NSMutableArray *trickCount = [_userObject objectForKey:@"canDo"];
    self.noTricks.text = [NSString stringWithFormat:@"%i Tricks", trickCount.count];
    
    ///////////////// Level ///////////////////////
    
    int totalXP = [[_userObject objectForKey:@"xp"] intValue];
    int level = (totalXP / 400)+1;
    self.levelLabel.text =[NSString stringWithFormat:@"%i", level];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)followButton:(id)sender {

    if (isFollowing) {

        NSMutableArray *followArray = [currentUser objectForKey:@"following"];
        
        for (int i = 0; i < followArray.count; i++) {
            if ([followArray[i] isEqualToString:self.userObject.objectId]) {
                [followArray removeObjectAtIndex:i];
            }
        }

        
        [currentUser setObject:followArray forKey:@"following"];
        [currentUser saveInBackground];
        isFollowing = NO;

        self.followLabel.title = @"Follow";

        
        
        
    }
    else if (!isFollowing){
            //Add the open user's ID to the current users 'following' array
            [currentUser addObject:self.userObject.objectId forKey:@"following"];
            //Save
            [currentUser saveInBackground];
            isFollowing = YES;
        
            self.followLabel.title = @"Unfollow";
        
    }
    else{
            NSLog(@"Broke");
    }
    

    
    

    
    
    


    


     
    
    
    
    
    
    
    
    
    
}
@end

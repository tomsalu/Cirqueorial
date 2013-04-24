//
//  ProfileViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 28/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"

@interface ProfileViewController ()
@property (strong, nonatomic) IBOutlet UITextView *userNameBox;
@property (strong, nonatomic) IBOutlet FBProfilePictureView *userProfileImage;
@property (strong, nonatomic) IBOutlet UITextView *userInfoTextView;

@end

@implementation ProfileViewController

@synthesize fbProfilePic;
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

    _userObject = [PFUser currentUser];
    
    //Displays the appropriate information by retrieving the data from the database
    
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
    
    NSMutableArray *trickCount = [currentUser objectForKey:@"canDo"];
    self.noTricks.text = [NSString stringWithFormat:@"%i Tricks", trickCount.count];
    
    ///////////////// Level ///////////////////////
    
    int totalXP = [[currentUser objectForKey:@"xp"] intValue];
    int level = (totalXP / 400)+1;
    self.levelLabel.text =[NSString stringWithFormat:@"%i", level];
    
    /////////////// Profile Pic ////////////////////

    fbProfilePic.profileID = [currentUser objectForKey:@"fbProfileID"];
    
    
    
    
    
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


//OLD PROFILE CODE
/*

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
    [[NSNotificationCenter defaultCenter]
     addObserver: self
     selector:@selector(sessionStateChanged:)
     name:FBSessionStateChangedNotification
     object:nil];
    
    //Check session for cached token to show proper authenticated UI (Login / Logout)
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate openSessionWithAllowLoginUI:NO];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter]
     removeObserver:self];
}

- (void) sessionStateChanged:(NSNotification*) notification{
    
    
    if (FBSession.activeSession.isOpen) {
        NSLog(@"IF");
        //[self.authButton setTitle:@"Logout" forState:UIControlStateNormal];
        //self.publishButton.hidden = NO;
        self.userInfoTextView.hidden = NO;
        self.userNameBox.hidden = NO;
        
        [FBRequestConnection
         startForMeWithCompletionHandler:^(FBRequestConnection *connection,
                                           id<FBGraphUser> user,
                                           NSError *error){
             if (!error) {
                 NSString *userInfo = @"";
                 NSString *userNameOnly = @"";
                 
                 //Gets the users name
                 userNameOnly = [userNameOnly
                                  stringByAppendingString:[NSString stringWithFormat:@"%@",
                                                           user.name]];
                 
                 //Birthday
                 userInfo = [userInfo
                              stringByAppendingString:[NSString stringWithFormat:@"Birthday: %@\n\n",
                                                       user.birthday]];
                 
                 userInfo = [userInfo
                              stringByAppendingString:
                              [NSString stringWithFormat:@"Location: %@\n\n",
                               [user.location objectForKey:@"name"]]];
                 
                 userInfo = [userInfo
                              stringByAppendingString:
                              [NSString stringWithFormat:@"Locale: %@\n\n",
                               [user objectForKey:@"locale"]]];
                 
                 if ([user objectForKey:@"languages"]) {
                     NSArray *languages = [user objectForKey:@"languages"];
                     NSMutableArray *languageNames = [[NSMutableArray alloc] init];
                     for (int i = 0; i < [languages count]; i++) {
                         [languageNames addObject:[[languages
                                                    objectAtIndex:i]
                                                   objectForKey:@"name"]];
                     }
                     
                     userInfo = [userInfo
                                  stringByAppendingString:
                                  [NSString stringWithFormat:@"Languages: %@\n\n",
                                   languageNames]];
                 }
                 
                 self.userProfileImage.profileID = user.id;
                 
                 //Display User Info
                 self.userInfoTextView.text = userInfo;
                 self.userNameBox.text = userNameOnly;
                 
                 
             }
         }
         ];

        
        
        
    }
    else{
        NSLog(@"ELSE");
        //self.publishButton.hidden = YES;
        //[self.authButton setTitle:@"Login" forState:UIControlStateNormal];
        
         if (FBSession.activeSession.isOpen) {
         [appDelegate closeSession];
         }
    }
}

*/

@end

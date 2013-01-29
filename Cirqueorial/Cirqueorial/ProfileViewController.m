//
//  ProfileViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 28/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"

@interface ProfileViewController ()
@property (strong, nonatomic) IBOutlet UITextView *userNameBox;
@property (strong, nonatomic) IBOutlet FBProfilePictureView *userProfileImage;
@property (strong, nonatomic) IBOutlet UITextView *userInfoTextView;

@end

@implementation ProfileViewController

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
        /*
         if (FBSession.activeSession.isOpen) {
         [appDelegate closeSession];
         }*/
    }
}


@end

//
//  ViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 25/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "FBRegistrationViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *userNameBox;
@property (strong, nonatomic) IBOutlet FBProfilePictureView *userProfileImage;
@property (strong, nonatomic) IBOutlet UITextView *userInfoTextView;

@property (strong, nonatomic) NSString *userInfo;
@property (strong, nonatomic) NSString *userNameOnly;

@end

@implementation ViewController


- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
	// Do any additional setup after loading the view, typically from a nib.




    //Changes the back button to 'Logout'
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Logout"
                                   style: UIBarButtonItemStyleBordered
                                   target: nil action: nil];
    
    [self.navigationItem setBackBarButtonItem: backButton];
    
    

    
    [[NSNotificationCenter defaultCenter]
     addObserver: self
     selector:@selector(sessionStateChanged:)
     name:FBSessionStateChangedNotification
     object:nil];
    
    //Check session for cached token to show proper authenticated UI (Login / Logout)
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate openSessionWithAllowLoginUI:NO];
    
    if (FBSession.activeSession.isOpen) {
        
        [self sessionStateChanged:nil];

    }
    else{
        NSLog(@"Session Change Failure");
    }
    
    
    
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning
{
        NSLog(@"didreceive warning");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter]
     removeObserver:self];
}


- (IBAction)testButton:(id)sender {
    

}

- (IBAction)fbButton:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    
    // User has initiated login, so call the opensession method
    // and show the login UX if necessary.
    [appDelegate openSessionWithAllowLoginUI:YES];
 
    
}

- (IBAction)logoutButton:(id)sender {

    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
        [appDelegate closeSession];
        self.logoutButton.hidden = YES;
        [self.authButton setTitle:@"Login" forState:UIControlStateNormal];
    
    
}

- (void) sessionStateChanged:(NSNotification*) notification{
    
    //[activity startAnimating];
    
        NSLog(@"session state change");
    
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
                    _userInfo = @"";
                    _userNameOnly = @"";
                 
                 //Gets the users name
                 _userNameOnly = [_userNameOnly
                             stringByAppendingString:[NSString stringWithFormat:@"%@",
                                                      user.name]];
                 
                 //Birthday
                 _userInfo = [_userInfo
                             stringByAppendingString:[NSString stringWithFormat:@"Birthday: %@\n\n",
                                                      user.birthday]];
                 
                 _userInfo = [_userInfo
                             stringByAppendingString:
                             [NSString stringWithFormat:@"Location: %@\n\n",
                              [user.location objectForKey:@"name"]]];
                 
                 _userInfo = [_userInfo
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
                     
                     _userInfo = [_userInfo
                                 stringByAppendingString:
                                 [NSString stringWithFormat:@"Languages: %@\n\n",
                                  languageNames]];
                 }
                 
                 self.userProfileImage.profileID = user.id;
                 
                 //Display User Info
                 self.userInfoTextView.text = _userInfo;
                 self.userNameBox.text = _userNameOnly;
                 
                 
             }
         }
        ];
        //self.logoutButton.hidden = NO;
        //[self.authButton setTitle:@"Enter" forState:UIControlStateNormal];
        
        
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


- (IBAction)publishButtonAction:(id)sender {
    
    BOOL dispalyedNativeDialog =
    [FBNativeDialogs presentShareDialogModallyFrom:self
     //set status text
       initialText:@""
             image:[UIImage imageNamed:@"testimage.png"]
               url:nil/*[NSURL URLWithString:@"http:www.nyt.com"]*/
                handler:^(FBNativeDialogResult result, NSError *error) {
        if (error) {
            // Handle Failure
        }
        else{
            if (result == FBNativeDialogResultSucceeded) {
                // Handle Success
            }
            else{
                //Handle User Cancel
            }
        }
     }];
    if (!dispalyedNativeDialog) {
        //
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"showFBReg"]) {
    
        [FBRequestConnection superclass];
    
    }
    
}


@end

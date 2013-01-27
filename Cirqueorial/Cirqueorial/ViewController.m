//
//  ViewController.m
//  Cirqueorial
//
//  Created by Tom Salu on 25/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UITextView *userNameBox;
@property (strong, nonatomic) IBOutlet FBProfilePictureView *userProfileImage;
@property (strong, nonatomic) IBOutlet UITextView *userInfoTextView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
    NSString *htmlString =
    @"<html><object><param name='movie' height=auto value='http://www.youtube.com/v/b_ILDFp5DGA'></param><embed src='http://www.youtube.com/v/b_ILDFp5DGA' type='application/x-shockwave-flash'></embed></object></html>";
    
    
    [self.webView loadHTMLString:htmlString baseURL:nil];
     */
    
    NSString *embedURL = @"<iframe width=\"280\" height=\"200\" src=\"http://www.youtube.com/embed/b_ILDFp5DGA\" frameborder=\"0\" allowfullscreen></iframe>";
    
    [self.webView loadHTMLString:embedURL baseURL:nil];
    
    [[NSNotificationCenter defaultCenter]
     addObserver: self
     selector:@selector(sessionStateChanged:)
     name:FBSessionStateChangedNotification
     object:nil];
    
    //Check session for cached token to show proper authenticated UI (Login / Logout)
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate openSessionWithAllowLoginUI:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter]
     removeObserver:self];
}


- (IBAction)testButton:(id)sender {
    
    NSLog(@"Blah");
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    if (FBSession.activeSession.isOpen) {
        [appDelegate closeSession];
    }
    else{
        // User has initiated login, so call the opensession method
        // and show the login UX if necessary.
        [appDelegate openSessionWithAllowLoginUI:YES];
    }
}

- (void) sessionStateChanged:(NSNotification*) notification{
    if (FBSession.activeSession.isOpen) {
        [self.authButton setTitle:@"Logout" forState:UIControlStateNormal];
        self.publishButton.hidden = NO;
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
        self.publishButton.hidden = YES;
        [self.authButton setTitle:@"Login" forState:UIControlStateNormal];
    }
}


- (IBAction)publishButtonAction:(id)sender {
    
    BOOL dispalyedNativeDialog =
    [FBNativeDialogs presentShareDialogModallyFrom:self
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


@end
